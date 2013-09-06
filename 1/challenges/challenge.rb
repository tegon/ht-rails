# -*- encoding: utf-8 -*-
class Object
  def _(*)
    raise Challenge::NotAnswered, "Replace _ with your answer"
  end

  def _!(*)
    raise Challenge::NotAnswered, "Replace _! with your answer"
  end

  def _?(*)
    raise Challenge::NotAnswered, "Replace _? with your answer"
  end
end

class Challenge
  attr_accessor :description, :block, :number

  class NotAnswered < StandardError; end
  class WrongAnswer < StandardError; end

  def self.count
    @count ||= 0
  end

  def self.count=(number)
    @count = number
  end

  def initialize(description, &block)
    self.class.count += 1
    @number = self.class.count
    @description = description
    @block = block
  end

  def run
    instance_eval(&block)
    options = {:status => :correct}
  rescue WrongAnswer => error
    options = {
      :backtrace => error.backtrace[1],
      :message   => "Wrong answer!",
      :status    => :wrong_answer
    }
  rescue NotAnswered => error
    options = {
      :backtrace => error.backtrace[1],
      :message   => error.message,
      :status      => :not_answered
    }
  rescue Exception => error
    options = {
      :backtrace => error.backtrace[0],
      :message   => error.message,
      :status    => :error,
      :emoticon  => "(╯°□°)╯︵┻━┻"
    }
  ensure
    puts process(options)
  end

  def expect(&block)
    raise WrongAnswer unless block.call == true
  end

  def expect_exception(subject, &block)
    begin
      block.call
    rescue Exception => error
    end

    case subject
    when String
      raise WrongAnswer unless error.message == subject
    else
      raise WrongAnswer unless subject.name == error.class.name
    end
  end

  def line_number_for(string)
    _, line = *string.match(/:(\d+):/)
    line
  end

  def process(options)
    output = "#%.2d " % number
    output << (options[:status] == :correct ? "[DONE]" : "[FAIL]")
    beginning = "\n" + " " * output.size + " "

    output << " " << description.shift
    description.each {|desc| output << beginning << desc}
    output << beginning << options[:message] if options[:message]
    output << " (line #{line_number_for(options[:backtrace])})" if options[:backtrace]
    output << beginning << options[:emoticon] if options[:emoticon]
    puts output
  end
end

def challenge(*descriptions, &block)
  Challenge.new(descriptions, &block).run
end
