# Active Admin for Rails Developers

[Active Admin](https://www.activeadmin.org) is a Ruby on Rails framework for creating elegant backends for website administration.

This is a significant fork of the original Active Admin project
starting in 2018 with v1.3.1 and abandoning v2.0.0.alpha started one year earlier.

This fork aims to make it simpler and more Rails-like without dropping the
rich functionality that made Active Admin a leading choice for a decade.
See [CHANGELOG] for more details.

Active Admin is open source software, [free as in puppy].
As of writing this software is in production with at least one mid-size business,
but Varyonic has no plans to provide commercial support - let us know if you do.

[![Version         ][rubygems_badge]][rubygems]
[![Github Actions  ][actions_badge]][actions]
[![Quality         ][codeclimate_badge]][codeclimate]
[![Coverage        ][codecov_badge]][codecov]
[![Inch CI         ][inch_badge]][inch]

## Goals

1. Enable developers to quickly create good-looking administration interfaces.
2. Follow Rails conventions that make the framework easy to understand and customize.

## Getting started

* Check out [the docs][docs].
* Try the [live demo][demo].
* The [wiki] includes links to tutorials, articles and sample projects.

## Need help?

Please use [StackOverflow][stackoverflow] for help requests and how-to questions.

Please open GitHub issues for bugs and enhancements only, not general help requests.
Please search previous issues (and Google and StackOverflow) before creating a new issue.

Google Groups, IRC #activeadmin and Gitter are not actively monitored.

## Want to contribute?

The [contributing guide][contributing]
is a good place to start. If you have questions, feel free to ask.

## Dependencies

We try not to reinvent the wheel, so Active Admin is built with other open source projects:

Tool                  | Description
--------------------- | -----------
[Arbo]                | HTML Views in Ruby.
[Devise]              | Powerful, extensible user authentication
[Formtastic]          | A Rails form builder plugin with semantically rich and accessible markup
[Inherited Resources] | Simplifies controllers with pre-built RESTful controller actions
[Kaminari]            | Elegant pagination for any sort of collection
[Ransack]             | Provides a simple search API to query your data

[Arbo]: https://github.com/varyonic/arbo
[Devise]: https://github.com/plataformatec/devise
[Formtastic]: https://github.com/justinfrench/formtastic
[Inherited Resources]: https://github.com/activeadmin/inherited_resources
[Kaminari]: https://github.com/kaminari/kaminari
[Ransack]: https://github.com/activerecord-hackery/ransack

[rubygems_badge]: http://img.shields.io/gem/v/activeadmin-rails.svg
[rubygems]: https://rubygems.org/gems/activeadmin-rails
[actions_badge]: https://github.com/varyonic/activeadmin/workflows/ci/badge.svg
[actions]: https://github.com/varyonic/activeadmin/actions
[codeclimate_badge]: https://api.codeclimate.com/v1/badges/1698787497cc7d4c7c88/maintainability
[codeclimate]: https://codeclimate.com/github/varyonic/activeadmin/maintainability
[codecov_badge]: https://codecov.io/gh/varyonic/activeadmin/branch/main/graph/badge.svg
[codecov]: https://codecov.io/gh/varyonic/activeadmin
[inch_badge]: http://inch-ci.org/github/varyonic/activeadmin.svg?branch=main
[inch]: http://inch-ci.org/github/varyonic/activeadmin

[docs]: http://activeadmin.org/0-installation.html
[demo]: http://demo.activeadmin.org/admin
[wiki]: https://github.com/varyonic/activeadmin/wiki
[stackoverflow]: http://stackoverflow.com/questions/tagged/activeadmin
[CHANGELOG]: https://github.com/varyonic/activeadmin/blob/main/CHANGELOG.md
[contributing]: https://github.com/varyonic/activeadmin/blob/main/CONTRIBUTING.md
[free as in puppy]: https://www.zdnet.com/article/open-source-free-as-in-beer-puppy-or-mattress/
