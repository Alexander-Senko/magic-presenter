# 🧙 Magic Presenter

![GitHub Actions Workflow Status](
	https://img.shields.io/github/actions/workflow/status/Alexander-Senko/magic-presenter/ci.yml
)
![Code Climate maintainability](
	https://img.shields.io/codeclimate/maintainability-percentage/Alexander-Senko/magic-presenter
)
![Code Climate coverage](
	https://img.shields.io/codeclimate/coverage/Alexander-Senko/magic-presenter
)

A bit of history: this gem was inspired by digging deeper into [Draper](https://github.com/drapergem/draper) with an eye on a refactoring.

Based on [Magic Decorator](https://github.com/Alexander-Senko/magic-decorator), it implements a presenter logic.

## Installation

Install the gem and add to the application's Gemfile by executing:

	$ bundle add magic-presenter

If bundler is not being used to manage dependencies, install the gem by executing:

	$ gem install magic-presenter

After all the gems are `bundle`d run the installer in the project directory to generate the necessary files:

	$ bin/rails generate magic:presenter:install

## Usage

`Magic::Presenter::Base` is a basic presenter class to be inherited by any other presenter.
It further inherits from [`SimpleDelegator`](
	https://docs.ruby-lang.org/en/master/SimpleDelegator.html
).

```ruby
class PersonPresenter < Magic::Presenter::Base
  def name = "#{first_name} #{last_name}"
end

class Person
  include ActiveModel::Model
  attr_accessor :first_name, :last_name
end

person = Person.new(first_name: 'John', last_name: 'Smith').decorate
person.name # => "John Smith"
```

### `Magic::Presentable`

This module includes `Magic::Decoratable` and allows a descendant to be decorated by presenters only.
Presenter class is being inferred automatically.
When no presenter is found,
- `#decorate`  returns `nil`,
- `#decorate!` raises `Magic::Lookup::Error`,
- `#decorated` returns the original object.

### Generators

A generator can be used to generate a presenter:

	$ bin/rails generate presenter Person

See the help for more info:

	$ bin/rails generate presenter --help

### View helpers

A presenter can use any helpers via `#helpers` (aliased as `#h`) both in class and instance methods:

```ruby
class PersonPresenter < Magic::Presenter::Base
  def self.links
    [ h.link_to('All', model_class) ]
  end
  
  def link(...) 
    helpers.link_to(name, self, ...)
  end
end
```

A view context must be set to enable helpers.
It’s done automagically [wherever possible](#view-context).
However, one can set it explicitly anywhere:

```ruby
Magic::Presenter.with view_context: ApplicationController.new.view_context do
  # put the code that uses helpers within presenters here
end
```

> [!NOTE]
> A valid `request` may be needed for URL helpers to get host info.

## 🧙 Magic

It’s based on [Magic Decorator](
	https://github.com/Alexander-Senko/magic-decorator#magic
), so get familiar with that one as well.

### Presentable scope

`Magic::Presentable` is mixed into `ActiveModel::API` by default.
It means that any model, be it `ActiveRecord::Base`, `Mongoid::Document` or whatever else, is _magically presentable_.

### Presenter class inference

Presenters provide automatic class inference for any model based on its class name powered by [Magic Lookup](
	https://github.com/Alexander-Senko/magic-lookup
).

For example, `MyNamespace::MyModel.new.decorate` looks for `MyNamespace::MyPresenter` first.
When missing, it further looks for decorators for its ancestor classes, up to `ObjectPresenter`.

#### Mapping rules

- `MyObject` → `MyObjectPresenter`
- `MyModel`  → `MyPresenter`
- `MyRecord` → `MyPresenter`

> [!TIP]
> That’s why `ApplicationPresenter` presents `ApplicationRecord`  alongside all its descendants automagically with no extra code.

When in doubt, one can use `Magic::Presenter.name_for`:

```ruby
Magic::Presenter.name_for Person # => "PersonPresenter"
```

### In views

> [!IMPORTANT]
> Every object passed to views is decorated automagically.
> This involves both implicit instance variables and `locals` passed explicitly.

### Helpers

One can call helpers directly without explicit `helper` or `h`:

```ruby
class PersonPresenter < Magic::Presenter::Base
  def self.links
    [ link_to('All', model_class) ]
  end

  def link(...) = link_to(name, self, ...)
end
```

#### View context

View context is set automagically to enable helpers:
- in views.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Alexander-Senko/magic-presenter. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/Alexander-Senko/magic-presenter/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Magic Presenter project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Alexander-Senko/magic-presenter/blob/main/CODE_OF_CONDUCT.md).
