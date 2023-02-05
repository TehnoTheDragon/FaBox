local loader = fabox.loader()
loader:add({
    loader.relative("src"),
    loader.path("blocks.lua"),
    loader.path("biomes.lua")
})
loader:load()