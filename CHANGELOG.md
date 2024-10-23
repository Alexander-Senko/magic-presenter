## [0.2.0] — UNRELEASED

### Added

- Enhanced presenter naming rules.

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
