return {
    { "L3MON4D3/LuaSnip",
    config = function()
        require("luasnip.loaders.from_vscode").lazy_load({
            paths = {
                "./snippets"
            }
        })
    end },
    'saadparwaiz1/cmp_luasnip'
}
