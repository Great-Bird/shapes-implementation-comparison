--!strict

local Benchmarker = require(game:GetService("ReplicatedStorage").Shared.shapes.Benchmarker)
local ShapesOOP = require(game:GetService("ReplicatedStorage").Shared.shapes.ShapesOOP)
local ShapesIf = require(game:GetService("ReplicatedStorage").Shared.shapes.ShapesIf)

local function totalAreaOOP(shapeObjects)
    local accumulator = 0
    for _, shape in ipairs(shapeObjects) do
        accumulator += shape:Area()
    end
    return accumulator
end

local Square = "Square"
local Rectangle = "Rectangle"
local Triangle = "Triangle"
local Circle = "Circle"
local function getAreaIf(shape: ShapesIf.Shape)
    local result = 0
    if shape.type == Square then
        result = shape.width * shape.width
    elseif shape.type == Rectangle then
        result = shape.width * shape.height
    elseif shape.type == Triangle then
        result = 0.5 * shape.width * shape.height
    elseif shape.type == Circle then
        result = math.pi * shape.width * shape.width
    end
    return result
end

local function totalAreaIf(shapes: {ShapesIf.Shape})
    local accumulator = 0
    for _, shape in shapes do
        accumulator += getAreaIf(shape)
    end
    return accumulator
end


local shapeObjects: {any} = {
    ShapesOOP.Square.new(5),
    ShapesOOP.Rectangle.new(5, 8),
    ShapesOOP.Triangle.new(5, 8),
    ShapesOOP.Circle.new(5),
}
local shapes: {ShapesIf.Shape} = {
    ShapesIf.Square(5),
    ShapesIf.Rectangle(5, 8),
    ShapesIf.Triangle(5, 8),
    ShapesIf.Circle(5),
}

Benchmarker.benchmark("totalAreaOOP", totalAreaOOP, shapeObjects)
Benchmarker.benchmark("totalAreaIf", totalAreaIf, shapes)

Benchmarker.benchmarkRepeated("totalAreaOOP x 1000", 1000, totalAreaOOP, shapeObjects)
Benchmarker.benchmarkRepeated("totalAreaIf x 1000", 1000, totalAreaIf, shapes)
