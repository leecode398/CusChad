-- Load custom treesitter grammar for org filetype
require("orgmode").setup_ts_grammar()

-- Treesitter configuration
require("nvim-treesitter.configs").setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop,
  -- highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    -- Required for spellcheck, some LaTex highlights and
    -- code block highlights that do not have ts grammar
    additional_vim_regex_highlighting = { "org" },
  },
  ensure_installed = {}, -- Or run :TSUpdate org
}

require("orgmode").setup {
  org_agenda_files = { "~/OneDrive/org/*", "~/my-orgs/**/*" },
  org_default_notes_file = "~/OneDrive/org/note.org",
  org_todo_keywords = { "TODO", "WAITING", "|", "DONE", "DELEGATED" },
  org_todo_keyword_faces = {
    WAITING = ":foreground green :weight bold",
    DELEGATED = ":background #FFFFFF :slant italic :underline on",
    TODO = ":background #000000 :foreground red", -- overrides builtin color for `TODO` keyword
  },
  win_split_mode = function(name)
    local bufnr = vim.api.nvim_create_buf(false, true)
    --- Setting buffer name is required
    vim.api.nvim_buf_set_name(bufnr, name)

    local fill = 0.8
    local width = math.floor((vim.o.columns * fill))
    local height = math.floor((vim.o.lines * fill))
    local row = math.floor((((vim.o.lines - height) / 2) - 1))
    local col = math.floor(((vim.o.columns - width) / 2))

    vim.api.nvim_open_win(bufnr, true, {
      relative = "editor",
      width = width,
      height = height,
      row = row,
      col = col,
      style = "minimal",
      border = "rounded",
    })
  end,
  org_hide_leading_stars = false,
  org_deadline_warning_days = 14,
  org_agenda_min_height = 16,
  org_agenda_span = "week", -- day/week/month/year/number of days
  org_agenda_start_on_weekday = 1,
  org_agenda_start_day = nil, -- start from today + this modifier
  calendar_week_start_day = 1,
  org_capture_templates = {
    t = {
      description = "Task",
      template = "* TODO %?\n  %u",
    },
  },
  org_agenda_skip_scheduled_if_done = false,
  org_agenda_skip_deadline_if_done = false,
  org_agenda_text_search_extra_files = {},
  org_priority_highest = "A",
  org_priority_default = "B",
  org_priority_lowest = "C",
  org_archive_location = "%s_archive::",
  org_tags_column = -80,
  org_use_tag_inheritance = true,
  org_tags_exclude_from_inheritance = {},
  org_hide_emphasis_markers = false,
  org_ellipsis = "...",
  org_log_done = "time",
  org_highlight_latex_and_related = nil,
  org_custom_exports = {},
  org_indent_mode = "indent",
  org_time_stamp_rounding_minutes = 5,
  org_blank_before_new_entry = {
    heading = true,
    plain_list_item = false,
  },
  org_src_window_setup = "top 16new",
  org_edit_src_content_indentation = 0,
  diagnostics = true,
  notifications = {
    enabled = false,
    cron_enabled = true,
    repeater_reminder_time = false,
    deadline_warning_reminder_time = 0,
    reminder_time = 10,
    deadline_reminder = true,
    scheduled_reminder = true,
  },
  mappings = {
    disable_all = false,
    prefix = "<Leader>o",
    global = {
      org_agenda = "<prefix>a",
      org_capture = "<prefix>c",
    },
    agenda = {
      org_agenda_later = "f",
      org_agenda_earlier = "b",
      org_agenda_goto_today = ".",
      org_agenda_day_view = "vd",
      org_agenda_week_view = "vw",
      org_agenda_month_view = "vm",
      org_agenda_year_view = "vy",
      org_agenda_quit = "q",
      org_agenda_switch_to = "<CR>",
      org_agenda_goto = "<TAB>",
      org_agenda_goto_date = "J",
      org_agenda_redo = "r",
      org_agenda_todo = "t",
      org_agenda_clock_goto = "<prefix>xj",
      org_agenda_set_effort = "<prefix>xe",
      org_agenda_clock_in = "I",
      org_agenda_clock_out = "O",
      org_agenda_clock_cancel = "X",
      org_agenda_clockreport_mode = "R",
      org_agenda_priority = "<prefix>,",
      org_agenda_priority_up = "+",
      org_agenda_priority_down = "-",
      org_agenda_archive = "<prefix>$",
      org_agenda_toggle_archive_tag = "<prefix>A",
      org_agenda_set_tags = "<prefix>t",
      org_agenda_deadline = "<prefix>id",
      org_agenda_schedule = "<prefix>is",
      org_agenda_filter = "/",
      org_agenda_show_help = "g?",
    },
    capture = {
      org_capture_finalize = "<C-c>",
      org_capture_refile = "<prefix>r",
      org_capture_kill = "<prefix>k",
      org_capture_show_help = "g?",
    },
    note = {
      org_note_finalize = "<C-c>",
      org_note_kill = "<prefix>k",
      org_note_show_help = "g?",
    },
    org = {
      org_refile = "<prefix>r",
      org_timestamp_up_day = "<S-UP>",
      org_timestamp_down_day = "<S-DOWN>",
      org_timestamp_up = "<C-a>",
      org_timestamp_down = "<C-x>",
      org_change_date = "cid",
      org_priority = "<prefix>,",
      org_priority_up = "ciR",
      org_priority_down = "cir",
      org_todo = "cit",
      org_todo_prev = "ciT",
      org_toggle_checkbox = "<C-Space>",
      org_toggle_heading = "<prefix>*",
      org_open_at_point = "<prefix>o",
      org_edit_special = [[<prefix>']],
      org_cycle = "<TAB>",
      org_global_cycle = "<S-TAB>",
      org_archive_subtree = "<prefix>$",
      org_set_tags_command = "<prefix>t",
      org_toggle_archive_tag = "<prefix>A",
      org_do_promote = "<<",
      org_do_demote = ">>",
      org_promote_subtree = "<s",
      org_demote_subtree = ">s",
      org_meta_return = "<Leader><CR>", -- Add heading, item or row
      org_return = "<CR>",
      org_insert_heading_respect_content = "<prefix>ih", -- Add new headling after current heading block with same level
      org_insert_todo_heading = "<prefix>iT", -- Add new todo headling right after current heading with same level
      org_insert_todo_heading_respect_content = "<prefix>it", -- Add new todo headling after current heading block on same level
      org_move_subtree_up = "<prefix>K",
      org_move_subtree_down = "<prefix>J",
      org_export = "<prefix>e",
      org_next_visible_heading = "}",
      org_previous_visible_heading = "{",
      org_forward_heading_same_level = "]]",
      org_backward_heading_same_level = "[[",
      outline_up_heading = "g{",
      org_deadline = "<prefix>id",
      org_schedule = "<prefix>is",
      org_time_stamp = "<prefix>i.",
      org_time_stamp_inactive = "<prefix>i!",
      org_clock_in = "<prefix>xi",
      org_clock_out = "<prefix>xo",
      org_clock_cancel = "<prefix>xq",
      org_clock_goto = "<prefix>xj",
      org_set_effort = "<prefix>xe",
      org_show_help = "g?",
    },
    edit_src = {
      org_edit_src_abort = "<prefix>k",
      org_edit_src_save = "<prefix>w",
      org_edit_src_show_help = "g?",
    },
    text_objects = {
      inner_heading = "ih",
      around_heading = "ah",
      inner_subtree = "ir",
      around_subtree = "ar",
      inner_heading_from_root = "Oh",
      around_heading_from_root = "OH",
      inner_subtree_from_root = "Or",
      around_subtree_from_root = "OR",
    },
  },
}
