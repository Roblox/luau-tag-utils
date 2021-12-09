local CollectionService = game:GetService("CollectionService")
local Workspace = game:GetService("Workspace")

local root = script.Parent.Parent
local Packages = root.Parent
local Llama = require(Packages.Llama)

local function createInstance(tags, name)
	local object = Instance.new("Folder")
	object.Name = name
	object.Parent = Workspace
	for _, tag in ipairs(tags) do
		CollectionService:AddTag(object, tag)
	end
	return object
end

local InstanceSetup = {}

function InstanceSetup.create(
	config: { [string]: { string } }
): ({ [string]: Instance }, () -> ())
	local instances = Llama.Dictionary.map(config, createInstance)

	return instances,
		function()
			for _, instance in pairs(instances) do
				instance:Destroy()
			end
		end
end

return InstanceSetup
