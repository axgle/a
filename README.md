# a
Using commands you create you can generate project trees.

## Build & install:
```ruby
    rake
```

You can also do each step individually. Check out the list of tasks:
```ruby
    rake -T
```

## Usage:
*Generate a Ruby gem project.*
```ruby
    # Generate a gem.
    a gem my_gem

    # The tree Unix command can you show your results!
    tree
    .
    ├── my_gem.gemspec
    ├── bin
    │   └── my_gem
    ├── lib
    │   └── my_gem.rb
    ├── Rakefile
```

**a** has a set of *commands* it can execute. These *commands* all
generate project trees for many possible different kinds of projects.

*Checkout a list of commands*
```ruby
    a --list
```

Commands are just **.rb** files kept in the ***$HOME/.config/a/commands***.
For an example check the **examples** directory.

The description of the command is always a comment at the top of the file.
```ruby
# This description will appear when a --list is used.

module A
    class Foo
    end
end

a --list
foo # This description will appear when a --list is used.
bar # This description will also appear when a --list is used.
```

## license:
MIT
