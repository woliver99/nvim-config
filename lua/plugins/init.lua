return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = function()

      vim.api.nvim_set_hl(0, "NvimTreeGitDirty", {fg = "#e7c787",})
      vim.api.nvim_set_hl(0, "NvimTreeGitNew", {fg = "#6ebe8a",})

      return require "configs.nvimtree"
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require "cmp"

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        -- <Tab> to confirm the selection
        ["<Tab>"] = cmp.mapping.confirm({ select = true }),

        -- <S-Tab> (Shift-Tab) to close the completion menu
        ["<S-Tab>"] = cmp.mapping.close(),

        -- <Up> and <Down> to cycle through items
        ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
        ["<Down>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),

        -- <Enter> default behavior
        ["<CR>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            -- If the completion menu is visible, close it
            cmp.close()
            -- Then execute the fallback function, which for <CR> is inserting a new line
            fallback()
          else
            -- If the menu is not visible, just execute the fallback (insert a new line)
            fallback()
          end
        end, { "i", "s" }),
      })
      return opts
    end
  }

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
