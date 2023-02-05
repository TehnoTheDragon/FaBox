local WHERE_IN = "fabox_mapgen:stone"

local coal_ore = Node("coal_ore")
coal_ore:allTexture("coal_ore.png")
coal_ore:register()

minetest.register_ore({
    ore_type = "scatter",
    ore = fabox.name("coal_ore"),
    wherein = WHERE_IN,
    clust_scarcity = 10*10*10,
    clust_num_ores = 8,
    clust_size = 3,
    height_min = -3100,
    height_max = 200,
    noise_params = {
        offset = 0.25,
        scale = 1,
        spread = {
            x = 25, y = 25, z = 25
        },
        octaves = 1,
        persist = 0.3
    },
    noise_threshhold = 0.5
})

local iron_ore = Node("iron_ore")
iron_ore:allTexture("iron_ore.png")
iron_ore:register()

minetest.register_ore({
    ore_type = "scatter",
    ore = fabox.name("iron_ore"),
    wherein = WHERE_IN,
    clust_scarcity = 10*10*10,
    clust_num_ores = 10,
    clust_size = 3,
    height_min = -3100,
    height_max = 200,
    noise_params = {
        offset = 0.25,
        scale = 1,
        spread = {
            x = 25, y = 25, z = 25
        },
        octaves = 1,
        persist = 0.3
    },
    noise_threshhold = 0.5
})

local gold_ore = Node("gold_ore")
gold_ore:allTexture("gold_ore.png")
gold_ore:register()

minetest.register_ore({
    ore_type = "scatter",
    ore = fabox.name("gold_ore"),
    wherein = WHERE_IN,
    clust_scarcity = 26*26*26,
    clust_num_ores = 12,
    clust_size = 8,
    height_min = -3100,
    height_max = 200,
    noise_params = {
        offset = 0.5,
        scale = 1,
        spread = {
            x = 100, y = 100, z = 100
        },
        octaves = 1,
        persist = 0.5
    },
    noise_threshhold = 0.8
})

local emeral_ore = Node("emerald_ore")
emeral_ore:allTexture("emerald_ore.png")
emeral_ore:register()

minetest.register_ore({
    ore_type = "scatter",
    ore = fabox.name("emerald_ore"),
    wherein = WHERE_IN,
    clust_scarcity = 21*21*21,
    clust_num_ores = 2,
    clust_size = 2,
    height_min = -3100,
    height_max = 200,
    noise_params = {
        offset = 0,
        scale = 1,
        spread = {
            x = 150, y = 150, z = 150
        },
        octaves = 1,
        persist = 0.5
    },
    noise_threshhold = 0.5
})

local diamond_ore = Node("diamond_ore")
diamond_ore:allTexture("diamond_ore.png")
diamond_ore:register()

minetest.register_ore({
    ore_type = "scatter",
    ore = fabox.name("diamond_ore"),
    wherein = WHERE_IN,
    clust_scarcity = 21*21*21,
    clust_num_ores = 2,
    clust_size = 2,
    height_min = -3100,
    height_max = 200,
    noise_params = {
        offset = 0,
        scale = 1,
        spread = {
            x = 150, y = 150, z = 150
        },
        octaves = 1,
        persist = 0.5
    },
    noise_threshhold = 0.5
})

minetest.register_ore({
    ore_type = "scatter",
    ore = fabox.name("diamond_ore"),
    wherein = WHERE_IN,
    clust_scarcity = 21*21*21,
    clust_num_ores = 2,
    clust_size = 2,
    height_min = -3100,
    height_max = 200,
    noise_params = {
        offset = 0,
        scale = 1,
        spread = {
            x = 150, y = 150, z = 150
        },
        octaves = 1,
        persist = 0.5
    },
    noise_threshhold = 0.5
})