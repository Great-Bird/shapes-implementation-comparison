--!strict

local Square = {}
Square.__index = Square

function Square.new(side: number)
    return setmetatable({
        _side = side,
    }, Square)
end

export type Square = typeof(Square.new(...))

function Square.Area(self: Square)
    return self._side * self._side
end


------


local Rectangle = {}
Rectangle.__index = Rectangle

function Rectangle.new(width: number, height: number)
    return setmetatable({
        _width = width,
        _height = height,
    }, Rectangle)
end

export type Rectangle = typeof(Rectangle.new(1, 2))

function Rectangle.Area(self: Rectangle)
    return self._width * self._height
end


------


local Triangle = {}
Triangle.__index = Triangle

function Triangle.new(base: number, height: number)
    return setmetatable({
        _height = height,
        _base = base,
    }, Triangle)
end

export type Triangle = typeof(Triangle.new(...))

function Triangle.Area(self: Triangle)
    return 1/2 * self._height * self._base
end


------


local Circle = {}
Circle.__index = Circle

function Circle.new(radius: number)
    return setmetatable({
        _radius = radius,
    }, Circle)
end

export type Circle = typeof(Circle.new(...))

function Circle.Area(self: Circle)
    return math.pi * self._radius * self._radius
end


------


return {
    Square = Square,
    Rectangle = Rectangle,
    Triangle = Triangle,
    Circle = Circle,
}
