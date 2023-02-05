local MapGen = class "MapGen" {}

function MapGen.register(onGenerate)
    minetest.register_on_generated(function(...)
        onGenerate(MapGen(...))
    end)
end

function MapGen:_init(minp, maxp, seed)
    self.seed = seed
    self.minPos = minp
    self.maxPos = maxp

    local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
    self.voxelMap = vm
    self.area = VoxelArea:new({MinEdge = emin, MaxEdge = emax})
    self.mapData = vm:get_data()
end

function MapGen:setData(mapData)
    self.voxelMap:set_data(mapData)
    self.voxelMap:set_lighting({day = 0, night = 0})
    self.voxelMap:update_liquids()
    self.voxelMap:calc_lighting()
    self.voxelMap:write_to_map(mapData)
end

function MapGen:fixLight()
    minetest.after(0, function ()
        minetest.fix_light(self.minPos, self.maxPos)
    end)
end

return MapGen