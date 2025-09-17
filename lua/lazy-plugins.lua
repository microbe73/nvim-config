require('lazy').setup({
  {
    'sainnhe/everforest',
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.everforest_background = 'soft'
      vim.g.everforest_better_performance = 1
      vim.g.everforest_enable_italic = false
      vim.cmd.colorscheme 'everforest'
    end,
  },
  {
    'skywind3000/asyncrun.vim',
    config = function()
      vim.g.asyncrun_open = 8
      vim.keymap.set('n', '<leader>ag', function()
        vim.fn.feedkeys 'q:iAsyncRun rg --vimgrep '
      end, { desc = 'Async Run grep' })
      vim.keymap.set('n', '<leader>aa', function()
        vim.fn.feedkeys 'q:iAsyncRun '
      end, { desc = 'Async Run Command' })
      vim.keymap.set('n', '<leader>at', function()
        vim.fn.feedkeys 'q:iAsyncRun -mode=term -pos=tab '
      end, { desc = 'Async Run Command in new terminal' })
      vim.keymap.set('n', '<leader>as', '<cmd>AsyncStop<CR>', { desc = 'stop command' })
    end,
  },
  {
    'echasnovski/mini.ai',
    version = '*',
    config = function()
      require('mini.ai').setup { n_lines = 500 }
    end,
  },
  {
    'ronakg/quickr-preview.vim',
    config=function ()
      vim.cmd [[
        let g:quickr_preview_keymaps = 0
        let g:quickr_preview_modifiable = 0
        let g:quickr_preview_size = 10
        let g:quickr_preview_on_cursor = 0
        let g:quickr_preview_position = 'above'
      ]]
      vim.cmd 'nmap <leader>qp <plug>(quickr_preview)'
      vim.cmd 'nmap <leader>qc <plug>(quickr_preview_qf_close)'
    end
  },
  {
    'windwp/nvim-autopairs',
    config = true
  },
  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    config = function()
      require('which-key').setup()

      -- Document existing key chains
      require('which-key').add {
        { '<leader>w', group = 'Workspace' },
        { '<leader>c', group = 'Code' },
        { '<leader>d', group = 'Document' },
        { '<leader>r', group = 'Rename' },
        { '<leader>s', group = 'Search' },
        { '<leader>q', group = 'Quickfix' },
        { '<leader>a', group = 'Async' },
        { '', desc = '', hidden = true, mode = { 'n', 'n', 'n', 'n', 'n' } },
      }
    end,
  },
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
  {
    'vimwiki/vimwiki',
    init = function()
      vim.cmd [[
          set nocompatible
          syntax on
          let g:vimwiki_list = [{'path': '~/vimwiki/',
                        \ 'syntax': 'markdown', 'ext': 'md'}]
          ]]
    end,
  },
  {
    'Apeiros-46B/uiua.vim',
    ft = 'uiua',
    init = function()
      vim.g.uiua_path = '~/.cargo/bin/uiua'
      vim.g.uiua_dark_mode = true
    end,
  },
  {
    'lervag/vimtex',
    init = function()
      -- Use init for configuration, don't use the more common "config".
      vim.g.vimtex_view_method = 'sioyek'
      vim.g.vimtex_view_sioyek_exe = '/Applications/sioyek.app/Contents/MacOS/sioyek'
      vim.g.vimtex_complete_enabled = 1
      vim.g.vimtex_complete_close_braces = 1
      vim.g.vimtex_quickfix_open_on_warning = 0
      vim.cmd 'set conceallevel=2'
      vim.g.vimtex_imaps_leader = ';'
      vim.cmd [[     let g:vimtex_quickfix_ignore_filters = [
          \ '\\headheight is too small',
          \ 'Underfull',
          \ 'Overfull',
          \ 'LaTeX Warning: Label(s) may have changed',
          \ 'Package rerunfilecheck Warning: '
          \] ]]
      vim.cmd [[let g:vimtex_syntax_conceal = {
          \ 'accents': 1,
          \ 'ligatures': 1,
          \ 'cites': 1,
          \ 'fancy': 1,
          \ 'spacing': 1,
          \ 'greek': 1,
          \ 'math_bounds': 1,
          \ 'math_delimiters': 1,
          \ 'math_fracs': 1,
          \ 'math_super_sub': 1,
          \ 'math_symbols': 1,
          \ 'sections': 1,
          \ 'styles': 1,
          \}
]]
    end,
  },
  {
      'jez/vim-better-sml',
      ft = 'sml',
      init = function()
        vim.cmd [[
        augroup vimbettersml
    au!

    " ----- Keybindings -----
    au FileType sml nnoremap <silent> <buffer> <leader>is :SMLReplStart<CR>
    au FileType sml nnoremap <silent> <buffer> <leader>t :SMLTypeQuery<CR>
    au FileType sml nnoremap <silent> <buffer> gd :SMLJumpToDef<CR>

    " open the REPL terminal buffer
    au FileType sml nnoremap <silent> <buffer> <leader>ik :SMLReplStop<CR>
    " build the project (using CM if possible)
    au FileType sml nnoremap <silent> <buffer> <leader>ib :SMLReplBuild<CR>
    " for opening a structure, not a file
    au FileType sml nnoremap <silent> <buffer> <leader>io :SMLReplOpen<CR>
    " use the current file into the REPL (even if using CM)
    au FileType sml nnoremap <silent> <buffer> <leader>iu :SMLReplUse<CR>
    " clear the REPL screen
    au FileType sml nnoremap <silent> <buffer> <leader>ic :SMLReplClear<CR>
    " set the print depth to 100
    au FileType sml nnoremap <silent> <buffer> <leader>ip :SMLReplPrintDepth<CR>

    " ----- Other settings -----

    " Uncomment to try out conceal characters
    au FileType sml setlocal conceallevel=2

    " Uncomment to try out same-width conceal characters
    let g:sml_greek_tyvar_show_tick = 1
    au FileType sml setlocal conceallevel=0
    setlocal textwidth=0
    augroup END
        ]]
      end,
  },
  {
    'ibhagwan/fzf-lua',
    -- or if using mini.icons/mini.nvim
    dependencies = { "echasnovski/mini.icons" },
    opts = {},
    config = function()
      local fzf = require 'fzf-lua'
      fzf.setup({
        keymap = {
          fzf = {
            ['ctrl-q'] = 'select-all+accept',
          },
          builtin = {
            ['<S-Right>'] = 'toggle-preview',
          },
        },
        winopts = {
          preview = { hidden = true },
        },
      }, true)
      vim.keymap.set('n', '<leader>sf', fzf.files, { desc = 'Search Files' })
      vim.keymap.set('n', '<leader>sg', fzf.live_grep, { desc = 'Search by Grep' })
      vim.keymap.set('n', '<leader>s.', fzf.oldfiles, { desc = 'Search Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader>sb', fzf.buffers, { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<leader>sQ', fzf.quickfix_stack, { desc = 'search qf lists history' })
      vim.keymap.set('n', '<leader>sq', fzf.quickfix, { desc = 'search qf list entries' })
      vim.keymap.set('n', '<leader>sn', function()
        fzf.files { cwd = '~/.config/nvim' }
      end, { desc = '[S]earch [N]eovim files' })
      vim.keymap.set('n', '<leader>sw', function()
        fzf.files { cwd = '~/vimwiki/' }
      end, { desc = 'Search wiki files' })
      vim.keymap.set('n', '<leader>sm', fzf.manpages, { desc = 'Search manual pages' })
      vim.keymap.set('n', '<leader>s/', fzf.grep_curbuf, { desc = 'Grep in current buffer' })
    end,
  },
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = { 'bash', 'c', 'html', 'lua', 'luadoc', 'markdown', 'vim', 'vimdoc' },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby', 'latex' },
      },
      indent = { enable = true, disable = { 'ruby', 'latex' } },
    },
    config = function(_, opts)
      -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
  {
    'whonore/Coqtail',
    ft = 'coq',
    init = function()
      vim.cmd 'filetype plugin on'
      vim.cmd "let b:coqtail_coq_path = '~/.opam/default/bin/'"
      vim.cmd 'let g:coqtail_noimap=1'
    end,
  },
  {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  -- Optional dependencies
  dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  init = function()
    require('oil').setup {
      -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
      default_file_explorer = true,
      columns = {
        'permissions',
        'mtime',
        'size',
        'icon',
      },
      lsp_file_methods = {
        -- Enable or disable LSP file operations
        enabled = false,
        -- Time to wait for LSP file operations to complete before skipping
        timeout_ms = 1000,
        -- Set to true to autosave buffers that are updated with LSP willRenameFiles
        -- Set to "unmodified" to only save unmodified buffers
        autosave_changes = false,
      },
      constrain_cursor = 'name',
    }
    vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
    vim.keymap.set('n', '<leader>-', '<CMD>Oil --float<CR><CMD>set nu<CR><CMD>set rnu<CR>', { desc = 'Oil floating window' })
  end,
  },
  {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = { 'L3MON4D3/LuaSnip', version = 'v2.*', build = 'make install_jsregexp' },
  -- use a release tag to download pre-built binaries
  version = '1.*',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  config = function()
    local luasnip = require 'luasnip'
    require('luasnip.loaders.from_lua').lazy_load { paths = '~/.config/nvim/LuaSnip/' }

    luasnip.config.setup {}
    require('luasnip').config.set_config { -- Setting LuaSnip config

      -- Enable autotriggered snippets
      enable_autosnippets = true,

      -- Use Tab (or some other key if you prefer) to trigger visual selection
      store_selection_keys = '<Tab>',
      update_events = 'TextChanged,TextChangedI',
    }
    local opts = {
      -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
      -- 'super-tab' for mappings similar to vscode (tab to accept)
      -- 'enter' for enter to accept
      -- 'none' for no mappings
      --
      -- All presets have the following mappings:
      -- C-space: Open menu or open docs if already open
      -- C-n/C-p or Up/Down: Select next/previous item
      -- C-e: Hide menu
      -- C-k: Toggle signature help (if signature.enabled = true)
      --
      -- See :h blink-cmp-config-keymap for defining your own keymap
      keymap = {
        preset = 'default',
        ['<C-l>'] = { 'snippet_forward', 'fallback' },
        ['<C-h>'] = { 'snippet_backward', 'fallback' },
        ['<Tab>'] = { 'select_and_accept', 'fallback' },
        ['<C-f>'] = { 'fallback' },
        ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
        ['<C-space>'] = { 'show_documentation' },
        ["<C-e>"] = { "hide", "show" }
      },

      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono',
      },
      signature = {
        enabled = true,
      },
      -- (Default) Only show the documentation popup when manually triggered
      completion = {
        documentation = { auto_show = true },
        menu = { auto_show = true },
        accept = {
          -- Write completions to the `.` register
          dot_repeat = true,
          -- Create an undo point when accepting a completion item
          create_undo_point = true,
          -- How long to wait for the LSP to resolve the item with additional information before continuing as-is
          resolve_timeout_ms = 100,
          -- Experimental auto-brackets support
          auto_brackets = {
            -- Whether to auto-insert brackets for functions
            enabled = true,
            -- Default brackets to use for unknown languages
            default_brackets = { '(', ')' },
            -- Overrides the default blocked filetypes
            override_brackets_for_filetypes = {},
            -- Synchronously use the kind of the item to determine if brackets should be added
            kind_resolution = {
              enabled = true,
              blocked_filetypes = { 'typescriptreact', 'javascriptreact', 'vue', 'tex' },
            },
            -- Asynchronously use semantic token to determine if brackets should be added
            semantic_token_resolution = {
              enabled = true,
              blocked_filetypes = { 'java' },
              -- How long to wait for semantic tokens to return before assuming no brackets should be added
              timeout_ms = 400,
            },
          },
        },
      },
      snippets = { preset = 'luasnip' },
      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = { default = { 'lsp', 'path' } },
      cmdline = {

        keymap = {
          -- recommended, as the default keymap will only show and select the next item
          ['<Tab>'] = { 'show', 'accept' },
        },
        completion = {
          menu = {
            auto_show = function(_)
              return vim.fn.getcmdtype() == ':' and not vim.fn.getcmdline():match '^AsyncRun'
              -- enable for inputs as well, with:
              -- or vim.fn.getcmdtype() == '@'
            end,
          },
        },
      },
      -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
      -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
      -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
      -- See the fuzzy documentation for more information
      fuzzy = { implementation = 'prefer_rust_with_warning' },
    }
    local cmp = require 'blink.cmp'
    cmp.setup(opts)
  end,
  },
  {
    { -- LSP Configuration & Plugins
      'neovim/nvim-lspconfig',
      dependencies = {
        'saghen/blink.cmp',
        "netmute/ctags-lsp.nvim",
      { 'folke/neodev.nvim', enabled=false, opts = {},},
      },
      config = function()
        require("lspconfig").ctags_lsp.setup({
              filetypes = { "ruby" },
        })
        vim.api.nvim_create_autocmd('LspAttach', {
          group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
          callback = function(event)
            local map = function(keys, func, desc)
              vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
            end
            map('gI', function()
              vim.lsp.buf.implementation { reuse_win = true }
            end, '[G]oto [I]mplementation')

            map('<leader>D', function()
              vim.lsp.buf.type_definition { reuse_win = true }
            end, 'Type [D]efinition')
            map('<leader>ds', vim.lsp.buf.document_symbol, '[D]ocument [S]ymbols')
            map('<leader>ws', vim.lsp.buf.workspace_symbol, '[W]orkspace [S]ymbols')
            map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
            map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
            map('K', vim.lsp.buf.hover, 'Hover Documentation')
            map('gd', vim.lsp.buf.definition, '[G]oto [D]efiniton')
            map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
            local client = vim.lsp.get_client_by_id(event.data.client_id)
            if client and client.server_capabilities.documentHighlightProvider then
              vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                buffer = event.buf,
                callback = vim.lsp.buf.document_highlight,
              })

              vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                buffer = event.buf,
                callback = vim.lsp.buf.clear_references,
              })
            end
          end,
        })
        local servers = {
          clangd = {},
          rust_analyzer = {
            settings = {
              ['rust-analyzer'] = {
                diagnostics = {
                  enable = false,
                  refreshSupport = false,
                },
              },
            },
          },
          texlab = {},
          basedpyright = {
          },
          millet = {
            name = 'millet',
            cmd = { 'millet-ls' },
            filetypes = { 'sml' },
            root_dir = vim.fs.root(0, { 'millet.toml' }),
            single_file_support = true,
            autostart = true,
          },
          coq_lsp = {},
          lua_ls = {
            settings = {
              Lua = {
                completion = {
                  callSnippet = 'Replace',
                },
                -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
                diagnostics = { disable = { 'missing-fields' } },
              },
            },
          },
        }
        for servername, server in pairs(servers) do
          require('lspconfig')[servername].setup(server)
        end
      end,
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'echasnovski/mini.icons' },
    init = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          always_show_tabline = true,
          globalstatus = false,
          refresh = {
            statusline = 100,
            tabline = 100,
            winbar = 100,
          },
        },
        tabline = {
          lualine_a = {
            {
              'buffers',
              show_filename_only = true, -- Shows shortened relative path when set to false.
              hide_filename_extension = false, -- Hide filename extension when set to true.
              show_modified_status = true, -- Shows indicator when the buffer is modified.
              filetype_names = {
                TelescopePrompt = 'Telescope',
                dashboard = 'Dashboard',
                packer = 'Packer',
                fzf = 'FZF',
                alpha = 'Alpha',
              },
              mode = 0, -- 0: Shows buffer name
              -- 1: Shows buffer index
              -- 2: Shows buffer name + buffer index
              -- 3: Shows buffer number
              -- 4: Shows buffer name + buffer number

              max_length = vim.o.columns,
            },
          },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {

            function()
              return vim.fn.getcwd(0)
            end,
          },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff' },
          lualine_c = {
            {
              'filename',
              path = 4,
              newfile_status = true,
              symbols = { modified = '+', readonly = '-', unnamed = '[No Name]' },
            },
            function()
              return vim.g.asyncrun_status
            end,
          },
          lualine_x = { 'encoding', 'progress' },
          lualine_y = { 'diagnostics' },
          lualine_z = { 'location' },
        },
      }
      local map = vim.api.nvim_set_keymap
      local opts = { noremap = true, silent = true }

      -- Goto buffer in position...
      map('n', '<A-1>', '<Cmd>LualineBuffersJump! 1<CR>', opts)
      map('n', '<A-2>', '<Cmd>LualineBuffersJump! 2<CR>', opts)
      map('n', '<A-3>', '<Cmd>LualineBuffersJump! 3<CR>', opts)
      map('n', '<A-4>', '<Cmd>LualineBuffersJump! 4<CR>', opts)
      map('n', '<A-5>', '<Cmd>LualineBuffersJump! 5<CR>', opts)
      map('n', '<A-6>', '<Cmd>LualineBuffersJump! 6<CR>', opts)
      map('n', '<A-7>', '<Cmd>LualineBuffersJump! 7<CR>', opts)
      map('n', '<A-8>', '<Cmd>LualineBuffersJump! 8<CR>', opts)
      map('n', '<A-9>', '<Cmd>LualineBuffersJump! 9<CR>', opts)
      map('n', '<A-0>', '<Cmd>LualineBuffersJump! $<CR>', opts)
      map('n', '<A-c>', '<Cmd>bdelete<CR>', opts)
    end,
  }
},
  {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- vim: ts=2 sts=2 sw=2 et
