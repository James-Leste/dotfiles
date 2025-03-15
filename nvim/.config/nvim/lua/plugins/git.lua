return {  
  "f-person/git-blame.nvim",
  event = "VeryLazy",
  config = function()
    vim.g.gitblame_message_template = '<author> • <date> • <summary> • <sha>'
    vim.g.gitblame_date_format = "%r"
    vim.g.gitblame_highlight_group = "Comment"
    vim.g.gitblame_set_extmark_options = {
      hl_mode = "combine",
    }
    vim.g.gitblame_delay = 0 
  end
}

