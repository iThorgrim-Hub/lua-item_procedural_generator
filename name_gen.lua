local name_gen = {}
name_gen.temp = {}

name_gen[1] = function(class, subclass, type)
    local _ = {
        [2] = {

        },

        [4] = {
            [0] = {
                [1] = {'Pendentif', 'Amulette', 'Collet'},
                [2] = {'', ''},
                [3] = {'', ''},
            }
        }
    }

    if class == 4 and subclass == 0 then
        name_gen.temp.name = _[class][subclass][type][math.random(1, #_[class][subclass][type])]
    else
        name_gen.temp.name = _[class][subclass][math.random(1, #_[class][subclass])]
    end

    name_gen[2]()
    return name_gen.temp.name
end

name_gen[2] = function()
    local _  = {
        'cramoisi', 'd\'ossements', 'silencieuse', 'cruelle', 'incrusté', ''
    }

    name_gen.temp.name = name_gen.temp.name .. ' ' .. _[math.random(1, #_)]

    local chance = math.random(1, 10)
    if chance >= 8 then
        name_gen[3]()
    end

    return name_gen.temp.name
end

name_gen[3] = function()
    local _ = {
        'de pénombre', 'de la sentinelle', 'de malachite', 'en onyx', 'de l\'oraison', 'de bile', 'du jour saint', 'de la reine de sang', 'de flagellation', 'de Lana\'thel', 'de Baltharus', 'de Sindragosa', ''
    }


    name_gen.temp.name = name_gen.temp.name .. ' ' .. _[math.random(1, #_)]

    return name_gen.temp.name
end


return name_gen