# 🧙 Magic Presenter

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

## Magic

It’s based on [Magic Decorator](
	https://github.com/Alexander-Senko/magic-decorator#magic
), so get familiar with that one as well.

### Presentable scope

`Magic::Presentable` is mixed into `ActiveModel::Model` by default.
It means that any model, be it `ActiveRecord::Base`, `Mongoid::Document` or whatever else, is _magically presentable_.

### Presenter class inference

Presenters provide automatic class inference for any model based on its class name powered by [Magic Lookup](
	https://github.com/Alexander-Senko/magic-lookup
).

For example, `MyNamespace::MyModel.new.decorate` looks for `MyNamespace::MyModelPresenter` first.
When missing, it further looks for decorators for its ancestor classes, up to `ObjectPresenter`.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Alexander-Senko/magic-presenter. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/Alexander-Senko/magic-presenter/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Magic Presenter project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Alexander-Senko/magic-presenter/blob/main/CODE_OF_CONDUCT.md).
