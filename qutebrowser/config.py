c.fonts.monospace = "'FuraCode NF', 'FiraCode Nerd Font', monospace"
c.tabs.position = "left"
c.colors.tabs.bar.bg = "#1b1d1e"
c.colors.statusbar.normal.bg = "#1b1d1e"
c.colors.completion.category.bg = "#404040"
c.colors.statusbar.command.bg = "#1b1d1e"
c.colors.statusbar.normal.fg = "#fc20bb"
c.colors.statusbar.url.success.https.fg = "#fc20bb"
c.colors.completion.even.bg = "#1b1d1e"
c.colors.completion.odd.bg = "#1b1d1e"
c.colors.completion.fg = "#dddddd"
c.tabs.show = "multiple"
c.tabs.last_close = "default-page"

c.qt.args = ['force-webrtc-ip-handling-policy=disable_non_proxied_udp']
c.content.webrtc_ip_handling_policy = "disable-non-proxied-udp"

config.bind(",m", "hint links spawn umpv {hint-url}")
config.bind(",M", "hint links spawn umpv-bluetooth {hint-url}")
config.bind(";m", "hint --rapid links spawn umpv {hint-url}")
config.bind(";M", "hint --rapid links spawn umpv-bluetooth {hint-url}")

c.downloads.location.directory = "~/downloads"

c.url.searchengines = {"DEFAULT": "https://duckduckgo.com/?q={}",
                       "gg": "https://google.co.uk/search?query={}",
                       "yt": "https://youtube.com/results?search_query={}",
                       "scholar": "https://scholar.google.com/scholar?q={}",
                       "wiki": "https://en.wikipedia.org/w/index.php?search={}",
                       "amaz": "https://amazon.co.uk/s?k={}",
                       "note": "file:///home/alex/notes/{}.html",
                       "ccwiki": "https://wiki.uk.cambridgeconsultants.com/index.php?search={}",
                       "dict": "https://en.wiktionary.org/w/index.php?search={}",
                       "apkmirror": "https://www.apkmirror.com/?s={}"}

c.content.headers.user_agent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36"
c.content.headers.accept_language = "en-US,en;q=0.5"
# c.content.headers.custom = {"accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"} # this breaks so much shit you have no idea

config.bind("xt", "config-cycle tabs.show never multiple")

c.fonts.statusbar = "14pt monospace"
c.fonts.completion.category = "bold 14pt monospace"
c.fonts.completion.entry = "14pt monospace"
c.fonts.downloads = "14pt monospace"
