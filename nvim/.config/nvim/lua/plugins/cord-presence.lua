return {
  'vyfor/cord.nvim',
  build = ':Cord update',
  opts = {
    editor = {
      tooltip = "I use neovim, btw"
    },
    timstamp = {
      reset_on_idle = true,
      reset_on_change = true,
      shared = true
    },
  }
}
