require "benchmark"

CYCLES = 1_000_000

def explicit(&block)
  block.call
end

def implicit
  Proc.new.call
end

Benchmark.bmbm do |x|
  x.report("explicit") { GC.start; CYCLES.times{ explicit { 100 * 100 } } }
  x.report("implicit") { GC.start; CYCLES.times{ implicit { 100 * 100 } } }
end