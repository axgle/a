# a
Use commands to generate project trees(currently only generates Ruby gems.)

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
    # Generate a gem
    a gem my_gem
```

**a** has a set of *commands* it can execute. These *commands* all
generate project trees for many possible different kinds of projects.

*Checkout a list of commands*
```ruby
    a --list
```
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
