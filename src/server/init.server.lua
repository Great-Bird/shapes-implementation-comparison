--!strict

local Benchmarker = require(game:GetService("ReplicatedStorage").Shared.shapes.Benchmarker)
local Shapes = require(game:GetService("ReplicatedStorage").Shared.shapes.ShapesOOP)

local function totalArea<T>(shapes)
    local accumulator = 0
    for _, shape in ipairs(shapes) do
        accumulator += shape:Area()
    end
    return accumulator
end

local shapes: {any} = {
    Shapes.Square.new(5),
    Shapes.Rectangle.new(5, 8),
    Shapes.Triangle.new(5, 8),
    Shapes.Circle.new(5),
}

Benchmarker.benchmark("totalAreaOOP", totalArea, shapes)
Benchmarker.benchmarkRepeated("totalAreaOOP", 1000, totalArea, shapes)
