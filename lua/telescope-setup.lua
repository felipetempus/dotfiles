-- local actions = require("telescope.actions")

require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        -- ["<esc>"] = actions.close
      },
      n = {
        ["J"] = "preview_scrolling_down",
        ["K"] = "preview_scrolling_up",
      }
    }
  },

  pickers = {
     oldfiles = {
	only_cwd = true
      },
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
      file_browser = {
	hidden = true,
	cwd_to_path = true,
	grouped = true,
      },
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}

require("telescope").load_extension "file_browser"
