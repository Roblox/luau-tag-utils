#!/bin/sh

set -ex

selene src
stylua -c src

roblox-cli analyze tests.project.json

roblox-cli run --load.model tests.project.json --run ./scripts/run-tests.lua --lua.globals=NOCOLOR=true
