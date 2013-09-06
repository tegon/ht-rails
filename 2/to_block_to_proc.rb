def run(&block) # block to proc
  block.call
end

run { puts "running!" }

handler = proc { puts "running again!" }

run(&handler) # proc to block

class MyCustomRunner
  def hello
    puts "hello"
  end

  def to_proc
    proc { hello }
  end
end

handler = MyCustomRunner.new

run(&handler)