return function()
	local tests = script.Parent
	local root = tests.Parent
	local Packages = root.Parent

	local expect = require(Packages.Dev.JestGlobals).expect
	local getAll = require(root.getAll)

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
		expect(getAll("oof")).toEqual(expect.arrayContaining({ instances.oof }))
	end)

	it("returns multiple instances tagged with `button`", function()
		instances, cleanInstances = InstanceSetup.create({
			buttonA = { "button" },
			buttonB = { "button", "animated" },
		})
		expect(getAll("button")).toEqual(
			expect.arrayContaining({ instances.oof, instances.oof2 })
		)
	end)

	it("returns the instance tagged with `link` and `tooltip`", function()
		instances, cleanInstances = InstanceSetup.create({
			button = { "link" },
			tooltipButton = { "link", "tooltip" },
			tooltipAnimatedButton = { "link", "tooltip", "animated" },
		})
		expect(getAll("link", "tooltip")).toEqual(expect.arrayContaining({
			instances.tooltipButton,
			instances.tooltipAnimatedButton,
		}))
	end)

	it("returns an empty list if there is no instances tagged with `animated`", function()
		instances, cleanInstances = InstanceSetup.create({
			button = { "button" },
		})
		expect(getAll("animated")).toEqual({})
	end)
end
