local M = {}

M.highlights = {
  untracked = 'FFFGitUntracked',
  modified = 'FFFGitModified',
  deleted = 'FFFGitDeleted',
  renamed = 'FFFGitRenamed',
  staged_new = 'FFFGitStaged',
  staged_modified = 'FFFGitStaged',
  staged_deleted = 'FFFGitStaged',
  ignored = 'FFFGitIgnored',
  clean = '',
  clear = '',
  unknown = 'FFFGitUntracked',
}

-- git signs like borders
M.border_chars = {
  untracked = '┆', -- Dotted vertical line
  ignored = '┆', -- Dotted vertical line
  unknown = '┆',
  modified = '┃', -- Vertical line
  deleted = '▁', -- Bottom horizontal line
  renamed = '┃', -- Vertical line
  staged_new = '┃', -- Vertical line
  staged_modified = '┃', -- Vertical line
  staged_deleted = '▁', -- Bottom horizontal line
  clean = '',
  clear = '',
}

M.border_highlights = {
  untracked = 'FFFGitSignUntracked',
  modified = 'FFFGitSignModified',
  deleted = 'FFFGitSignDeleted',
  renamed = 'FFFGitSignRenamed',
  staged_new = 'FFFGitSignStaged',
  staged_modified = 'FFFGitSignStaged',
  staged_deleted = 'FFFGitSignStaged',
  ignored = 'FFFGitSignIgnored',
  clean = '',
  clear = '',
  unknown = 'FFFGitSignUntracked',
}

function M.get_highlight(git_status) return M.highlights[git_status] or '' end

function M.get_border_highlight(git_status) return M.border_highlights[git_status] or '' end

function M.get_border_char(git_status) return M.border_chars[git_status] or '' end

function M.should_show_border(git_status)
  return git_status == 'untracked'
    or git_status == 'modified'
    or git_status == 'staged_new'
    or git_status == 'staged_modified'
    or git_status == 'deleted'
    or git_status == 'staged_deleted'
    or git_status == 'renamed'
end

function M.setup_highlights()
  vim.cmd([[
    " Symbol highlights
    highlight default FFFGitStaged guifg=#10B981 ctermfg=2
    highlight default FFFGitModified guifg=#F59E0B ctermfg=3  
    highlight default FFFGitDeleted guifg=#EF4444 ctermfg=1
    highlight default FFFGitRenamed guifg=#8B5CF6 ctermfg=5
    highlight default FFFGitUntracked guifg=#10B981 ctermfg=2
    highlight default FFFGitIgnored guifg=#4B5563 ctermfg=8
    
    " Thin border highlights 
    highlight default FFFGitSignStaged guifg=#10B981 ctermfg=2
    highlight default FFFGitSignModified guifg=#F59E0B ctermfg=3  
    highlight default FFFGitSignDeleted guifg=#EF4444 ctermfg=1
    highlight default FFFGitSignRenamed guifg=#8B5CF6 ctermfg=5
    highlight default FFFGitSignUntracked guifg=#10B981 ctermfg=2
    highlight default FFFGitSignIgnored guifg=#4B5563 ctermfg=8
    
    " Fallback to GitSigns highlights if they exist
    highlight default link FFFGitSignStaged GitSignsAdd
    highlight default link FFFGitSignModified GitSignsChange
    highlight default link FFFGitSignDeleted GitSignsDelete
    highlight default link FFFGitSignUntracked GitSignsAdd
  ]])
end

return M
