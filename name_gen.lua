local name_gen = {}
name_gen.temp = {}

name_gen[1] = function(class, subclass, type)
    local _ = {
        [2] = {

        },

        [4] = {
            [0] = {
                [1] = {"Pendentif", "Amulette", "Collet", "Charme", "Sautoir", "Collerette", "Talisman", "Prydaz", "Collier", "Médaillon", "Chaîne", "Torque"},
                [2] = {"", ""},
                [3] = {"", ""},
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
        "cramoisi", "d'ossements", "silencieuse", "cruelle", "incrusté", "vicié", "venin-azur", "en pierre", "en onyx", "à pointes", "ombrepeur", "vire-piste", "en laestrite", "en chaîne", "chef-d'oeuvre", "béni", "d'entraînement", "haut renforcé", "céleste", "combevoile", "vorpale", "éternel", "d'agathe", "forge-tripe"
    }

    name_gen.temp.name = name_gen.temp.name .. " " .. _[math.random(1, #_)]

    local chance = math.random(1, 10)
    if chance >= 8 then
        name_gen[3]()
    end

    return name_gen.temp.name
end

name_gen[3] = function()
    local _ = {
        "de pénombre", "de la sentinelle", "de malachite", "de l'oraison", "de bile", "du jour saint", "de la reine de sang", "de flagellation", "de Lana'thel", "de Baltharus", "de Sindragosa", "de l'hiver", "de naissance noble", "de Gaïazelle", "d'Azeroth", "impénitent", "magistrale", "de Xavaric", "de Karabor", "de l'aspirant", "du carillon", "du lié par le Dessein", "de l'horizon", "des Shal'dorei", ""
    }


    name_gen.temp.name = name_gen.temp.name .. " " .. _[math.random(1, #_)]

    return name_gen.temp.name
end


return name_gen