# RequireRetroService
Services ported from new Roblox versions to old Roblox.

## Current Services:
TweenService (Replace enums with strings) (Enum.EasingStyle.Linear -> "Linear")

task (No changes needed, it will error when cancelling but will still run)

Attributes (To export attributes, execute attributesConvert.lua in the command bar) (You're required to replace Instance:SetAttribute(a,b) with Attributes.SetAttribute(Instance,a,b))

typeof (No changes needed, should be deleted whenever it starts to exist)

All of these should work in 2006+
