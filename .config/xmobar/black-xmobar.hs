Config { 
    -- appearance
    font = "Ubuntu Mono Bold 11"
    , additionalFonts = [ "Ubuntu Mono Bold 8.5"
                        , "Monoki Nerd Font 10"
                        , "Monoki Nerd Font 22"
                        , "Monoki Nerd Font 13"
                        ]
    , bgColor =      "#1a1b26"
    , fgColor =      "#a9b1d6"
    , position =     TopH 20
    , lowerOnStart =     True    -- send to bottom of window stack on start
    , hideOnStart =      False   -- start with window unmapped (hidden)
    , allDesktops =      True    -- show on all desktops
    , overrideRedirect = True    -- set the Override Redirect flag (Xlib)
    , pickBroadest =     False   -- choose widest display (multi-monitor)
    , persistent =       True    -- enable/disable hiding (True = disabled)
    , commands = [
      -- logo
      Run Com "echo" ["<fn=4>\xe739</fn>"] "logo" 36000
      -- get workspaces
      , Run UnsafeStdinReader
      -- now playing
      , Run Com ".local/bin/now-playing" [] "playing" 50
      -- pacupdate
      , Run Com "echo" ["<fn=2>\xf0b7e</fn>"] "pacupicon" 3600
      , Run Com ".local/bin/pacup" [] "pacup" 3600
      -- cpu usage %
      , Run Cpu [ "-t", "<fn=2>\xf4bc</fn> <total>%", "-H", "50", "--high", "red"] 20
      -- cpu temp (celcius)
      , Run Com "echo" ["<fn=2>\xf2c9</fn> "] "cpu-temp-icon" 3600
      , Run Com ".local/bin/cpu-temp" [] "cpu-temp" 20
      -- disk space
      , Run DiskU [("/", "<fn=2>\xf0a0</fn> <free>")] [] 60
      -- memory usage
      , Run Memory ["-t", "<fn=2>\xe266</fn> <used>M (<usedratio>%)"] 20
      -- network monitor
      , Run Network "enp34s0" ["-t", "<fn=2>\xf0aa</fn> <tx>kb <fn=2>\xf0ab</fn> <rx>kb"] 20
      -- time and date
      , Run Date           "<fn=2>\xf18fa</fn> %d %b %y - (%H:%M)" "date" 50
      -- volume
      , Run Com "echo" ["<fn=2>\xe638</fn>"] "volicon" 3600
      , Run Com ".local/bin/vol" [] "vol" 1
      -- keyboard layout indicator
      , Run Com "echo" ["<fn=2>\xf030c</fn> "] "kbdicon" 3600
      , Run Kbd [ ("us"  ,"<fn=3>\xf0af2</fn>")
                , ("ara" ,"<fn=3>\xf0aee</fn>")
      ]
    ]
      -- layout
    , sepChar =  "%"
    , alignSep = "}{"
    , template = " <fc=#484848>%logo%</fc> | %UnsafeStdinReader% }{ <fn=1><fc=#484848>%playing%</fc></fn>  <fc=#484848>%pacupicon%  %pacup%</fc> | <fc=#484848>%cpu%</fc> | <fc=#484848>%cpu-temp-icon%%cpu-temp%</fc> | <fc=#484848>%disku%</fc> | <fc=#484848>%memory%</fc> | <fc=#484848>%enp34s0%</fc> | <fc=#484848>%date%</fc> | <fc=#484848>%volicon% %vol%</fc> | <fc=#484848>%kbdicon%%kbd%</fc> "
