local CraftItem = class "CraftItem" {}

function CraftItem:_init(name)
    self._name = fabox.name(name)
    self.definition = {
        groups = {}
    }
end

-- Pre-Register Functions

function CraftItem:onUse(func)
    self.definition.on_use = func
    return self
end

function CraftItem:image(image)
    self.definition.inventory_image = image
    return self
end

function CraftItem:description(text)
    self.definition.description = text
    return self
end

function CraftItem:group(name, value)
    self.definition.groups[name] = value or 1
    return self
end

-- Post Functions

function CraftItem:identity()
    return minetest.registered_craftitems[self._name]
end

function CraftItem:alias(name)
    minetest.register_alias(name, self._name)
end

function CraftItem:register()
    minetest.register_craftitem(self._name, self.definition)
end

return CraftItem