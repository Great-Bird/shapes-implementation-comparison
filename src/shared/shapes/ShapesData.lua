export type ShapeType = "Square" | "Rectangle" | "Triangle" | "Circle"

export type Shape = {
    type: number,
    width: number,
    height: number,
}

local shapeEnum = {
    Square = 1,
    Rectangle = 2,
    Triangle = 3,
    Circle = 4,
}

local function Square(side: number): Shape
    return {
        type = shapeEnum.Square,
        width = side,
        height = side,
    }
end

local function Rectangle(width: number, height: number): Shape
    return {
        type = shapeEnum.Rectangle,
        width = width,
        height = height,
    }
end

local function Triangle(base: number, height: number): Shape
    return {
        type = shapeEnum.Triangle,
        width = base,
        height = height,
    }
end

local function Circle(radius: number): Shape
    return {
        type = shapeEnum.Circle,
        width = radius,
        height = radius,
    }
end

return {
    Square = Square,
    Rectangle = Rectangle,
    Triangle = Triangle,
    Circle = Circle,

    ShapeEnum = shapeEnum,
}
