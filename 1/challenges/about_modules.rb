require_relative "challenge"

# Your class and module goes here
module Skills
  def knows?(skill)
    true if @skills.include?(skill)
  end
end

class User
  include Skills

  attr_accessor :skills

  # def knows?(skill)
  #   true if @skills.include?(skill)
  # end
end

class Ninja
  include Skills

  attr_accessor :skills

  # def knows?(skill)
  #   true if @skills.include?(skill)
  # end
end

class ChuckNorris
  include Skills

  def knows?(skill)
    true
  end
end

challenge "Create a module called Skills" do
  expect {
    defined?(Skills) && Skills.class == Module
  }
end

challenge "Create a class called User" do
  expect { defined?(User) && User.class == Class }
end

challenge "Include the Skills module on the User class" do
  expect {
    User.included_modules.include?(Skills)
  }
end

challenge "Create `Skills#knows?(skill)` method" do
  expect {
    Skills.instance_methods.include?(:knows?)
  }
end

challenge "Add a `skills` attribute to the user class. It must expect",
          "an array (no need to check type)." do
  expect {
    user = User.new
    user.respond_to?(:skills) && user.respond_to?(:skills=)
  }
end

challenge "The `Skills#knows?` method must return `true` when a",
          "given skill is present on the `User#skills` array." do
  user = User.new
  user.skills = [:ruby, :rails, :javascript]

  expect { user.knows?(:ruby) }
  expect { user.knows?(:rails) }
  expect { user.knows?(:javascript) }
  expect { !user.knows?(:java) }
end

challenge "Create a new class called `Ninja`." do
  expect { defined?(Ninja) && Ninja.class == Class }
end

challenge "Share the same `Skills` module with the `Ninja` class." do
  expect { Ninja.included_modules.include?(Skills) }
end

challenge "Add the `Ninja#skills` attribute. What happens next?" do
  ninja = Ninja.new
  ninja.skills = [:ninjutsu, :spionage, :survival]

  expect { ninja.knows?(:ninjutsu) }
  expect { ninja.knows?(:spionage) }
  expect { ninja.knows?(:survival) }
end

challenge "Create a new class called `ChuckNorris`." do
  expect { defined?(ChuckNorris) && ChuckNorris.class == Class }
end

challenge "Share the `Skills` module with the `ChuckNorris` class." do
  expect { ChuckNorris.included_modules.include?(Skills) }
end

challenge "Define a new method called `ChuckNorris#knows?(skill)`.",
          "This method must always return `true`." do
  chuck = ChuckNorris.new

  # GOOD TO KNOW
  # Everytime a method is redefined, it overrides the original
  # implementation.

  expect { chuck.knows?(:karate) }
  expect { chuck.knows?(:kungfu) }
  expect { chuck.knows?(:ninjutsu) }
  expect { chuck.knows?(:everything) }
end
