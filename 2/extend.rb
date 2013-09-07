module Color
  p self == Color
  extend self

  def red
    :red
  end

  def green
    :green

  end

  def blue
    :blue
  end
end

class PrintColors
  p self == PrintColors
  extend Color
  include Color
end

colors = Object.new.extend(Color)
p colors
puts colors.red

p PrintColors.blue
p PrintColors.new.green
p Color.red
p Color.blue