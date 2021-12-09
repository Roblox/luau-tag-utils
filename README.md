# TagUtils

A module that provides utility functions to query Instances from tags attached using [CollectionService](https://developer.roblox.com/en-us/api-reference/class/CollectionService)

## API

### `TagUtils.getAll`

```lua
TagUtils.getAll(...: string) -> { Instance }
```

Returns a list of instances that have all the given tags.

#### Example

```lua
-- get every instance tagged with "button"
local buttons = TagUtils.getAll("button")
-- get every instance tagged with "link"
local links = TagUtils.getAll("link")
-- get every instance tagged with "button" and "link"
local linkButtons = TagUtils.getAll("button", "link")
```

### `TagUtils.getAny`

```lua
TagUtils.getAny(...: string) -> { Instance }
```

Returns a list of instances that have at least one of the given tags.

#### Example

```lua
-- get every instance tagged with "button"
local buttons = TagUtils.getAny("button")
-- get every instance tagged with "link"
local links = TagUtils.getAny("link")
-- get every instance tagged with "button" or "link"
local linksOrButtons = TagUtils.getAny("button", "link")
```

### `TagUtils.getUnique`

```lua
TagUtils.getUnique(...: string) -> Instance
```

Returns the instance tagged with all the given tags. This function will throw an error in these two cases:

- No instance is found
- More than one instance is found

#### Example

```lua
-- get the instance tagged with "button-a"
local buttonA = TagUtils.getUnique("button-a")
-- get the instance tagged with "link" and "roblox.com"
local linkToRoblox = TagUtils.getUnique("link", "roblox.com")
```

## Contributing

Check out the [contributing guide](CONTRIBUTING.md) to get started.
