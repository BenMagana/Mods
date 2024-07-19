Log = require('scripts/log')
local data_util = require("data_util2")
-- #: modified
--data_util.replace_or_add_ingredient("low-density-structure", "steel-plate", "steel-plate", 5)
--data_util.replace_or_add_result(recipe, old, new, amount, is_fluid, amount_min, amount_max, probability, #catalyst)
--data_util.set_craft_time(recipe, energy_required)
--data_util.remove_ingredient(recipe, name)

local core_stack = 20
local ore_stack = 50
local plate_stack = 100
------------------- Materials -------------------

--Casting
--plates from ingot time
data_util.recipe_set_energy_required("se-copper-ingot-to-plate", 2) --up from 1.25
data_util.recipe_set_energy_required("se-iron-ingot-to-plate", 2) --down from 2.5
data_util.recipe_set_energy_required("se-steel-ingot-to-plate", 2) --down from 5
--data_util.recipe_set_energy_required("se-beryllium-ingot-to-plate", 5) --down from 5
data_util.recipe_set_energy_required("se-holmium-ingot-to-plate", 5) --up from 2.5
data_util.recipe_set_energy_required("se-iridium-ingot-to-plate", 5) --down from 10
--smelting results (steel uses iron)
data_util.replace_or_add_result("se-molten-iron","se-molten-iron", "se-molten-iron", 300, true,  nil, nil, nil, nil) --down from 750
data_util.replace_or_add_result("se-molten-copper","se-molten-copper","se-molten-copper", 300, true,  nil, nil, nil, nil) --down from 750
data_util.replace_or_add_result("se-molten-beryllium","se-molten-beryllium", "se-molten-beryllium", 100, true,  nil, nil, nil, nil) --down from 250
data_util.replace_or_add_result("se-molten-holmium","se-molten-holmium","se-molten-holmium", 100, true,  nil, nil, nil, nil) --down from 250
--ingot cast time
data_util.recipe_set_energy_required("se-copper-ingot", 20) --down from 25
data_util.recipe_set_energy_required("se-iron-ingot", 20) --down from 25
data_util.recipe_set_energy_required("se-steel-ingot", 40) --down from 100
data_util.recipe_set_energy_required("se-beryllium-ingot", 50) --down from 75
data_util.recipe_set_energy_required("se-holmium-ingot", 50) --down from 75
--cast ingredients
data_util.replace_or_add_ingredient("se-copper-ingot", "se-molten-copper","se-molten-copper", 100, true) --down from 250
data_util.replace_or_add_ingredient("se-iron-ingot", "se-molten-iron","se-molten-iron", 100, true) --down from 250
data_util.replace_or_add_ingredient("se-steel-ingot", "se-molten-iron","se-molten-iron", 200, true) --down from 500
data_util.replace_or_add_ingredient("se-steel-ingot", "coke","coke", 4) --down from 6
data_util.replace_or_add_ingredient("se-beryllium-ingot", "se-molten-beryllium","se-molten-beryllium", 100, true) --down from 250
data_util.replace_or_add_ingredient("se-holmium-ingot", "se-molten-holmium","se-molten-holmium", 100, true) --down from 250

--Vitamelange
data_util.replace_or_add_ingredient("se-vitamelange-bloom", "sand", "sand", 20)
data_util.replace_or_add_ingredient("se-vitamelange-bloom", "se-vitamelange-nugget", "se-vitamelange-nugget", 30)
data_util.replace_or_add_ingredient("se-vitamelange-bloom", "water", "water", 100, true)

data_util.replace_or_add_ingredient("se-vitamelange-spice", "se-vitamelange-bloom", "se-vitamelange-bloom", 20)
data_util.recipe_set_energy_required("se-vitamelange-spice", 20)
data_util.replace_or_add_result("se-vitamelange-spice", "se-vitamelange-spice", "se-vitamelange-spice", 20, false, nil, nil, nil, nil)
data_util.replace_or_add_result("se-vitamelange-spice", "se-vitamelange-extract", "se-vitamelange-extract", nil, false, 1, 1, 0.25, nil)

data_util.replace_or_add_result("se-vitamelange-extract", "se-vitamelange-extract", "se-vitamelange-extract", nil, false, 5, 10, nil, 2)

data_util.replace_or_add_ingredient("se-vitalic-epoxy", "sulfur", "sulfur", 4)
data_util.replace_or_add_ingredient("se-vitalic-epoxy", "se-vitalic-reagent", "se-vitalic-reagent", 2)
data_util.replace_or_add_ingredient("se-vitalic-epoxy", "se-vitalic-acid", "se-vitalic-acid", 5, true)

data_util.replace_or_add_ingredient("se-vitalic-reagent", "glass", "glass", 5, false)
data_util.replace_or_add_ingredient("se-vitalic-reagent", "lithium-chloride", "lithium-chloride", 5, false)
data_util.replace_or_add_ingredient("se-vitalic-reagent", "se-vitamelange-extract", "se-vitamelange-extract", 2, false)

data_util.replace_or_add_result("se-vitamelange-spice", "se-vitamelange-spice", "se-vitamelange-spice", 20, false, nil, nil, nil, nil)

data_util.replace_or_add_result("se-vitamelange-acid", "se-vitamelange-acid", "se-vitamelange-acid", 100, true, nil, nil, nil, nil)

--undo changes to chemistry
data_util.remove_ingredient("se-vitamelange-bloom","fertilizer")
data.raw.recipe["se-vitamelange-bloom"].category = "chemistry"

--vulcanite
data_util.replace_or_add_ingredient("se-glass-vulcanite", "sand", "sand", 20, false)
data_util.replace_or_add_result("se-glass-vulcanite", "glass", "glass", 16, false, nil, nil, nil, nil)
data_util.replace_or_add_ingredient("se-glass-vulcanite", "se-pyroflux", "se-pyroflux", 2, true)
data_util.set_craft_time("se-glass-vulcanite", 30)

--Iridium
data.raw["item"]["se-iridium-ore"].stack_size = core_stack
data.raw["item"]["se-iridium-ore-crushed"].stack_size = ore_stack
data.raw["item"]["se-iridium-plate"].stack_size = plate_stack

data_util.replace_or_add_ingredient("se-heavy-assembly", "se-heavy-bearing", "se-heavy-bearing", 2, false) --from 8
data_util.replace_or_add_ingredient("se-heavy-assembly", "lubricant", "lubricant", 5, true) --from 2

data_util.replace_or_add_ingredient("se-heavy-composite", "se-iridium-plate", "se-iridium-plate", 2, false) --from 16
data_util.replace_or_add_ingredient("se-heavy-composite", "se-heat-shielding", "se-heat-shielding", 4, false) --from 8
data_util.replace_or_add_ingredient("se-heavy-composite", "se-heavy-girder", "se-heavy-girder", 2, false) --from 4

data_util.replace_or_add_result("se-heavy-girder","se-heavy-girder","se-heavy-girder", 2, false, nil, nil, nil, nil) --from 1
data_util.set_craft_time("se-heavy-girder", 2) --from 1

--biomass
data.raw["item"]["se-specimen"].stack_size = ore_stack
data.raw["item"]["se-experimental-specimen"].stack_size = ore_stack
data.raw["item"]["se-significant-specimen"].stack_size = ore_stack
data.raw["item"]["se-nutrient-vat"].stack_size = ore_stack
data.raw["item"]["se-bioculture"].stack_size = ore_stack
data.raw["item"]["se-experimental-bioculture"].stack_size = ore_stack

data_util.replace_or_add_ingredient("se-genetic-data", "lithium-chloride", "lithium-chloride", 2, false) --from 5
data_util.replace_or_add_ingredient("se-genetic-data", "se-bio-sludge", "se-bio-sludge", 5, true) --from 10
data_util.replace_or_add_result("se-genetic-data","se-contaminated-space-water","se-contaminated-space-water", 4, true, nil, nil, nil, nil) --from 9

data_util.replace_or_add_ingredient("se-bioculture", "se-genetic-data", "se-genetic-data", 5, false) --from 10
data_util.replace_or_add_result("se-bioculture","se-genetic-data","se-genetic-data", 4, false, nil, nil, nil, nil) --from 9
data_util.replace_or_add_ingredient("se-genetic-data", "se-bio-sludge", "se-bio-sludge", 10, true) --from 50

--Holmium 
data_util.replace_or_add_ingredient("se-processing-unit-holmium", "se-holmium-cable", "se-holmium-cable", 2, false) --from 4?
data_util.replace_or_add_ingredient("se-processing-unit-holmium", "advanced-circuit", "advanced-circuit", 2, false) --from 3

data_util.replace_or_add_ingredient("se-holmium-cable", "se-holmium-plate", "se-holmium-plate", 1, false) --from 2
data_util.replace_or_add_result("se-holmium-cable","se-holmium-cable","se-holmium-cable", 4, false, nil, nil, nil, nil) --from 8?

data_util.replace_or_add_ingredient("se-holmium-solenoid", "se-holmium-cable", "se-holmium-cable", 2, false) --from 8

--Berylium
data_util.replace_or_add_ingredient("se-aeroframe-pole", "iron-stick", "iron-stick", 2, false) --from 1
data_util.replace_or_add_ingredient("se-aeroframe-pole", "se-beryllium-plate", "se-beryllium-plate", 1, false) --from 2
data_util.replace_or_add_result("se-aeroframe-pole","se-aeroframe-pole","se-aeroframe-pole", 2, false, nil, nil, nil, nil) --from 1
data_util.set_craft_time("se-aeroframe-pole", 2) --from 1

data_util.replace_or_add_result("se-aeroframe-scaffold","se-aeroframe-scaffold","se-aeroframe-scaffold", 2, false, nil, nil, nil, nil) --from 1

data_util.replace_or_add_ingredient("se-lattice-pressure-vessel", "se-beryllium-plate", "se-beryllium-plate", 2, false) --from 16
data_util.replace_or_add_ingredient("se-lattice-pressure-vessel", "se-aeroframe-bulkhead", "se-aeroframe-bulkhead", 1, false) --from 3


--misc
data.raw["item"]["se-material-testing-pack"].stack_size = ore_stack

data.raw["item"]["se-beryllium-plate"].stack_size = plate_stack

data_util.replace_or_add_ingredient("se-quantum-processor", "processing-unit", "processing-unit", 10, false)
data_util.replace_or_add_ingredient("se-quantum-processor", "se-holmium-cable", "se-holmium-cable", 10, false)
data_util.replace_or_add_ingredient("se-quantum-processor", "imersite-crystal", "imersite-crystal", 10, false)
data_util.replace_or_add_ingredient("se-quantum-processor", "se-holmium-plate", "se-holmium-plate", 5, false)
data_util.replace_or_add_ingredient("se-quantum-processor", "se-quantum-phenomenon-data", "se-quantum-phenomenon-data", 1, false)
data_util.replace_or_add_result("se-quantum-processor","se-quantum-processor","se-quantum-processor", 5, false, nil, nil, nil, nil) --from 2
data_util.set_craft_time("se-quantum-processor", 20) --from 8

data_util.replace_or_add_ingredient("ai-core", "se-quantum-processor", "se-quantum-processor", 5, false) --from 2
data_util.replace_or_add_ingredient("ai-core", "imersite-crystal", "imersite-crystal", 5, false) --from 2
data_util.replace_or_add_ingredient("ai-core", "se-vitalic-reagent", "se-vitalic-reagent", 5, false) --from 4
data_util.replace_or_add_ingredient("ai-core", "se-advanced-neural-gel", "se-neural-gel-2", 25, true) --from 20
data_util.replace_or_add_ingredient("ai-core", "se-bioelectrics-data", "se-bioelectrics-data", 1, false) --from 2
data_util.replace_or_add_result("ai-core","ai-core","ai-core", 5, false, nil, nil, nil, nil) --from 2
data_util.set_craft_time("ai-core", 20) --from 8
data.raw.recipe["ai-core"].category = "space-manufacturing"

data_util.replace_or_add_ingredient("se-dynamic-emitter", "se-holmium-solenoid", "se-holmium-solenoid", 2, false) --from 4
data_util.replace_or_add_ingredient("se-dynamic-emitter", "se-cryonite-rod", "se-cryonite-rod", 2, false) --from 4

data_util.replace_or_add_ingredient("se-chemical-gel", "petroleum-gas", "petroleum-gas", 20, true) --from 100

--rocket fuel
--data_util.replace_or_add_ingredient("rocket-fuel", "oxygen", "oxygen", 50, true)
--data_util.set_craft_time("rocket-fuel",20)
--data_util.replace_or_add_ingredient("rocket-fuel-with-ammonia", "ammonia", "ammonia", 50, true)
--data_util.replace_or_add_ingredient("rocket-fuel-with-ammonia", "oxygen", "oxygen", 50, true)
--data_util.set_craft_time("rocket-fuel-with-ammonia",20)
--data_util.replace_or_add_ingredient("rocket-fuel-with-hydrogen-chloride", "hydrogen-chloride", "hydrogen-chloride", 50, true)
--data_util.replace_or_add_ingredient("rocket-fuel-with-hydrogen-chloride", "oxygen", "oxygen", 50, true)
--data_util.set_craft_time("rocket-fuel-with-hydrogen-chloride",20)
data_util.replace_or_add_result("se-liquid-rocket-fuel", "se-liquid-rocket-fuel", "se-liquid-rocket-fuel", 100, true, nil, nil, nil, nil)
data_util.remove_ingredient("rocket-fuel", "solid-fuel")
data_util.replace_or_add_ingredient("rocket-fuel", "light-oil", "light-oil", 20, true)
--data_util.allow_efficiency("nitrogen")
--data_util.allow_efficiency("oxygen")
--data_util.allow_efficiency("kr-water")

--local adv_chem_plant = data.raw["assembling-machine"]["kr-advanced-chemical-plant"]
--adv_chem_plant.energy_usage = "6.5MW" --set to Kr values
--adv_chem_plant.allowed_effects = { "consumption", "speed", "productivity", "pollution" }

--local adv_assembler = data.raw["assembling-machine"]["kr-advanced-assembling-machine"]
--adv_assembler.energy_usage = "6.5MW" --set to Kr values

--local adv_furnace = data.raw["assembling-machine"]["kr-advanced-furnace"]
--adv_furnace.energy_usage = "2MW" --set to Kr values
--adv_furnace.crafting_speed = 12  
--TODO: modify vulcanite? 
--TODO: modify cryonite? 
data_util.replace_or_add_result("blank-tech-card", "blank-tech-card", "blank-tech-card", 4, false, nil, nil, nil, nil)
data_util.replace_or_add_result("se-empty-data", "se-empty-data", "se-empty-data", 4, false, nil, nil, nil, nil)
data_util.replace_or_add_result("se-naquium-ore-crushed", "se-naquium-ore-crushed", "se-naquium-ore-crushed", 8, false, nil, nil, nil, nil)
data_util.replace_or_add_result("se-naquium-crystal", "se-naquium-crystal", "se-naquium-crystal", 2, false, nil, nil, nil, nil)
data_util.replace_or_add_ingredient("se-naquium-powder", "se-naquium-ore-crushed", "se-naquium-ore-crushed", 10, false)
data_util.replace_or_add_result("se-naquium-ingot", "se-naquium-ingot", "se-naquium-ingot", 4, false, nil, nil, nil, nil)
data_util.replace_or_add_ingredient("se-ion-canister", "se-ion-stream", "se-ion-stream", 100, true)
data_util.replace_or_add_ingredient("se-plasma-canister", "se-plasma-stream", "se-plasma-stream", 100, true)
data_util.replace_or_add_ingredient("se-antimatter-canister", "se-antimatter-stream", "se-antimatter-stream", 100, true)
------------------- Modules -------------------

local modules_per_tier = 2

-- Speed Module 1 
--data_util.replace_or_add_ingredient("speed-module", "solid-fuel", "solid-fuel", 10)
data_util.replace_or_add_ingredient("speed-module", "electronic-circuit", "electronic-circuit", 10)
data_util.replace_or_add_ingredient("speed-module", "electronic-circuit", "electronic-circuit", 5)
-- Speed Module 2
data_util.replace_or_add_ingredient("speed-module-2", "speed-module", "speed-module", modules_per_tier)
data_util.replace_or_add_ingredient("speed-module-2", "electric-motor", "electric-motor", 5)
-- Speed Module 3
data_util.replace_or_add_ingredient("speed-module-3", "speed-module-2", "speed-module-2", modules_per_tier)
data_util.replace_or_add_ingredient("speed-module-3", "imersite-crystal", "imersite-crystal", 20)
-- Speed Module 4
data_util.replace_or_add_ingredient("speed-module-4", "speed-module-3", "speed-module-3", modules_per_tier)
data_util.replace_or_add_ingredient("speed-module-4", "se-iridium-plate", "se-iridium-plate", 20)
-- Speed Module 5
data_util.replace_or_add_ingredient("speed-module-5", "speed-module-4", "speed-module-4", modules_per_tier)
data_util.replace_or_add_ingredient("speed-module-5", "se-heavy-girder", "se-heavy-girder", 20)
-- Speed Module 6
data_util.replace_or_add_ingredient("speed-module-6", "speed-module-5", "speed-module-5", modules_per_tier)
data_util.replace_or_add_ingredient("speed-module-6", "se-heavy-bearing", "se-heavy-bearing", 20)
data_util.replace_or_add_ingredient("speed-module-6", "se-material-catalogue-2", "se-material-catalogue-2", 1)
-- Speed Module 7
data_util.replace_or_add_ingredient("speed-module-7", "speed-module-6", "speed-module-6", modules_per_tier)
data_util.replace_or_add_ingredient("speed-module-7", "se-heavy-composite", "se-heavy-composite", 20)
data_util.replace_or_add_ingredient("speed-module-7", "se-material-catalogue-3", "se-material-catalogue-3", 1)
-- Speed Module 8
data_util.replace_or_add_ingredient("speed-module-8", "speed-module-7", "speed-module-7", modules_per_tier)
data_util.replace_or_add_ingredient("speed-module-8", "se-heavy-assembly", "se-heavy-assembly", 20)
data_util.replace_or_add_ingredient("speed-module-8", "se-material-catalogue-4", "se-material-catalogue-4", 1)
-- Speed Module 9
data_util.replace_or_add_ingredient("speed-module-9", "speed-module-8", "speed-module-8", modules_per_tier)
data_util.replace_or_add_ingredient("speed-module-9", "se-nanomaterial", "se-nanomaterial", 20)
data_util.replace_or_add_ingredient("speed-module-9", "se-deep-catalogue-1", "se-deep-catalogue-1", 1)
data_util.replace_or_add_ingredient("speed-module-9", "se-cryonite-slush", "se-cryonite-slush", 200, true)

-- Productivity Module 1 
data_util.replace_or_add_ingredient("productivity-module", "glass", "glass", 10)
data_util.replace_or_add_ingredient("productivity-module", "electronic-circuit", "electronic-circuit", 10)
data_util.replace_or_add_ingredient("productivity-module", "electronic-circuit", "electronic-circuit", 5)
-- Productivity Module 2
data_util.replace_or_add_ingredient("productivity-module-2", "productivity-module", "productivity-module", modules_per_tier)
data_util.replace_or_add_ingredient("productivity-module-2", "sulfur", "sulfur", 10)
-- Productivity Module 3
data_util.replace_or_add_ingredient("productivity-module-3", "productivity-module-2", "productivity-module-2", modules_per_tier)
data_util.replace_or_add_ingredient("productivity-module-3", "se-vulcanite-block", "se-vulcanite-block", 20)
-- Productivity Module 4
data_util.replace_or_add_ingredient("productivity-module-4", "productivity-module-3", "productivity-module-3", modules_per_tier)
data_util.replace_or_add_ingredient("productivity-module-4", "se-vitamelange-extract", "se-vitamelange-extract", 20)
-- Productivity Module 5
data_util.replace_or_add_ingredient("productivity-module-5", "productivity-module-4", "productivity-module-4", modules_per_tier)
data_util.replace_or_add_ingredient("productivity-module-5", "se-bioscrubber", "se-bioscrubber", 20)
-- Productivity Module 6
data_util.replace_or_add_ingredient("productivity-module-6", "productivity-module-5", "productivity-module-5", modules_per_tier)
data_util.replace_or_add_ingredient("productivity-module-6", "se-vitalic-reagent", "se-vitalic-reagent", 20)
data_util.replace_or_add_ingredient("productivity-module-6", "se-biological-catalogue-2", "se-biological-catalogue-2", 1)
-- Productivity Module 7
data_util.replace_or_add_ingredient("productivity-module-7", "productivity-module-6", "productivity-module-6", modules_per_tier)
data_util.replace_or_add_ingredient("productivity-module-7", "se-vitalic-epoxy", "se-vitalic-epoxy", 20)
data_util.replace_or_add_ingredient("productivity-module-7", "se-biological-catalogue-3", "se-biological-catalogue-3", 1)
-- Productivity Module 8
data_util.replace_or_add_ingredient("productivity-module-8", "productivity-module-7", "productivity-module-7", modules_per_tier)
data_util.replace_or_add_ingredient("productivity-module-8", "se-self-sealing-gel", "se-self-sealing-gel", 20)
data_util.replace_or_add_ingredient("productivity-module-8", "se-biological-catalogue-4", "se-biological-catalogue-4", 1)
-- Productivity Module 9
data_util.replace_or_add_ingredient("productivity-module-9", "productivity-module-8", "productivity-module-8", modules_per_tier)
data_util.replace_or_add_ingredient("productivity-module-9", "se-lattice-pressure-vessel", "se-lattice-pressure-vessel", 20)
data_util.replace_or_add_ingredient("productivity-module-9", "se-deep-catalogue-1", "se-deep-catalogue-1", 1)
data_util.replace_or_add_ingredient("productivity-module-9", "se-neural-gel-2", "se-neural-gel-2", 200, true)

-- Efficiency Module 1 
data_util.replace_or_add_ingredient("effectivity-module", "copper-cable", "copper-cable", 10)
-- Efficiency Module 2
data_util.replace_or_add_ingredient("effectivity-module-2", "effectivity-module", "effectivity-module", modules_per_tier)
-- Efficiency Module 3
data_util.replace_or_add_ingredient("effectivity-module-3", "effectivity-module-2", "effectivity-module-2", modules_per_tier)
data_util.replace_or_add_ingredient("effectivity-module-3", "se-cryonite-rod", "se-cryonite-rod", 20)
-- Efficiency Module 4
data_util.replace_or_add_ingredient("effectivity-module-4", "effectivity-module-3", "effectivity-module-3", modules_per_tier)
data_util.replace_or_add_ingredient("effectivity-module-4", "se-holmium-plate", "se-holmium-plate", 20)
-- Efficiency Module 5
data_util.replace_or_add_ingredient("effectivity-module-5", "effectivity-module-4", "effectivity-module-4", modules_per_tier)
data_util.replace_or_add_ingredient("effectivity-module-5", "se-holmium-cable", "se-holmium-cable", 20)
-- Efficiency Module 6
data_util.replace_or_add_ingredient("effectivity-module-6", "effectivity-module-5", "effectivity-module-5", modules_per_tier)
data_util.replace_or_add_ingredient("effectivity-module-6", "se-holmium-solenoid", "se-holmium-solenoid", 20)
data_util.replace_or_add_ingredient("effectivity-module-6", "se-energy-catalogue-2", "se-energy-catalogue-2", 1)
-- Efficiency Module 7
data_util.replace_or_add_ingredient("effectivity-module-7", "effectivity-module-6", "effectivity-module-6", modules_per_tier)
data_util.replace_or_add_ingredient("effectivity-module-7", "se-quantum-processor", "se-quantum-processor", 20)
data_util.replace_or_add_ingredient("effectivity-module-7", "se-energy-catalogue-3", "se-energy-catalogue-3", 1)
-- Efficiency Module 8
data_util.replace_or_add_ingredient("effectivity-module-8", "effectivity-module-7", "effectivity-module-7", modules_per_tier)
data_util.replace_or_add_ingredient("effectivity-module-8", "se-dynamic-emitter", "se-dynamic-emitter", 20)
data_util.replace_or_add_ingredient("effectivity-module-8", "se-energy-catalogue-4", "se-energy-catalogue-4", 1)
data_util.replace_or_add_ingredient("effectivity-module-8", "se-chemical-gel", "se-chemical-gel", 200, true)
-- Efficiency Module 9
data_util.replace_or_add_ingredient("effectivity-module-9", "effectivity-module-8", "effectivity-module-8", modules_per_tier)
data_util.replace_or_add_ingredient("effectivity-module-9", "se-superconductive-cable", "se-superconductive-cable", 20)
data_util.replace_or_add_ingredient("effectivity-module-9", "se-deep-catalogue-1", "se-deep-catalogue-1", 1)
data_util.replace_or_add_ingredient("effectivity-module-9", "se-antimatter-stream", "se-antimatter-stream", 200, true)


------------------- Science Packs -------------------
--Astronomic science pack 1
data_util.replace_or_add_ingredient("se-astronomic-science-pack-1", "se-beryllium-plate", "se-beryllium-plate", 10)
--Astronomic science pack 2
data_util.replace_or_add_ingredient("se-astronomic-science-pack-2", "se-aeroframe-pole", "se-aeroframe-pole", 10)
--data_util.replace_or_add_ingredient("se-astronomic-science-pack-2", "se-astronomic-science-pack-1", "se-astronomic-science-pack-1", 1)
--Astronomic science pack 3
data_util.replace_or_add_ingredient("se-astronomic-science-pack-3", "se-aeroframe-scaffold", "se-aeroframe-scaffold", 10)
--data_util.replace_or_add_ingredient("se-astronomic-science-pack-3", "se-astronomic-science-pack-2", "se-astronomic-science-pack-2", 2)
--Astronomic science pack 4
--data_util.replace_or_add_ingredient("se-astronomic-science-pack-4", "se-aeroframe-bulkhead", "se-aeroframe-bulkhead", 10)
--data_util.replace_or_add_ingredient("se-astronomic-science-pack-4", "se-astronomic-science-pack-3", "se-astronomic-science-pack-3", 4)

--Biological science pack 1
data_util.replace_or_add_ingredient("se-biological-science-pack-1", "se-vitamelange-extract", "se-vitamelange-extract", 10)
--Biological science pack 2
--data_util.replace_or_add_ingredient("se-biological-science-pack-2", "se-bioscrubber", "se-bioscrubber", 10)
--data_util.replace_or_add_ingredient("se-biological-science-pack-2", "se-biological-science-pack-1", "se-biological-science-pack-1", 1)
--Biological science pack 3
data_util.replace_or_add_ingredient("se-biological-science-pack-3", "se-vitalic-reagent", "se-vitalic-reagent", 10)
--data_util.replace_or_add_ingredient("se-biological-science-pack-3", "se-biological-science-pack-2", "se-biological-science-pack-2", 2)
--Biological science pack 4
--data_util.replace_or_add_ingredient("se-biological-science-pack-4", "se-vitalic-epoxy", "se-vitalic-epoxy", 10)
--data_util.replace_or_add_ingredient("se-biological-science-pack-4", "se-biological-science-pack-3", "se-biological-science-pack-3", 4)
--data_util.remove_ingredient("se-biological-science-pack-4", "se-core-fragment-vitamelange-core") --why don't this work :(
data.raw["recipe"]["se-biological-science-pack-4"].ingredients = {
  { "se-biological-catalogue-4", 1 },
  { "se-biological-science-pack-3", 1 },
  { "se-vitalic-epoxy", 10 },
  --{ "se-core-fragment-".. data_util.mod_prefix .."vitamelange", 1 }, --God, no
  { "se-biological-insight", 1 },
  { "se-significant-data", 1 },
  { type = "fluid", name = "se-space-coolant-cold", amount = 20}
}

--Energy science pack 1
data_util.replace_or_add_ingredient("se-energy-science-pack-1", "se-holmium-plate", "se-holmium-plate", 10)
--Energy science pack 2
data_util.replace_or_add_ingredient("se-energy-science-pack-2", "se-holmium-cable", "se-holmium-cable", 10)
--data_util.replace_or_add_ingredient("se-energy-science-pack-2", "se-energy-science-pack-1", "se-energy-science-pack-1", 1)
--Energy science pack 3
data_util.replace_or_add_ingredient("se-energy-science-pack-3", "se-holmium-solenoid", "se-holmium-solenoid", 10)
--data_util.replace_or_add_ingredient("se-energy-science-pack-3", "se-energy-science-pack-2", "se-energy-science-pack-2", 2)
--Energy science pack 4
--data_util.replace_or_add_ingredient("se-energy-science-pack-4", "se-quantum processor", "se-quantum processor", 5)
--data_util.replace_or_add_ingredient("se-energy-science-pack-4", "se-energy-science-pack-3", "se-energy-science-pack-3", 4)

--Material science pack 1
data_util.replace_or_add_ingredient("se-material-science-pack-1", "se-iridium-plate", "se-iridium-plate", 10)
--Material science pack 2
--data_util.replace_or_add_ingredient("se-material-science-pack-2", "se-heavy-girder", "se-heavy-girder", 10)
--data_util.replace_or_add_ingredient("se-material-science-pack-2", "se-material-science-pack-1", "se-material-science-pack-1", 1)
--Material science pack 3
data_util.replace_or_add_ingredient("se-material-science-pack-3", "se-heavy-bearing", "se-heavy-bearing", 10)
--data_util.replace_or_add_ingredient("se-material-science-pack-3", "se-material-science-pack-2", "se-material-science-pack-2", 2)
--Material science pack 4
--data_util.replace_or_add_ingredient("se-material-science-pack-4", "se-heavy-composite", "se-heavy-composite", 10)
--data_util.replace_or_add_ingredient("se-material-science-pack-4", "se-material-science-pack-3", "se-material-science-pack-3", 4)