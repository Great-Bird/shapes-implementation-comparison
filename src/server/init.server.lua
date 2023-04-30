--!strict

local Benchmarker = require(game:GetService("ReplicatedStorage").Shared.shapes.Benchmarker)
local ShapesOOP = require(game:GetService("ReplicatedStorage").Shared.shapes.ShapesOOP)
local ShapesData = require(game:GetService("ReplicatedStorage").Shared.shapes.ShapesData)

local function totalAreaOOP(shapeObjects)
    local accumulator = 0
    for _, shape in ipairs(shapeObjects) do
        accumulator += shape:Area()
    end
    return accumulator
end

local function getAreaIf(shape: ShapesData.Shape)
    local result = 0
    if shape.type == "Square" then
        result = shape.width * shape.width
    elseif shape.type == "Rectangle" then
        result = shape.width * shape.height
    elseif shape.type == "Triangle" then
        result = 0.5 * shape.width * shape.height
    elseif shape.type == "Circle" then
        result = math.pi * shape.width * shape.width
    end
    return result
end
local function totalAreaIf(shapes: {ShapesData.Shape})
    local accumulator = 0
    for _, shape in shapes do
        accumulator += getAreaIf(shape)
    end
    return accumulator
end

local shapeCoefficients: { [ShapesData.ShapeType]: number } = {
    Square = 1,
    Rectangle = 1,
    Triangle = 0.5,
    Circle = math.pi,
}
local function getAreaCoefficientTable(shape: ShapesData.Shape)
    return shapeCoefficients[shape.type] * shape.width * shape.height
end
local function totalAreaCoefficientTable(shapes: { ShapesData.Shape })
    local accumulator = 0
    for _, shape in shapes do
        accumulator += getAreaCoefficientTable(shape)
    end
    return accumulator
end

local shapeObjects: {any} = {
    ShapesOOP.Square.new(5),
    ShapesOOP.Rectangle.new(5, 8),
    ShapesOOP.Triangle.new(5, 8),
    ShapesOOP.Circle.new(5),
}
local shapes: {ShapesData.Shape} = {
    ShapesData.Square(5),
    ShapesData.Rectangle(5, 8),
    ShapesData.Triangle(5, 8),
    ShapesData.Circle(5),
}

Benchmarker.benchmark("totalAreaOOP", totalAreaOOP, shapeObjects)
Benchmarker.benchmark("totalAreaIf", totalAreaIf, shapes)
Benchmarker.benchmark("totalAreaCoefficientTable", totalAreaCoefficientTable, shapes)

Benchmarker.benchmarkRepeated("totalAreaOOP x 1000", 1000, totalAreaOOP, shapeObjects)
Benchmarker.benchmarkRepeated("totalAreaIf x 1000", 1000, totalAreaIf, shapes)
Benchmarker.benchmarkRepeated("totalAreaCoefficientTable x 1000", 1000, totalAreaCoefficientTable, shapes)
