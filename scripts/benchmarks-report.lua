-- Generate a report of the benchmarks
-- Check SCRIPTING for information about the available fields
-- the name of the file created and the  rates are both arguments but I cannot understand how to read
-- them

function done(summary, latency, requests)
    file = io.open("report.dat", "a")
    -- latency returns values in microseconds
    avg_ms = latency.mean/1000
    stdev_ms = latency.stdev/1000  
    line = string.format("__PLACEHOLDER__  %.3f  %.3f  %d", avg_ms, stdev_ms, summary.requests)
    file:write(line, "\n")
    file:close()
end
