local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

local function info()
    local plugins_count = vim.fn.len(vim.fn.globpath("~/.local/share/nvim/lazy/", "*", 0, 1))
    local datetime = os.date("  %m-%d  %I:%M")
    local version = vim.version()
    local nvim_version_info = "    v" .. version.major .. "." .. version.minor .. "." .. version.patch
    return datetime .. "    Plugins " .. plugins_count .. nvim_version_info
end

dashboard.section.header.val = {
    [[                                          _.oo. ]],
    [[                  _.u[[/;:,.         .odMMMMMM' ]],
    [[               .o888UU[[[/;:-.  .o@P^    MMM^   ]],
    [[              oN88888UU[[[/;::-.        dP^     ]],
    [[             dNMMNN888UU[[[/;:--.   .o@P^       ]],
    [[            ,MMMMMMN888UU[[/;::-. o@^           ]],
    [[            NNMMMNN888UU[[[/~.o@P^              ]],
    [[            888888888UU[[[/o@^-..               ]],
    [[           oI8888UU[[[/o@P^:--..                ]],
    [[        .@^  YUU[[[/o@^;::---..                 ]],
    [[      oMP     ^/o@P^;:::---..                   ]],
    [[   .dMMM    .o@^ ^;::---...                     ]],
    [[  dMMMMMMM@^`       `^^^^                       ]],
    [[ YMMMUP^                                        ]],
}

dashboard.section.footer.val = {
    [[                                                    ]],
    [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
    [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
    [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
    [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
    [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
    [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
    [[                                                    ]],
    [[     ]] .. info()
}

dashboard.section.buttons.val = {
    dashboard.button( "a", "  TODO", ":e ~/Documents/College/TODO.md<cr>"),
    dashboard.button( "b", "  Latex Snippets", ":e ~/.config/nvim/snips/tex.snippets<cr>"),
    dashboard.button( "e", "  Last File", ":e#<1<cr>"),
    dashboard.button( "SPC sr", "  Recent Files"),
    dashboard.button( "SPC sc", "  Config Files"),
    dashboard.button( "l", "  Lazy", ":Lazy<cr>"),
    dashboard.button( "n", "  New File", ":ene<cr>"),
    dashboard.button( "q", "  Quit NVIM", ":qa<cr>"),
}

local h = dashboard.section.header.opts.hl
dashboard.section.header.opts.hl = dashboard.section.footer.opts.hl
dashboard.section.footer.opts.hl = h

alpha.setup(dashboard.config)
