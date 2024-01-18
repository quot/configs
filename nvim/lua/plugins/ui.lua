return {
  --####################################################################################
  --## COLOR SCHEMES ##
  --####################################################################################

  -- { "ellisonleao/gruvbox.nvim" },
  { "rebelot/kanagawa.nvim" },
  { "NTBBloodbath/doom-one.nvim" },
  -- { "folke/tokyonight.nvim" },
  { "jacoborus/tender.vim" },
  { "rmehri01/onenord.nvim" },

  -- load colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onenord",
    },
  },

  --####################################################################################
  --## UI PLUGINS ##
  --####################################################################################
  {
    "folke/zen-mode.nvim",
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode Toggle" } },
    opts = {
      window = {
        backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
        -- height and width can be:
        --  an absolute number of cells when > 1
        --  a percentage of the width / height of the editor when <= 1
        --  a function that returns the width or the height
        width = 180, -- width of the Zen window
        height = 1, -- height of the Zen window
        -- by default, no options are changed for the Zen window
        -- uncomment any of the options below, or add other vim.wo options you want to apply
        options = {
          -- signcolumn = "no", -- disable signcolumn
          -- number = false, -- disable number column
          -- relativenumber = false, -- disable relative numbers
          -- cursorline = false, -- disable cursorline
          -- cursorcolumn = false, -- disable cursor column
          -- foldcolumn = "0", -- disable fold column
          -- list = false, -- disable whitespace characters
        },
      },

      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },

  --####################################################################################
  --## Buffer centering ##
  --####################################################################################
  {
    "shortcuts/no-neck-pain.nvim",
    version = "*",
    lazy = true,
    event = { "BufReadPre" },
    opts = {
      width = 180,
      autocmds = {
        enableOnVimEnter = true,
        enableOnTabEnter = true,
        reloadOnColorSchemeChange = true,
      },
      buffers = {
        colors = {
          blend = -0.1,
        },
      },
    },
  },

  --####################################################################################
  --## START SCREEN MENU ##
  --####################################################################################
  {
    "nvimdev/dashboard-nvim",
    opts = {
      config = {
        header = {
          [[                                                                       ]],
          [[                                                                       ]],
          [[                                                                       ]],
          [[                                                                       ]],
          [[                                                                     ]],
          [[       ████ ██████           █████      ██                     ]],
          [[      ███████████             █████                             ]],
          [[      █████████ ███████████████████ ███   ███████████   ]],
          [[     █████████  ███    █████████████ █████ ██████████████   ]],
          [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
          [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
          [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
          [[                                                                       ]],
          [[                                                                       ]],
          [[                                                                       ]],
        },
      },
    },
  },

  -- {
  --   "goolord/alpha-nvim",
  --   opts = function(_, opts)
  --     local dashboard = require("alpha.themes.dashboard")
  --
  --     dashboard.section.buttons.val = {
  --       dashboard.button("f", "󰱼 " .. " Find file", ":Telescope find_files <CR>"),
  --       dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
  --       dashboard.button("r", "󱋡 " .. " Recent files", ":Telescope oldfiles <CR>"),
  --       dashboard.button("g", "󱩾 " .. " Find text", ":Telescope live_grep <CR>"),
  --       dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
  --       dashboard.button("s", "󰦛 " .. " Restore Session", [[:lua require("persistence").load() <cr>]]),
  --       dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
  --       dashboard.button("q", " " .. " Quit", ":qa<CR>"),
  --     }
  --
  --     dashboard.section.header.opts.hl = "Comment"
  --     dashboard.section.header.val = {
  --       [[ =================     ===============     ===============   ========  ======== ]],
  --       [[ \\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . // ]],
  --       [[ ||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .|| ]],
  --       [[ || . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . || ]],
  --       [[ ||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .|| ]],
  --       [[ || . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . || ]],
  --       [[ ||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .|| ]],
  --       [[ || . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . || ]],
  --       [[ ||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.|| ]],
  --       [[ ||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `|| ]],
  --       [[ ||    `'         || ||         `'    || ||    `'         || ||   | \  / |   || ]],
  --       [[ ||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   || ]],
  --       [[ ||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   || ]],
  --       [[ ||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   || ]],
  --       [[ ||   .=='    _-'          `-__\._-'         `-_./__-'         `' |. /|  |   || ]],
  --       [[ ||.=='    _-'                                                     `' |  /==.|| ]],
  --       [[ =='    _-'                        N E O V I M                         \/   `== ]],
  --       [[ \   _-'                                                                `-_   / ]],
  --       [[  `''                                                                      ``'  ]],
  --     }
  --
  --     -- {
  --     --   "            :h-                                  Nhy`               ",
  --     --   "           -mh.                           h.    `Ndho               ",
  --     --   "           hmh+                          oNm.   oNdhh               ",
  --     --   "          `Nmhd`                        /NNmd  /NNhhd               ",
  --     --   "          -NNhhy                      `hMNmmm`+NNdhhh               ",
  --     --   "          .NNmhhs              ```....`..-:/./mNdhhh+               ",
  --     --   "           mNNdhhh-     `.-::///+++////++//:--.`-/sd`               ",
  --     --   "           oNNNdhhdo..://++//++++++/+++//++///++/-.`                ",
  --     --   "      y.   `mNNNmhhhdy+/++++//+/////++//+++///++////-` `/oos:       ",
  --     --   " .    Nmy:  :NNNNmhhhhdy+/++/+++///:.....--:////+++///:.`:s+        ",
  --     --   " h-   dNmNmy oNNNNNdhhhhy:/+/+++/-         ---:/+++//++//.`         ",
  --     --   " hd+` -NNNy`./dNNNNNhhhh+-://///    -+oo:`  ::-:+////++///:`        ",
  --     --   " /Nmhs+oss-:++/dNNNmhho:--::///    /mmmmmo  ../-///++///////.       ",
  --     --   "  oNNdhhhhhhhs//osso/:---:::///    /yyyyso  ..o+-//////////:/.      ",
  --     --   "   /mNNNmdhhhh/://+///::://////     -:::- ..+sy+:////////::/:/.     ",
  --     --   "     /hNNNdhhs--:/+++////++/////.      ..-/yhhs-/////////::/::/`    ",
  --     --   "       .ooo+/-::::/+///////++++//-/ossyyhhhhs/:///////:::/::::/:    ",
  --     --   "       -///:::::::////++///+++/////:/+ooo+/::///////.::://::---+`   ",
  --     --   "       /////+//++++/////+////-..//////////::-:::--`.:///:---:::/:   ",
  --     --   "       //+++//++++++////+++///::--                 .::::-------::   ",
  --     --   "       :/++++///////////++++//////.                -:/:----::../-   ",
  --     --   "       -/++++//++///+//////////////               .::::---:::-.+`   ",
  --     --   "       `////////////////////////////:.            --::-----...-/    ",
  --     --   "        -///://////////////////////::::-..      :-:-:-..-::.`.+`    ",
  --     --   "         :/://///:///::://::://::::::/:::::::-:---::-.-....``/- -   ",
  --     --   "           ::::://::://::::::::::::::----------..-:....`.../- -+oo/ ",
  --     --   "            -/:::-:::::---://:-::-::::----::---.-.......`-/.      ``",
  --     --   "           s-`::--:::------:////----:---.-:::...-.....`./:          ",
  --     --   "          yMNy.`::-.--::..-dmmhhhs-..-.-.......`.....-/:`           ",
  --     --   "         oMNNNh. `-::--...:NNNdhhh/.--.`..``.......:/-              ",
  --     --   "        :dy+:`      .-::-..NNNhhd+``..`...````.-::-`                ",
  --     --   "                        .-:mNdhh:.......--::::-`                    ",
  --     --   "                           yNh/..------..`                          ",
  --     --   "                                                                    ",
  --     -- }
  --   end,
  -- },
}
