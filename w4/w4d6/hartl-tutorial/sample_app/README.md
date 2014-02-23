# Ruby on Rails Tutorial: sample application

This is the sample application for
the [*Ruby on Rails Tutorial*](http://railstutorial.org/)
by [Michael Hartl](http://michaelhartl.com/).

* if you get a deprecation warning like:
```ruby
[deprecated] I18n.enforce_available_locales will default to true in the future
```

- get it of it by editing config/application.rb:
```ruby
require File.expand_path('../boot', __FILE__)
.
.
.
module SampleApp
  class Application < Rails::Application
    .
    .
    .
    I18n.enforce_available_locales = true
    .
    .
    .
  end
end
```