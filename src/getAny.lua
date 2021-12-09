local CollectionService = game:GetService("CollectionService")

local root = script.Parent
local Packages = root.Parent
local Llama = require(Packages.Llama)
local mapTagToInstanceSet = require(root.mapTagToInstanceSet)

local function getAll(...: string): { Instance }
	local tags = { ... }

	if #tags == 1 then
		return CollectionService:GetTagged(tags[1])
	else
		local sets = Llama.List.map(tags, mapTagToInstanceSet)
		return Llama.Dictionary.keys(Llama.Set.union(unpack(sets)))
	end
end

return getAll
