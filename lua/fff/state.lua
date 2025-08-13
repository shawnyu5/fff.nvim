---@module "state"
local M = {}

---@class State
---@field initialized boolean if the file picker as been initialized
---@field base_path string the PWD of the picker
---@field last_scan_time number the last time a scan of the file system as performed
---@field config Config user config

---@class FFFConfigPreviewFiletypeSettings
---@field wrap_lines boolean|nil
---@field tail_lines integer|nil

---@class FFFConfigPreview
---@field enabled boolean
---@field width number
---@field max_lines integer
---@field max_size integer
---@field imagemagick_info_format_str string
---@field line_numbers boolean
---@field wrap_lines boolean
---@field show_file_info boolean
---@field binary_file_threshold integer
---@field filetypes table<string, FFFConfigPreviewFiletypeSettings>

---@class FFFConfigLayout
---@field prompt_position '"top"'|'"bottom"'
---@field preview_position '"right"'|'"left"'
---@field preview_width number
---@field height number
---@field width number

---@class FFFConfigKeymaps
---@field close string
---@field select string
---@field select_split string
---@field select_vsplit string
---@field select_tab string
---@field move_up string[]
---@field move_down string[]
---@field preview_scroll_up string
---@field preview_scroll_down string
---@field toggle_debug string

---@class FFFConfigHL
---@field border string
---@field normal string
---@field cursor string
---@field matched string
---@field title string
---@field prompt string
---@field active_file string
---@field frecency string
---@field debug string

---@class FFFConfigFrecency
---@field enabled boolean
---@field db_path string

---@class FFFConfigLogging
---@field enabled boolean
---@field log_file string
---@field log_level '"debug"'|'"info"'|'"warn"'|'"error"'

---@class FFFConfigUI
---@field wrap_paths boolean
---@field wrap_indent integer
---@field max_path_width integer

---@class FFFConfigImagePreview
---@field enabled boolean
---@field max_width integer
---@field max_height integer

---@class FFFConfigIcons
---@field enabled boolean

---@class FFFConfigDebug
---@field enabled boolean
---@field show_scores boolean

---@class FFFFindFileOpts
---@field git_ignore boolean whether to respect git ignore
---@field hidden boolean whether to show hidden files
---@field git_exclude boolean whether to respect `.git/info/exclude`
---@field git_global boolean whether to respect the global gitignore file, whose path is specified in git's `core.excludesFile` config option.
---@field follow_links boolean whether to follow symbolic links
---@field ignore boolean whether to respect .ignore files

---@class Config
---@field base_path string
---@field max_results integer
---@field max_threads integer
---@field prompt string
---@field title string
---@field ui_enabled boolean
---@field width number
---@field height number
---@field preview FFFConfigPreview
---@field layout FFFConfigLayout
---@field keymaps FFFConfigKeymaps
---@field hl FFFConfigHL
---@field frecency FFFConfigFrecency
---@field logging FFFConfigLogging
---@field ui FFFConfigUI
---@field image_preview FFFConfigImagePreview
---@field icons FFFConfigIcons
---@field debug FFFConfigDebug

-- State
M = {
  initialized = false,
  base_path = nil,
  last_scan_time = 0,
  config = {
    base_path = vim.fn.getcwd(),
    max_results = 100,
    max_threads = 4,
    show_hidden = false,
    ignore_patterns = {},
    preview = {
      enabled = true,
      max_lines = 100,
      max_size = 1024 * 1024, -- 1MB
    },
    keymaps = {
      select = '<CR>',
      vsplit = '<C-v>',
      split = '<C-s>',
      tab = '<C-t>',
      close = '<Esc>',
      preview_up = '<C-u>',
      preview_down = '<C-d>',
    },
    layout = {
      prompt_position = 'top',
      preview_position = 'right',
      preview_width = 0.4,
      height = 0.8,
      width = 0.8,
    },
  },
}

return M
