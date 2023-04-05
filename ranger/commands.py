from ranger.api.commands import *
import os
from ranger.core.loader import CommandLoader

#  eval for arg in "rwxXst": cmd("map -o{0} shell -f chmod o-{0} %s".format(arg))
#  $(date +%y-%m-%d_%H-%M)
# $(date +%y-%m-%d_%H-%M)
class rename_date_today(Command):
    """:rename_date_today <today>

    Changes the name of the currently highlighted file to <newname>
    """

    def execute(self):
        from ranger.container.file import File
        from os import access

        new_name = self.rest(1)

        if not new_name:
            return self.fm.notify('Syntax: rename <newname>', bad=True)

        if new_name == self.fm.thisfile.relative_path:
            return None

        if access(new_name, os.F_OK):
            return self.fm.notify("Can't rename: file already exists!", bad=True)

        if self.fm.rename(self.fm.thisfile, new_name):
            file_new = File(new_name)
            self.fm.bookmarks.update_path(self.fm.thisfile.path, file_new)
            self.fm.tags.update_path(self.fm.thisfile.path, file_new.path)
            self.fm.thisdir.pointed_obj = file_new
            self.fm.thisfile = file_new

        return None

    def tab(self, tabnum):
        return self._tab_directory_content()

class extracthere(Command):
    def execute(self):
        """ Extract copied files to current directory """
        copied_files = tuple(self.fm.copy_buffer)

        if not copied_files:
            return

        def refresh(_):
            cwd = self.fm.get_directory(original_path)
            cwd.load_content()

        one_file = copied_files[0]
        cwd = self.fm.thisdir
        original_path = cwd.path
        au_flags = ['-X', cwd.path]
        au_flags += self.line.split()[1:]
        au_flags += ['-e']

        self.fm.copy_buffer.clear()
        self.fm.cut_buffer = False
        if len(copied_files) == 1:
            descr = "extracting: " + os.path.basename(one_file.path)
        else:
            descr = "extracting files from: " + os.path.basename(one_file.dirname)
        obj = CommandLoader(args=['aunpack'] + au_flags \
                + [f.path for f in copied_files], descr=descr)

        obj.signal_bind('after', refresh)
        self.fm.loader.add(obj)

