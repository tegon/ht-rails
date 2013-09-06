class String
  def strip_heredoc
    _, whitespaces = *self.match(/^(\s+)/)
    self.gsub(/^#{Regexp.escape(whitespaces)}/, "")
  end
end

string = "Hello there! With \"Quotes\" and 'single quotes'.\nAnd breaklines too."
puts string

string = 'Hello there! With "quotes" \'single quotes\'.\nNot breaklines'
puts string

string = %[Hello there! With "quotes" and 'single quotes'. \nAnd breaklines too.]
puts string

string = <<TEXT.upcase.downcase
Hello there! With "quotes" and 'single quotes'.
And breaklines too.
TEXT
puts string

    string = <<-TEXT.strip_heredoc
      Hello there! With "quotes" and 'single quotes'.
        And breaklines too.
    TEXT

string = %q[hello\nworld]
string = %Q[hello\nworld]
string = %Q(hello\nworld)
string = %Q|hello\nworld|

puts string