local m = {}

-- ⯅ ⯆ ⯇ 🜂  🜄 ⛬ ⛬ ⭘    廓   遲ﳟ      遲 ﳟ  
  --ggl='⛬', git='', npm='', awm='ﳟ', man='', aur='', bbs='',


local colors = {}
colors.xmain_1 = "#16a085" -- "#e74c3c" "#C0392B" -- "#C62828"
colors.xmain_2 = "#00acbd" -- "#e74c3c" "#C0392B" -- "#C62828"
colors.xprpl   = '#5F5FD7'
colors.bg1 = "#1b1c27"
colors.bg2 = "#171821"

colors.blue_dark    = '#0D47A1' -- 900 b
colors.blue_light   = '#2196F3' -- 500
--
colors.green_dark   = '#1B5E20' -- 900 g
colors.green_light  = '#4CAF50' -- 500
--
colors.yellow_dark  = '#E65100' -- 900 o
colors.yellow_light = '#FF9800' -- 500
--
colors.orange_dark  = '#BF360C' -- 900 d-o
colors.orange_light = '#FF5722' -- 500
--
colors.red_dark     = '#B71C1C'	-- 900 r
colors.red_light    = '#F44336' -- 500
--
colors.per_dark     = '#880E4F'	-- 900 p
colors.per_light    = '#E91E63' -- 500
--
colors.purple_light = '#FF005F'
--
colors.bold         = '#5F5FD7'
--
colors.lv0          = '#EF476F'
colors.lv1          = '#AD1457'
colors.lv2          = '#FF6E40'
colors.lv3          = '#0097ab'
colors.lv4          = '#00AF5F'
-- -- [[ -------------------------------- ]] --
-- [>colors.sysload      = '#009999'
colors.bat          = '#FF005F'
colors.temp         = '#AB47BC'
colors.weather      = '#5F87D7'
colors.fs           = '#00875F'
colors.cpu          = '#00AF5F'
colors.mem          = '#00AFAF'
colors.vol          = '#008700'
colors.net_in       = '#00875F'
colors.net_out      = '#00875F'
colors.load         = '#FF005F'
colors.alsabar      = '#0086B3'
colors.net          = '#008765'
-- -- [[ -------------------------------- ]] --
colors.sysload      = '#4527A0'
colors.temp         = '#AD1457'
colors.fs           = '#00695C'
colors.net          = '#283593'
colors.cpu          = '#1565C0'
colors.mem          = '#5F5FD7'
colors.alsabar      = '#0D47A1'
colors.bat          = '#D84315'
-- -- [[ -------------------------------- ]] --
--
-- -- return colors

m.colors = colors

m.search = {
  w = { label='awm', ico=' ',  query = "https://www.google.com/search?q=site:https://awesomewm.org+%s&btnI",  },
  q = { label='ggl', ico='',  query = "https://www.google.com/search?q=%s",                                  },
  y = { label='ytb', ico='',  query = "https://www.youtube.com/results?search_query=%s",                                  },
  Q = { label='ggl', ico='',  query = "https://www.google.com/search?q=%s&btnI",                             },
  g = { label='git', ico='',  query = "https://github.com/search?q=%s&ref=opensearch",                       },
  n = { label='npm', ico='',  query = "https://www.npmjs.org/search?q=%s",                                   },
  a = { label='arc', ico='卑', query = "https://www.google.com/search?q=arch+linux+%s",                       },
  A = { label='Arc', ico='',  query = "https://www.google.com/search?q=arch+linux+%s&btnI",                  },
  m = { label='man', ico='',  query = "https://www.google.com/search?q=linux+%s",                            },
  u = { label='aur', ico='喝', query = "https://aur.archlinux.org/packages/?O=0&K=%s",                        },
  b = { label='bbs', ico='',  query = "https://www.google.com/search?q=site:https://bbs.archlinux.org+%s"    },
  k = { label='wki', ico='樂', query = "https://www.wikipedia.org/w/index.php?title=Special:Search&search=%s" },
  t = { label='tmx', ico='⬓', query = "https://tao-of-tmux.readthedocs.io/en/latest/search.html?q=%s&check_keywords=yes&area=default" },
}

m.web = {
  w = { label='awm', ico='',  value = "https://www.google.com/search?q=site:https://awesomewm.org+%s&btnI",  },
  -- {"W", with_wrapper.chromium(""), "empty"},
  -- {"w", with_wrapper.chromium_app("https://metaory.github.io/"), "home"},
  -- {"g", with_wrapper.chromium("https://github.com"), "github"},
  -- {"a", with_wrapper.chromium("https://anilist.co/search/anime?year=2021&season=SPRING https://anilist.co/search/anime?year=2021&season=WINTER https://nyaa.si/?f=0&c=1_2&q=erai+720"),"anilist"},
  -- {"n", with_wrapper.chromium_app("https://www.netflix.com"), 'ﱄetflix'},
  -- {"y", with_wrapper.chromium_app("https://www.youtube.com"), "youtube"},
}

m.old_search = { ico = '', col = '#000000', ico_img = '/home/metaory/.config/awesome/themes/metaory/icons/apps/Chromium.png',
  icons = { ggl='', git='', npm='ﰩ', awm='', man='', bbs='' },
  bg1 = colors.bg1,
  bg2 = colors.xprpl,
}
-- m.search = { ico = '', col = '#000000', ico_img = '/home/metaory/.config/awesome/themes/metaory/icons/apps/Chromium.png',
--   icons = { ggl='', git='', npm='ﰩ', awm='', man='', bbs='' },
--   bg1 = colors.bg1,
--   bg2 = colors.xprpl,
--   query = {
--     ggl = "https://www.google.com/search?q=%s",
--     ggz = "https://www.google.com/search?q=%s&btnI",
--     git = "https://github.com/search?q=%s&ref=opensearch",
--     npm = "https://www.npmjs.org/search?q=%s",
--     awm = "https://www.google.com/search?q=site:https://awesomewm.org+%s&btnI",
--     arc = "https://www.google.com/search?q=arch+linux+%s&btnI",
--     man = "https://www.google.com/search?q=linux+%s",
--     aur = "https://aur.archlinux.org/packages/?O=0&K=%s",
--     bbs = "https://www.google.com/search?q=site:https://bbs.archlinux.org+%s"
--   }
-- }

return m
