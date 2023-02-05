local stone = Node("stone")
stone:allTexture("stone.png")
stone.definition.sounds = {footstep = {name = "step_stone", gain = 1}}
stone:alias("mapgen_stone")
stone:register()

local dirt = Node("dirt")
dirt:allTexture("dirt.png")
dirt.definition.sounds = {footstep = {name = "step_grass", gain = 1}}
dirt:register()

local sand = Node("sand")
sand:allTexture("sand.png")
sand.definition.sounds = {footstep = {name = "step_grass", gain = 1}}
sand:register()

local grass = Node("grass")
grass:setTextures("grass_top.png", "dirt.png", "dirt.png^grass_side_mask.png", "dirt.png^grass_side_mask.png", "dirt.png^grass_side_mask.png", "dirt.png^grass_side_mask.png")
grass.definition.sounds = {footstep = {name = "step_grass", gain = 1}}
grass:register()

local water_source = Node("water_source")
water_source:allTexture("water.png")
water_source:alias("mapgen_water_source")
water_source:alias("mapgen_river_water_source")
water_source:setup_for_liquid(true, true, 1, 0.1, false, 10, 0, fabox.name("water_flowing"), fabox.name("water_source"))
water_source:register()

local water_flowing = Node("water_flowing")
water_flowing:allTexture("water.png")
water_flowing:setup_for_liquid(false, true, 1, 0.1, false, 10, 0, fabox.name("water_flowing"), fabox.name("water_source"))
water_flowing:register()