local ShapeBase = {}
ShapeBase.__index = ShapeBase

function ShapeBase.new()
    return setmetatable({}, ShapeBase)
end

export type ShapeBase = typeof(ShapeBase.new())

function ShapeBase.GetArea(self: ShapeBase)
    return 0
end

return ShapeBase
