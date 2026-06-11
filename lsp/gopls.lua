return {
   settings = {
      gopls = {
         semanticTokens = true,
         analyses = {
            unusedparams = true,
            shadow = true,
         },
         staticcheck = true,
         hints = {
            assignVariableTypes = true,
            compositeLiteralFields = true,
            compositeLiteralTypes = true,
            constantValues = true,
            functionTypeParameters = true,
            parameterNames = true,
            rangeVariableTypes = true,
         },
      },
   },
}
