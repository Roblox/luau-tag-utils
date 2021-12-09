return function()
	local tests = script.Parent
	local root = tests.Parent
	local Packages = root.Parent

	local expect = require(Packages.Dev.JestGlobals).expect
	local TagUtils = require(root)

	it("has a `getAll` function", function()
		expect(TagUtils.getAll).toEqual(expect.any("function"))
	end)

	it("has a `getAny` function", function()
		expect(TagUtils.getAny).toEqual(expect.any("function"))
	end)

	it("has a `getUnique` function", function()
		expect(TagUtils.getUnique).toEqual(expect.any("function"))
	end)
end
