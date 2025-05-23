## [1.1.0] — 2025-05-20

### Added

- Handling of edge cases in `Magic::Presenter::Base.model_class`:
	- Guess a corresponding model class by name when several matching ones are found.
	- Respect overridden `.for`/`.name_for` instead of using the basic `Presenter.for` all the time.


## [1.0.0] — 2024-11-23

This release marks the gem to be stable enough.

### Added

- Delegate missing presenter class methods to a model class.
- An optional `engine:` parameter for `Magic.eager_load`
  to be used by other engines to make their presenters visible for lookups.
- `Magic.each_engine` to iterate over all the engines attached.

#### Tests

- `Magic::Presenter::TestCase` to test presenters.
- View context with routing helpers for presenter specs.

#### Generators

- Generate presenters instead of helpers.

### Fixed

- `undefined method 'configure' for module RSpec`.
- Instance variables assignment in views.

### Documentation

- Added a section about testing.


## [0.4.0] — 2024-10-29

### Added

- View helpers inside presenter context.
- View helpers for presenters within views.
- View helpers for presenters within controllers.
- View helpers for presenters within mailers.


## [0.3.0] — 2024-10-27

### Added

- Auto decoration in views.
- Active Job support via implementing Global ID.
- `Magic::Presenter::Base.model_class` as the inverse of 	`Magic::Presenter::Base.for`.
- `Magic.eager_load` to eagerly load different class scopes, be them presenters, models or whatever else.


## [0.2.0] — 2024-10-26

### Added

- Enhanced presenter naming rules.
- Generators:
	- `magic:presenter:install`
	- `presenter`
		- Test::Unit
		- RSpec

### Fixed

- Integration with Active Record models.
- Lookup error reporting: `Magic::Presenter` should be used as a lookup base instead of `Magic::Decorator`.
- Magic Lookup requires presenters to be eagerly loaded to be accessible via lookups.


## [0.1.0] — 2024-10-19

### Added

- `Magic::Presenter::Base` — a basic presenter class.
- `Magic::Presentable` to be included in presentable classes.
	- `#decorate`,
	- `#decorate!`,
	- `#decorated`,
	- `#decorated?`.
