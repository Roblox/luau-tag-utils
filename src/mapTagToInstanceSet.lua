local root = script.Parent
local Packages = root.Parent
local Llama = require(Packages.Llama)

local CollectionService = game:GetService("CollectionService")

local function mapTagToInstanceSet(tag: string): { [string]: boolean }
	return Llama.Set.fromList(CollectionService:GetTagged(tag))
end

return mapTagToInstanceSet
