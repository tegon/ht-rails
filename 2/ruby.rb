name = "John Doe"

# constants
Foo = 1
FOO = 2
FoO = 3

def silence_warnings
  old, $VERBOSE = $VERBOSE, nil
  yield
ensure
  $VERBOSE = old
end

# old, $VERBOSE = $VERBOSE, nil

silence_warnings do
  Foo = 2
end
# $VERBOSE = old

Foo = 3
p Foo