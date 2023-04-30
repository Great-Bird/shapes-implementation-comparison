export type ShapeType = "Square" | "Rectangle" | "Triangle" | "Circle"

export type Shape = {
    type: ShapeType,
    width: number,
    height: number,
}

local function Square(side: number): Shape
    return {
        type = "Square",
        width = side,
        height = side,
    }
end

local function Rectangle(width: number, height: number): Shape
    return {
        type = "Rectangle",
        width = width,
        height = height,
    }
end

local function Triangle(base: number, height: number): Shape
    return {
        type = "Triangle",
        width = base,
        height = height,
    }
end

local function Circle(radius: number): Shape
    return {
        type = "Circle",
        width = radius,
        height = radius,
    }
end

return {
    Square = Square,
    Rectangle = Rectangle,
    Triangle = Triangle,
    Circle = Circle,
}
