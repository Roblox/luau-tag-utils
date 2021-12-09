return function()
	local tests = script.Parent
	local root = tests.Parent
	local Packages = root.Parent

	local expect = require(Packages.Dev.JestGlobals).expect
	local getUnique = require(root.getUnique)

	local InstanceSetup = require(tests.InstanceSetup)

	local instances = nil
	local cleanInstances = nil

	afterEach(function()
		if cleanInstances then
			cleanInstances()
			cleanInstances = nil
		end
	end)

	it("returns the instance tagged with `oof`", function()
		instances, cleanInstances = InstanceSetup.create({
			oof = { "oof" },
		})
		expect(getUnique("oof")).toBe(instances.oof)
	end)

	it("returns the instance tagged with `link` and `tooltip`", function()
		instances, cleanInstances = InstanceSetup.create({
			button = { "link" },
			tooltipButton = { "link", "tooltip" },
		})
		expect(getUnique("link", "tooltip")).toBe(instances.tooltipButton)
	end)

	it("throws if there is more than one instance tagged with `oof`", function()
		instances, cleanInstances = InstanceSetup.create({
			oof = { "oof" },
			otherOof = { "oof" },
		})
		expect(function()
			getUnique("oof")
		end).toThrow("expected to find only one instance tagged with oof, but found 2")
	end)

	it("throws if there is no instances tagged with `oof`", function()
		instances, cleanInstances = InstanceSetup.create({
			button = { "button" },
		})
		expect(function()
			getUnique("oof")
		end).toThrow("unable to find instance tagged with oof")
	end)
end
