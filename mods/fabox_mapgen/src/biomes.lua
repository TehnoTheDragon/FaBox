minetest.register_biome({
    name = fabox.name("plains"),
    node_top = fabox.name("grass"),
    depth_top = 1,
    node_filler = fabox.name("dirt"),
    depth_filler = 3,
    y_max = 50,
    y_min = -3,
    heat_point = 39,
    humidity_point = 85,
})

minetest.register_biome({
    name = fabox.name("desert"),
    node_top = fabox.name("sand"),
    depth_top = 1,
    node_filler = fabox.name("sand"),
    depth_filler = 3,
    y_max = 100,
    y_min = -50,
    heat_point = 98,
    humidity_point = 1,
})

minetest.register_biome({
    name = fabox.name("rock_mountains"),
    node_top = fabox.name("stone"),
    depth_top = 1,
    node_filler = fabox.name("stone"),
    depth_filler = 3,
    y_max = 1000,
    y_min = 100,
    heat_point = 5,
    humidity_point = 40,
})