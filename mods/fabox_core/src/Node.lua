local Node = class "Node" {}

function Node:_init(name)
    self._name = fabox.name(name)
    self.definition = {
        tiles = {},
        groups = {oddly_breakable_by_hand = 1}
    }
end

-- Pre-Register Functions

--- Setup some definitions for create a liquid
---@param isSource boolean
---@param waving boolean
---@param drowing number
---@param viscosity number
---@param isRenewable boolean
---@param range integer
---@param alpha number
---@param altFlowingName string
---@param altSourceName string
function Node:setup_for_liquid(isSource, waving, drowing, viscosity, isRenewable, range, alpha, altFlowingName, altSourceName)
    self.definition.drawtype = "liquid"
    self.definition.paramtype2 = isSource and "" or "flowingliquid"
    self.definition.waving = waving and 3 or 0
    self.definition.use_texture_alpha = "blend"
    self.definition.paramtype = "light"
    self.definition.walkable = false
    self.definition.pointable = false
    self.definition.diggable = false
    self.definition.buildable_to = true
    self.definition.is_ground_content = false
    self.definition.drop = ""
    self.definition.drowing = drowing
    self.definition.liquidtype = isSource and "source" or "flowing"
    self.definition.liquid_alternative_flowing = altFlowingName
    self.definition.liquid_alternative_source = altSourceName
    self.definition.liquid_viscosity = viscosity
    self.definition.liquid_renewable = isRenewable
    self.definition.liquid_range = range
    self.definition.alpha = alpha
end

function Node:allTexture(texture)
    self.definition.tiles = {texture}
    return self
end

function Node:setTextures(up, down, left, right, front, back)
    self.definition.tiles = {
        up, down, left, right, front, back
    }
    return self
end

function CraftItem:description(text)
    self.definition.description = text
    return self
end

function Node:image(image)
    self.definition.inventory_image = image
    return self
end

function Node:group(name, value)
    self.definition.groups[name] = value or 1
    return self
end

-- Post Functions

function Node:identity()
    return minetest.registered_nodes[self._name]
end

function Node:alias(name)
    minetest.register_alias(name, self._name)
end

function Node:register()
    minetest.register_node(self._name, self.definition)
end

return Node