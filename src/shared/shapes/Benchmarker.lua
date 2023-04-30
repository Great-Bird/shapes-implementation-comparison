--!strict

local function printBenchmarkResults(name: string, time: number, repetitions: number)
    print(`Benchmark for {name}:`)
    print(`Repeat count: {repetitions}`)
    print(`Time: {time}, average: {time / repetitions}`)
end

local Benchmarker = {}

function Benchmarker.benchmark<T...>(name: string, callback: (T...) -> (any), ...: T...)
    local before = os.clock()
    callback(...)
    local after = os.clock()
    printBenchmarkResults(name, after - before, 1)
end

function Benchmarker.benchmarkRepeated<T...>(name: string, repetitions: number, callback: (T...) -> (any), ...: T...)
    local before = os.clock()
    for _ = 1, repetitions do
        callback(...)
    end
    local after = os.clock()
    printBenchmarkResults(name, after - before, repetitions)
end

return Benchmarker
