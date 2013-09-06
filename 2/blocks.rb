# def run(options = {}, &block)
#   block.call(options) if block
# end
# run(a: 1, b: 2) { |o| p o }

def run(options = {}, &block)
  p options
  yield if block_given?
end

run(a: 1, b: 2) { puts "running!" }
run a: 1, b: 2