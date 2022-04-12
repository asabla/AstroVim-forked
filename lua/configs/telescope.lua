local M = {}

function M.config()
  local status_ok, telescope = pcall(require, "telescope")
  if not status_ok then
    return
  end

  local actions = require "telescope.actions"

  local notify_present, _ = pcall(require, "notify")
  if notify_present then
    telescope.load_extension "notify"
  end

  telescope.setup(require("core.utils").user_plugin_opts("plugins.telescope", {
    defaults = {

      prompt_prefix = " ",
      selection_caret = "❯ ",
      path_display = { "truncate" },
      selection_strategy = "reset",
      sorting_strategy = "ascending",
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.55,
          results_width = 0.8,
        },
        vertical = {
          mirror = false,
        },
        width = 0.87,
        height = 0.80,
        preview_cutoff = 120,
      },

      file_ignore_patterns = {
        "node_modules", "dist",
        "bin", "obj"
      },

      mappings = {
        i = {
          ["<C-n>"] = actions.move_selection_next,
          ["<C-p>"] = actions.move_selection_previous,

          ["<C-c>"] = actions.close,

          ["<Down>"] = actions.move_selection_next,
          ["<Up>"] = actions.move_selection_previous,

          ["<CR>"] = actions.select_default,
        },

        n = {
          ["<esc>"] = actions.close,
        },
      },
    },
    pickers = {},
    extensions = {},
  }))
end

return M
