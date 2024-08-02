return {
  {
    "https://github.com/folke/flash.nvim",
    opts = {
      highlight = {
        backdrop = false,
      },
      modes = {
        search = {
          enabled = false,
        },
        char = {
          jump_labels = true,
          highlight = {
            backdrop = false,
          },
        },
      },
      vscode=true
    },
  },

  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- disable a keymap
      keys[#keys + 1] = { "K", false }
      keys[#keys + 1] = { "{", vim.lsp.buf.hover }
    end,
  },

  {
    "rcarriga/nvim-notify",
    opts = {
      level = 3,
      render = "minimal",
      stages = "static",
    },
  },

  {
    "echasnovski/mini.indentscope",
    opts = {
      draw = { animation = require("mini.indentscope").gen_animation.none() },
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      close_if_last_window = true,
      filesystem = {
        filtered_items = {
          visible = true,
        },
      },
      window = {
        mappings = {
          h = "close_node",
          l = "open",
        },
      },
    },
  },

  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },

  { "rcarriga/nvim-notify", enabled = false },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          -- if cmp.visible() then
          --   -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
          --   cmp.select_next_item()
          -- -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
          -- -- this way you will only jump inside the snippet region
          -- if require("copilot.suggestion").is_visible() then
          --   require("copilot.suggestion").accept()
          if luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          -- elseif has_words_before() then
          --   cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<C-CR>"] = cmp.mapping(function(fallback)
          if require("copilot.suggestion").is_visible() then
            require("copilot.suggestion").accept()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<C-j>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, { "i", "s" }),
        -- ["<S-Tab>"] = cmp.mapping(function(fallback)
        --   if cmp.visible() then
        --     cmp.select_prev_item()
        --   elseif luasnip.jumpable(-1) then
        --     luasnip.jump(-1)
        --   else
        --     fallback()
        --   end
        -- end, { "i", "s" }),
        ["<C-k>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = {
          { "mode", separator = { right = "", left = "" }, right_padding = 2 },
        },
        lualine_z = {
          {
            function()
              return "󰇥"
            end,
            separator = { right = "", left = "" },
            right_padding = 2,
          },
        },
      },
    },
  },

  {
    "folke/which-key.nvim",
    opts = {
      window = {
        border = "single",
      },
    },
  },

  {
    "folke/noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true,
      },
    },
  },
}
