local name_gen = require('name_gen')
local stats_gen = require('stats_gen')
local display_gen = require('display_gen')

math.randomseed(os.time())

local item_gen = {
    config = {
        minimal_entry = 190000
    }
}

item_gen.item = {
    ['entry'] = 190000,
    ['class'] = 0,
    ['subclass'] = 0,
    ['name'] = '',
    ['displayId'] = 0,

    ['quality'] = 7,

    ['buyprice'] = 1,
    ['sellprice'] = 1,

    ['statsCours'] = 0,

    ['stat_type1'] = 0,
    ['stat_value1'] = 0,

    ['stat_type2'] = 0,
    ['stat_value2'] = 0,

    ['stat_type3'] = 0,
    ['stat_value3'] = 0,

    ['stat_type4'] = 0,
    ['stat_value4'] = 0,

    ['stat_type5'] = 0,
    ['stat_value5'] = 0,

    ['stat_type6'] = 0,
    ['stat_value6'] = 0,

    ['stat_type7'] = 0,
    ['stat_value7'] = 0,

    ['stat_type8'] = 0,
    ['stat_value8'] = 0,

    ['stat_type9'] = 0,
    ['stat_value9'] = 0,

    ['stat_type10'] = 0,
    ['stat_value10'] = 0,
}

item_gen.primaryStats = {
    [1] = {50, 150},
    [2] = {50, 150},
    [3] = {50, 150},
    [4] = {50, 150},
    [5] = {50, 150}
}

function item_gen.setStatNbr(entry, nbr)
    if not nbr then nbr = #item_gen.primaryStats end
    return math.random(1, nbr)
end

function item_gen.generate(nbr, class, subclass, type, armorType, max_PrimaryStats, max_SecondaryStats)
    if nbr > 0 then
        for i = 1 , nbr do
            local temp = {}

            local entry = item_gen.config.minimal_entry + nbr
            item_gen[entry] = {}

            item_gen[entry].name = name_gen[1](class, subclass, type)
            item_gen[entry].primaryStats = stats_gen[1](class, subclass, type, max_PrimaryStats)
            item_gen[entry].secondaryStats = stats_gen[2](class, subclass, type, max_SecondaryStats)
            item_gen[entry].display = display_gen[1](class, subclass, type)

            for i = 1, #item_gen[entry].primaryStats do
                temp['stat_type'..i] = item_gen[entry].primaryStats[i][1]
                temp['stat_value'..i] = item_gen[entry].primaryStats[i][1]
            end

            local sql = 'INSERT INTO item_template VALUES ('..entry..', '..class..', '..subclass..')'
            print(sql)

        end
    end
end

-- nbr_object, class, subclass, type
-- type_Armure, max_PrimaryStats, max_SecondaryStats
item_gen.generate(1, 4, 0, 1, 0, 3, 3)