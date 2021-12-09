local processServiceExists, ProcessService = pcall(function()
	return game:GetService("ProcessService")
end)

local Packages = script.Parent:FindFirstChild("Packages")
if not Packages then
	error("Packages not found")
end

local TestEZ = require(Packages.Dev.JestGlobals).TestEZ

-- Run all tests, collect results, and report to stdout.
local result = TestEZ.TestBootstrap:run(
	{ Packages.TagUtils },
	TestEZ.Reporters.TextReporterQuiet
)

if result.failureCount == 0 and #result.errors == 0 then
	if processServiceExists then
		ProcessService:ExitAsync(0)
	end
end

if processServiceExists then
	ProcessService:ExitAsync(1)
end

return nil
