# RequireRetroService
Services ported from new Roblox versions to old Roblox.

## Current Services:
TweenService (2006+) (Replace enums with strings) (Enum.EasingStyle.Linear -> "Linear")

task (2006+) (No changes needed, it will error when cancelling but will still run)

Attributes (2006?+) (To import attributes, execute attributesConvert.lua in the command bar) (You're required to replace Instance:SetAttribute(a,b) with Attributes.SetAttribute(Instance,a,b))
