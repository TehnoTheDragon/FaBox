minetest.override_item("", {
    range = 5,
    tool_capabilities = {
        full_punch_interval = 1.5,
		max_drop_level = 1,
        groupcaps = {
            oddly_breakable_by_hand = {times = {1}, uses = 0, maxlevel = 1},
            dig_immediate = {times = {[2] = 42, [3] = 0}, uses = 0, maxlevel = 1},
        },
        damage_groups = {fleshy = 1},
    }
})