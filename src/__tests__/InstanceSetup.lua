local CollectionService = game:GetService("CollectionService")
local Workspace = game:GetService("Workspace")

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
	local instances = {}
	for name, tags in pairs(config) do
		instances[name] = createInstance(tags, name)
	end
	return instances,
		function()
			for _, instance in pairs(instances) do
				instance:Destroy()
			end
		end
end

return InstanceSetup
