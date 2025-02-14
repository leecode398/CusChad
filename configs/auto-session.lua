local opts = {
  log_level = "debug",
  auto_session_enable_last_session = false,
  auto_session_root_dir = "/Users/lee/.cache/sessions/",
  auto_session_enabled = true,
  auto_save_enabled = nil,
  auto_restore_enabled = nil,
  auto_session_suppress_dirs = nil,
  auto_session_use_git_branch = nil,
  -- the configs below are lua only
  bypass_session_save_file_types = nil,
}

require("auto-session").setup(opts)
