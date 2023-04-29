local ShapeBaseInterface = {}
local ShapeBase = {}
ShapeBase.__index = ShapeBase

function ShapeBaseInterface.new()
    return setmetatable({}, ShapeBase)
end

export type ShapeBase = typeof(ShapeBaseInterface.new())

function ShapeBase.GetArea(self: ShapeBase)
    return 0
end

return ShapeBaseInterface
