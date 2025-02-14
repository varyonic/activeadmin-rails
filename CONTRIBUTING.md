## Contributing

This is probably not a beginner friendly project: it has a long history, complex functionality, 
and too much cleverness, eg. metaprogramming.

If you are using, or intending to use this project in production it would be great to hear about that in the discussions area.
Fixes are welcome, if you have ideas for improvements reach out to the maintainer first.

Translations and documentation tweaks are welcome, but not a priority, don't expect a quick response.

Linting has become very popular in recent years, eg. rubocop, but depending on the team or project it can quickly
become a couterproductive distraction.  By all means make suggestions, but don't expect a quick response.

### 1. Where do I go from here?

If you've noticed a bug or have a question that doesn't belong on the
[mailing list][] or [Stack Overflow][], [search the issue tracker][] to see if
someone else in the community has already created a ticket. If not, go ahead and
[make one][new issue]!

### 2. Fork & create a branch

If this is something you think you can fix, then [fork Active Admin][] and
create a branch with a descriptive name.

A good branch name would be (where issue #325 is the ticket you're working on):

```sh
git checkout -b 325-add-japanese-translations
```

### 3. Get the test suite running

Make sure you're using a recent ruby and have the `bundler` gem installed.

Select the Gemfile for your preferred Rails version, preferably the latest:

```sh
export BUNDLE_GEMFILE=gemfiles/rails_80.gemfile
```

Now install the development dependencies:

```sh
bundle install
```

Now you should be able to run the entire suite using:

```sh
bundle exec rake
```

The test run will generate a sample Rails application in `spec/rails` to run the
tests against.

If your tests are passing locally but they're failing on GitHub, reset your test
environment:

```sh
rm -rf spec/rails && bundle update
```

### 4. Did you find a bug?

* **Ensure the bug was not already reported** by [searching all issues][].

* If you're unable to find an open issue addressing the problem,
  [open a new one][new issue]. Be sure to include a **title and clear
  description**, as much relevant information as possible, and a **code sample**
  or an **executable test case** demonstrating the expected behavior that is not
  occurring.

* If possible, use the relevant bug report templates to create the issue.
  Simply copy the content of the appropriate template into a .rb file, make the
  necessary changes to demonstrate the issue, and **paste the content into the
  issue description**:
  * [**ActiveAdmin** main issues][main template]

### 5. Implement your fix or feature

At this point, you're ready to make your changes! Feel free to ask for help.

### 6. View your changes in a Rails application

Active Admin is meant to be used by humans, not cucumbers. So make sure to take
a look at your changes in a browser.

To boot up a test Rails app:

```sh
bundle exec rake local server
```

This will automatically create a Rails app if none already exists, and store it
in the `.test-rails-apps` folder.

You should now be able to open <http://localhost:3000/admin> in your browser.
You can log in using:

*User*: admin@example.com
*Password*: password

If you need to perform any other commands on the test application, just pass
them to the `local` rake task. For example, to boot the rails console:

```sh
bundle exec rake local console
```

Or to migrate the database:

```sh
bundle exec rake local db:migrate
```

### 7. Get the style right

Your patch should follow the same conventions & pass the same code quality
checks as the rest of the project. [Codeclimate][codeclimate] will give you
feedback in this regard. You can check & fix codeclimate's feedback by running
it locally using [Codeclimate's CLI][codeclimate cli], via `codeclimate analyze`.

### 8. Make a Pull Request

At this point, you should switch back to your main branch and make sure it's
up to date with Active Admin's main branch:

```sh
git remote add upstream git@github.com:activeadmin/activeadmin.git
git checkout main
git pull upstream main
```

Then update your feature branch from your local copy of main, and push it!

```sh
git checkout 325-add-japanese-translations
git rebase main
git push --set-upstream origin 325-add-japanese-translations
```

Finally, go to GitHub and [make a Pull Request][] :D

Travis CI will run our test suite against all supported Rails versions. We care
about quality, so your PR won't be merged until all tests pass. It's unlikely,
but it's possible that your changes pass tests in one Rails version but fail in
another. In that case, you'll have to setup your development environment (as
explained in step 3) to use the problematic Rails version, and investigate
what's going on!

### 8. Keeping your Pull Request updated

If a maintainer asks you to "rebase" your PR, they're saying that a lot of code
has changed, and that you need to update your branch so it's easier to merge.

To learn more about rebasing in Git, there are a lot of [good][git rebasing]
[resources][interactive rebase] but here's the suggested workflow:

```sh
git checkout 325-add-japanese-translations
git pull --rebase upstream main
git push --force-with-lease 325-add-japanese-translations
```

### 10. Merging a PR (maintainers only)

A PR can only be merged into main by a maintainer if:

* It is passing CI.
* It has been approved by at least two maintainers. If it was a maintainer who
  opened the PR, only one extra approval is needed.
* It has no requested changes.
* It is up to date with current main.

Any maintainer is allowed to merge a PR if all of these conditions are
met.

[mailing list]: http://groups.google.com/group/activeadmin
[Stack Overflow]: http://stackoverflow.com/questions/tagged/activeadmin
[search the issue tracker]: https://github.com/activeadmin/activeadmin/issues?q=something
[new issue]: https://github.com/activeadmin/activeadmin/issues/new
[fork Active Admin]: https://help.github.com/articles/fork-a-repo
[searching all issues]: https://github.com/activeadmin/activeadmin/issues?q=
[main template]: https://github.com/varyonic/activeadmin/blob/main/lib/bug_report_templates/active_admin_main.rb
[codeclimate]: https://codeclimate.com
[codeclimate cli]: https://github.com/codeclimate/codeclimate
[make a pull request]: https://help.github.com/articles/creating-a-pull-request
[git rebasing]: http://git-scm.com/book/en/Git-Branching-Rebasing
[interactive rebase]: https://help.github.com/articles/interactive-rebase
