-- Neovim 0.12+ has native commenting (gc/gcc) built-in.
-- Using ts_context_commentstring for proper JSX/TSX/multi-language support.
return {
   'JoosepAlviste/nvim-ts-context-commentstring',
   event = { 'BufReadPre', 'BufNewFile' },
   config = function()
      require('ts_context_commentstring').setup {
         enable_autocmd = true,
      }
   end,
}
