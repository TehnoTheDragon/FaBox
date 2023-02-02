local builtin_item = minetest.registered_entities["__builtin:item"]

local item = {}
function item:set_item(itemString)
    builtin_item.set_item(self, itemString)

    local stack = ItemStack(itemString)
    local itemDef = minetest.registered_items[stack:get_name()]
end

function item:on_step(deltaTime, ...)
    builtin_item.on_step(self, deltaTime, ...)
end

minetest.register_entity(":__builtin:item", setmetatable(item, {__index = builtin_item}))