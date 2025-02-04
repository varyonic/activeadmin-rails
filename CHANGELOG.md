# Changelog

## 1.7.2 [☰](https://github.com/varyonic/activeadmin-rails/compare/v1.7.1...v1.7.2)

#### Minor

* Rails 8.0 support. [#54] by [@varyonic]

## 1.7.1 [☰](https://github.com/varyonic/activeadmin-rails/compare/v1.7.0...v1.7.1)

#### Minor

* Rails 7.2 support. [#53] by [@varyonic]
* Verify Ruby 3.3 support. [#50] by [@varyonic]

### Bug Fixes

* Fix streaming CSV export. [#52] by [@varyonic]

### Security Fixes

* Don't restrict jquery-ui-rails upgrades. [#49] by [@varyonic]

## 1.7.0 [☰](https://github.com/varyonic/activeadmin-rails/compare/v1.6.0...v1.7.0)

This release replaces Arbre::Pages with a conventional Rails layout and view partials.
It also allows and encourages implementing Rails controllers explicitly instead of depending on Active Admin meta-programming.

### Enhancements

#### Major

* Add Webpacker compatibility with opt-in config switch and installation generator. [#5855] by [@sgara]
* Rewrite CoffeeScript components in ES6. [#5081] by [@javierjulio]

* Rails 7.1 support. [#43] by [@varyonic]
* Add `ActiveAdmin.configure_resource` and `configure_page`. Don't unload manually defined Rails Controller classes. [#40], [#45] by [@varyonic]
* Extract partial `breadcrumbs`. [#39] by [@varyonic]
* Add `Page#add_page_route`, `Resource#add_member_route` and `add_collection_route`. [#37] by [@varyonic]
* Add `Resource#set_page_options`, `add_sidebar_section`. [#35], [#36] by [@varyonic]
* Use Arbo in place of Arbre. [#31] by [@varyonic]
* Extract partial `filters_form`. [#28] by [@varyonic]
* Use Rails partial `_action_items.html.arb` instead of Views::ActionItems component. [#27] by [@varyonic]
* Add Hotwire support. [#25] by [@varyonic]
* Make rendering a partial the default behavior for `show`, `new`, `edit`, `index as: table` and `content` [#19], [#20], [#21], [#22], [#23], [#33] by [@varyonic]
* Use Rails layout for all pages. [#16] by [@varyonic]

#### Minor

* Fix double modal issue in applications using turbolinks 5. [#5842] by [@sgara]
* Tabs are not correctly created when using non-transliteratable characters as title. [#5650] by [@panasyuk]
* Update JS components. [#5121] by [@javierjulio]
* Remove unused flash JS component. [#5107] by [@javierjulio]

* Ransack 4 support. [#42] by [@varyonic]
* ActionLink view component. [#41] by [@varyonic]
* Verify Ruby 3.2 support. [#38] by [@varyonic]
* Extract protected method ResourceController::csv_builder. [#29] by [@varyonic]
* Accept content_for(:page_title). [#26] by [@varyonic]
* Invoke named batch action method if defined in controller. [#19] by [@varyonic]
* Simplify permitted_params implementation. [#18] by [@varyonic]
* Don't clobber defined controller action method if action DSL block not given. [#17] by [@varyonic]
* Use template partial to render content of head. [#15] by [@varyonic]
* Use new render_in strategy added to varyonic/arbre. [#14] by [@varyonic]

### Security Fixes

* Prevent leaking hashed passwords via user CSV export and adds a config option for sensitive attributes. [#5486] by [@chrp]

## 1.6.0 [☰](https://github.com/varyonic/activeadmin-rails/compare/v1.5.2...v1.6.0)

### Enhancements

* Add Rails 7 Support. [#7235] by [@tagliala]

### Bug Fixes

* Fix frozen string error when downloading CSV and streaming disabled. [#7332] by [@deivid-rodriguez]

## 1.5.2 [☰](https://github.com/varyonic/activeadmin-rails/compare/v1.5.1...v1.5.2)

* Fix Ruby 2.7 warnings about keyword args. [#6000], [#6237] by [@vcsjones] and [@deivid-rodriguez]
* Fix CSVBuilder not respecting `ActiveAdmin.application.csv_options = { humanize_name: false }` setting. [#5800] by [@HappyKadaver]

## 1.5.1 [☰](https://github.com/varyonic/activeadmin-rails/compare/v1.5.0...v1.5.1)

* More fixes to support final release of Rails 6.0.

## 1.5.0 [☰](https://github.com/varyonic/activeadmin-rails/compare/v1.4.0...v1.5.0)

### Enhancements

#### Major

* Rails 6.0 support. [#5702] by [@ionut998]
 
## 1.4.0 [☰](https://github.com/varyonic/activeadmin-rails/compare/v1.3.1...v1.4.0)

### Enhancements

#### Minor
* Fix batch_actions.delete_confirmation translation in zh-CN.yml. [#5453] by [@ShallmentMo]
* Add some missing italian translations. [#5433] by [@stefsava]
* Enhance some chinese translations. [#5413] by [@shouya]
* Add missing filter predicate translations to nb. [#5357] by [@rogerkk]
* Add missing norwegian comment translations. [#5375] by [@rogerkk]
* Add missing dutch translations. [#5368] by [@dennisvdvliet]
* Add missing german translations. [#5341] by [@eikes]
* Add missing spanish translation. [#5336] by [@mconiglio]
* Add from and to predicates for russian language. [#5330] by [@glebtv]
* Fix typo in finnish translation. [#5320] by [@JiiHu]
* Add missing turkish translations. [#5295] by [@kobeumut]
* Add missing chinese translations. [#5266] by [@jasl]
* Allow proc label in datepicker input. [#5408] by [@tiagotex]
* Add `group` attribute to scopes in order to show them in grouped. [#5359] by [@leio10]
* Add missing polish translations and improve existing ones. [#5537] by [@Wowu]
* Add `priority` option to `action_item`. [#5334] by [@andreslemik]

### Bug Fixes

* Fixed "create anoter" checkbox styling. [#5324] by [@faucct]
* Fix `input_html` filter option evaluated only once. [#5376] by [@kjeldahl]
* Fixed the string representation of the resolved `sort_key` when no explicit `sortable` attribute is passed. [#5464] by [@chumakoff]
* Fixed docs on the column `sortable` attribute (which actually doesn't have to be explicitly specified when a block is passed to column). [#5464] by [@chumakoff]
* Add missing I18n for comments. [#5458], [#5461] by [@mauriciopasquier]
* Fixed `if:` scope option when a lambda is passed. [#5501] by [@deivid-rodriguez]
* Comment validation adding redundant errors when resource is missing. [#5517] by [@deivid-rodriguez]
* Fixed resource filtering by association when the resource has custom primary key. [#5446] by [@wasifhossain]
* Fix menu item link with method delete. [#5583] by [@tiagotex]

## 1.3.1 [☰](https://github.com/activeadmin/activeadmin/compare/v1.3.0...v1.3.1)

### Bug Fixes

* gemspec should have more permissive ransack dependency. [#5448] by [@varyonic]

### Removals

* Rails 4.2 support has been dropped. [#5104][] by [@javierjulio][] and [@deivid-rodriguez][]

## 1.3.0 [☰](https://github.com/activeadmin/activeadmin/compare/v1.2.1...v1.3.0)

### Enhancements

#### Major

* Rails 5.2 support [#5343] by [@varyonic], [#5399], [#5401] by [@zorab47]

## 1.2.1 [☰](https://github.com/activeadmin/activeadmin/compare/v1.2.0...v1.2.1)

### Bug Fixes

* Resolve issue with [#5275] preventing XSS in filters sidebar. [#5299] by [@faucct]

## 1.2.0 [☰](https://github.com/activeadmin/activeadmin/compare/v1.1.0...v1.2.0)

### Enhancements

#### Minor

* Do not display pagination info when there are no comments. [#5119] by [@alex-bogomolov]
* Revert generated config files to pluralized. [#5120] by [@varyonic], [#5137] by [@deivid-rodriguez]
* Warn when action definition overwrites controller method. [#5167] by [@aarek]
* Better performance of comments show view. [#5208] by [@dhyegofernando]
* Mitigate memory bloat [#4118] with CSV exports. [#5251] by [@f1sherman]
* Fix issue applying custom decorations. [#5253] by [@faucct]
* Brazilian locale updated. [#5125] by [@renotocn]
* Japanese locale updated. [#5143] by [@5t111111], [#5157] by [@innparusu95]
* Italian locale updated. [#5180] by [@blocknotes]
* Swedish locale updated. [#5187] by [@jawa]
* Vietnamese locale updated. [#5194] by [@Nguyenanh]
* Esperanto locale added. [#5210] by [@RobinvanderVliet]

### Bug Fixes

* Fix a couple of issues rendering filter labels. [#5223] by [@wspurgin]
* Prevent NameError when filtering on a namespaced association. [#5240] by [@DanielHeath]
* Fix undefined method error in Ransack when building filters. [#5238] by [@wspurgin]
* Fixed [#5198] Prevent XSS on sidebar's current filter rendering. [#5275] by [@deivid-rodriguez]
* Sanitize display_name. [#5284] by [@markstory]

## 1.1.0 [☰](https://github.com/activeadmin/activeadmin/compare/v1.0.0...v1.1.0)

### Bug Fixes

* Fixed [#5093] Handle table prefix & table suffix for `ActiveAdminComment` model
* Fixed [#4173] by including the default Kaminari templates. [#5069] by [@javierjulio]
* Fixed [#5043]. Do not crash in sidebar rendering when a default scope is not specified. [#5044] by [@Fivell]
* Fixed [#3894]. Make tab's component work with non-ascii titles. [#5046] by [@Fivell]

### Removals

* Ruby 2.1 support has been dropped. [#5003] by [@deivid-rodriguez]
* Replaced `sass-rails` with `sass` dependency. [#5037] by [@javierjulio]
* AA won't work properly with jQuery 1 & 2. Use jQuery 3 instead (`#= require jquery3`
 in `active_admin.js.coffee`)

### Deprecations

* Deprecated `type` param from `status_tag` and related CSS classes [#4989] by [@javierjulio]
  * The method signature has changed from:

    ```ruby
    status_tag(status, :ok, class: 'completed', label: 'on')
    ```

    to:

    ```ruby
    status_tag(status, class: 'completed ok', label: 'on')
    ```

  * The following CSS classes have been deprecated and will be removed in the future:

    ```css
    .status_tag {
      &.ok, &.published, &.complete, &.completed, &.green { background: #8daa92; }
      &.warn, &.warning, &.orange { background: #e29b20; }
      &.error, &.errored, &.red { background: #d45f53; }
    }
    ```

### Enhancements

#### Minor

* Support proc as an input_html option value when declaring filters. [#5029] by [@Fivell]
* Base localization support, better associations handling for active filters sidebar. [#4951] by [@Fivell]
* Allow AA scopes to return paginated collections. [#4996] by [@Fivell]
* Added `scopes_show_count` configuration to  setup show_count attribute for scopes globally. [#4950] by [@Fivell]
* Allow custom panel title given with `attributes_table`. [#4940] by [@ajw725]
* Allow passing a class to `action_item` block. [#4997] by [@Fivell]
* Add pagination to the comments section. [#5088] by [@alex-bogomolov]

## 1.0.0 [☰](https://github.com/activeadmin/activeadmin/compare/v0.6.3...v1.0.0)

### Breaking Changes

* Rename `allow_comments` to `comments` for more consistent naming. [#3695] by [@pranas]
* JavaScript `window.AA` has been removed, use `window.ActiveAdmin`. [#3606] by [@timoschilling]
* `f.form_buffers` has been removed. [#3486] by [@varyonic]
* Iconic has been removed. [#3553] by [@timoschilling]
* `config.show_comments_in_menu` has been removed, see `config.comments_menu`. [#4187] by [@drn]
* Rails 3.2 & Ruby 1.9.3 support has been dropped. [#4848] by [@deivid-rodriguez]
* Ruby 2.0.0 support has been dropped. [#4851] by [@deivid-rodriguez]
* Rails 4.0 & 4.1 support has been dropped. [#4870] by [@deivid-rodriguez]

### Enhancements

#### Major

* Migration from Metasearch to Ransack. [#1979] by [@seanlinsley]
* Rails 4 support. [#2326] by many people :heart:
* Rails 4.2 support. [#3731] by [@gonzedge] and [@timoschilling]
* Rails 5 support. [#4254] by [@seanlinsley]
* Rails 5.1 support. [#4882] by [@varyonic]

#### Minor

* "Create another" checkbox for the new resource page. [#4477] by [@bolshakov]
* Page supports belongs_to. [#4759] by [@Fivell] and [@zorab47]
* Support for custom sorting strategies. [#4768] by [@Fivell]
* Stream CSV downloads as they're generated. [#3038] by [@craigmcnamara]
  * Disable streaming in development for easier debugging. [#3535] by [@seanlinsley]
* Improved code reloading. [#3783] by [@chancancode]
* Do not auto link to inaccessible actions. [#3686] by [@pranas]
* Allow to enable comments on per-resource basis. [#3695] by [@pranas]
* Unify DSL for index `actions` and `actions dropdown: true`. [#3463] by [@timoschilling]
* Add DSL method `includes` for `ActiveRecord::Relation#includes`. [#3464] by [@timoschilling]
* BOM (byte order mark) configurable for CSV download. [#3519] by [@timoschilling]
* Column block on table index is now sortable by default. [#3075] by [@dmitry]
* Allow Arbre to be used inside ActiveAdmin forms. [#3486] by [@varyonic]
* Make AA ORM-agnostic. [#2545] by [@johnnyshields]
* Add multi-record support to `attributes_table_for`. [#2544] by [@zorab47]
* Table CSS classes are now prefixed to prevent clashes. [#2532] by [@TimPetricola]
* Allow Inherited Resources shorthand for redirection. [#2001] by [@seanlinsley]

```ruby
    controller do
      # Redirects to index page instead of rendering updated resource
      def update
        update!{ collection_path }
      end
    end
```

* Accept block for download links. [#2040] by [@potatosalad]

```ruby
index download_links: ->{ can?(:view_all_download_links) || [:pdf] }
```

* Comments menu can be customized via configuration passed to `config.comments_menu`. [#4187] by [@drn]
* Added `config.route_options` to namespace to customize routes. [#4731] by [@stereoscott]

### Security Fixes

* Prevents access to formats that the user not permitted to see. [#4867] by [@Fivell] and [@timoschilling]
* Prevents potential DOS attack via Ruby symbols. [#1926] by [@seanlinsley]
  * [this isn't an issue for those using Ruby >= 2.2](http://rubykaigi.org/2014/presentation/S-NarihiroNakamura)

### Bug Fixes

* Fixes filters for `has_many :through` relationships. [#2541] by [@shekibobo]
* "New" action item now only shows up on the index page. bf659bc by [@seanlinsley]
* Fixes comment creation bug with aliased resources. 9a082486 by [@seanlinsley]
* Fixes the deletion of `:if` and `:unless` from filters. [#2523] by [@PChambino]

### Deprecations

* `ActiveAdmin::Event` (`ActiveAdmin::EventDispatcher`). [#3435] by [@timoschilling]
  `ActiveAdmin::Event` will be removed in a future version, ActiveAdmin switched
  to use `ActiveSupport::Notifications`.
  NOTE: The blog parameters has changed:

```ruby
ActiveSupport::Notifications.subscribe ActiveAdmin::Application::BeforeLoadEvent do |event, *args|
  # some code
end

ActiveSupport::Notifications.publish ActiveAdmin::Application::BeforeLoadEvent, "some data"
```

## Previous Changes

Please check [0-6-stable] for previous changes.

[0-6-stable]: https://github.com/activeadmin/activeadmin/blob/0-6-stable/CHANGELOG.md

[#1926]: https://github.com/activeadmin/activeadmin/issues/1926
[#1979]: https://github.com/activeadmin/activeadmin/issues/1979
[#2001]: https://github.com/activeadmin/activeadmin/issues/2001
[#2040]: https://github.com/activeadmin/activeadmin/issues/2040
[#2326]: https://github.com/activeadmin/activeadmin/issues/2326
[#2523]: https://github.com/activeadmin/activeadmin/issues/2523
[#2532]: https://github.com/activeadmin/activeadmin/issues/2532
[#2541]: https://github.com/activeadmin/activeadmin/issues/2541
[#2544]: https://github.com/activeadmin/activeadmin/issues/2544
[#2545]: https://github.com/activeadmin/activeadmin/issues/2545
[#3038]: https://github.com/activeadmin/activeadmin/issues/3038
[#3075]: https://github.com/activeadmin/activeadmin/issues/3075
[#3463]: https://github.com/activeadmin/activeadmin/issues/3463
[#3464]: https://github.com/activeadmin/activeadmin/issues/3464
[#3486]: https://github.com/activeadmin/activeadmin/issues/3486
[#3519]: https://github.com/activeadmin/activeadmin/issues/3519
[#3535]: https://github.com/activeadmin/activeadmin/issues/3535
[#3553]: https://github.com/activeadmin/activeadmin/issues/3553
[#3606]: https://github.com/activeadmin/activeadmin/issues/3606
[#3686]: https://github.com/activeadmin/activeadmin/issues/3686
[#3695]: https://github.com/activeadmin/activeadmin/issues/3695
[#3731]: https://github.com/activeadmin/activeadmin/issues/3731
[#3783]: https://github.com/activeadmin/activeadmin/issues/3783
[#3894]: https://github.com/activeadmin/activeadmin/issues/3894
[#4118]: https://github.com/activeadmin/activeadmin/issues/4118
[#4187]: https://github.com/activeadmin/activeadmin/issues/4187
[#4173]: https://github.com/activeadmin/activeadmin/issues/4173
[#4254]: https://github.com/activeadmin/activeadmin/issues/4254
[#5043]: https://github.com/activeadmin/activeadmin/issues/5043
[#5198]: https://github.com/activeadmin/activeadmin/issues/5198

[#3435]: https://github.com/activeadmin/activeadmin/pull/3435
[#4477]: https://github.com/activeadmin/activeadmin/pull/4477
[#4731]: https://github.com/activeadmin/activeadmin/pull/4731
[#4759]: https://github.com/activeadmin/activeadmin/pull/4759
[#4768]: https://github.com/activeadmin/activeadmin/pull/4768
[#4848]: https://github.com/activeadmin/activeadmin/pull/4848
[#4851]: https://github.com/activeadmin/activeadmin/pull/4851
[#4867]: https://github.com/activeadmin/activeadmin/pull/4867
[#4870]: https://github.com/activeadmin/activeadmin/pull/4870
[#4882]: https://github.com/activeadmin/activeadmin/pull/4882
[#4940]: https://github.com/activeadmin/activeadmin/pull/4940
[#4950]: https://github.com/activeadmin/activeadmin/pull/4950
[#4951]: https://github.com/activeadmin/activeadmin/pull/4951
[#4989]: https://github.com/activeadmin/activeadmin/pull/4989
[#4996]: https://github.com/activeadmin/activeadmin/pull/4996
[#4997]: https://github.com/activeadmin/activeadmin/pull/4997
[#5029]: https://github.com/activeadmin/activeadmin/pull/5029
[#5003]: https://github.com/activeadmin/activeadmin/pull/5003
[#5037]: https://github.com/activeadmin/activeadmin/pull/5037
[#5044]: https://github.com/activeadmin/activeadmin/pull/5044
[#5046]: https://github.com/activeadmin/activeadmin/pull/5046
[#5060]: https://github.com/activeadmin/activeadmin/pull/5060
[#5069]: https://github.com/activeadmin/activeadmin/pull/5069
[#5081]: https://github.com/activeadmin/activeadmin/pull/5081
[#5088]: https://github.com/activeadmin/activeadmin/pull/5088
[#5093]: https://github.com/activeadmin/activeadmin/pull/5093
[#5104]: https://github.com/activeadmin/activeadmin/pull/5104
[#5107]: https://github.com/activeadmin/activeadmin/pull/5107
[#5119]: https://github.com/activeadmin/activeadmin/pull/5119
[#5120]: https://github.com/activeadmin/activeadmin/pull/5120
[#5121]: https://github.com/activeadmin/activeadmin/pull/5121
[#5125]: https://github.com/activeadmin/activeadmin/pull/5125
[#5137]: https://github.com/activeadmin/activeadmin/pull/5137
[#5143]: https://github.com/activeadmin/activeadmin/pull/5143
[#5157]: https://github.com/activeadmin/activeadmin/pull/5157
[#5167]: https://github.com/activeadmin/activeadmin/pull/5167
[#5180]: https://github.com/activeadmin/activeadmin/pull/5180
[#5187]: https://github.com/activeadmin/activeadmin/pull/5187
[#5194]: https://github.com/activeadmin/activeadmin/pull/5194
[#5208]: https://github.com/activeadmin/activeadmin/pull/5208
[#5210]: https://github.com/activeadmin/activeadmin/pull/5210
[#5251]: https://github.com/activeadmin/activeadmin/pull/5251
[#5223]: https://github.com/activeadmin/activeadmin/pull/5223
[#5238]: https://github.com/activeadmin/activeadmin/pull/5238
[#5240]: https://github.com/activeadmin/activeadmin/pull/5240
[#5253]: https://github.com/activeadmin/activeadmin/pull/5253
[#5272]: https://github.com/activeadmin/activeadmin/pull/5272
[#5275]: https://github.com/activeadmin/activeadmin/pull/5275
[#5284]: https://github.com/activeadmin/activeadmin/pull/5284
[#5295]: https://github.com/activeadmin/activeadmin/pull/5295
[#5299]: https://github.com/activeadmin/activeadmin/pull/5299
[#5320]: https://github.com/activeadmin/activeadmin/pull/5320
[#5324]: https://github.com/activeadmin/activeadmin/pull/5324
[#5330]: https://github.com/activeadmin/activeadmin/pull/5330
[#5336]: https://github.com/activeadmin/activeadmin/pull/5336
[#5341]: https://github.com/activeadmin/activeadmin/pull/5341
[#5343]: https://github.com/activeadmin/activeadmin/pull/5343
[#5357]: https://github.com/activeadmin/activeadmin/pull/5357
[#5359]: https://github.com/activeadmin/activeadmin/pull/5359
[#5368]: https://github.com/activeadmin/activeadmin/pull/5368
[#5399]: https://github.com/activeadmin/activeadmin/pull/5399
[#5401]: https://github.com/activeadmin/activeadmin/pull/5401
[#5408]: https://github.com/activeadmin/activeadmin/pull/5408
[#5413]: https://github.com/activeadmin/activeadmin/pull/5413
[#5433]: https://github.com/activeadmin/activeadmin/pull/5433
[#5446]: https://github.com/activeadmin/activeadmin/pull/5446
[#5453]: https://github.com/activeadmin/activeadmin/pull/5453
[#5458]: https://github.com/activeadmin/activeadmin/pull/5458
[#5461]: https://github.com/activeadmin/activeadmin/pull/5461
[#5464]: https://github.com/activeadmin/activeadmin/pull/5464
[#5486]: https://github.com/activeadmin/activeadmin/pull/5486
[#5501]: https://github.com/activeadmin/activeadmin/pull/5501
[#5516]: https://github.com/activeadmin/activeadmin/pull/5516
[#5583]: https://github.com/activeadmin/activeadmin/pull/5583
[#5842]: https://github.com/activeadmin/activeadmin/pull/5842
[#5650]: https://github.com/activeadmin/activeadmin/pull/5650
[#5702]: https://github.com/activeadmin/activeadmin/pull/5702
[#5800]: https://github.com/activeadmin/activeadmin/pull/5800
[#6000]: https://github.com/activeadmin/activeadmin/pull/6000
[#6237]: https://github.com/activeadmin/activeadmin/pull/6237
[#7235]: https://github.com/activeadmin/activeadmin/pull/7235
[#7332]: https://github.com/activeadmin/activeadmin/pull/7332

[#14]: https://github.com/varyonic/activeadmin-rails/pull/14
[#15]: https://github.com/varyonic/activeadmin-rails/pull/15
[#16]: https://github.com/varyonic/activeadmin-rails/pull/16
[#17]: https://github.com/varyonic/activeadmin-rails/pull/17
[#18]: https://github.com/varyonic/activeadmin-rails/pull/18
[#19]: https://github.com/varyonic/activeadmin-rails/pull/19
[#20]: https://github.com/varyonic/activeadmin-rails/pull/20
[#21]: https://github.com/varyonic/activeadmin-rails/pull/21
[#22]: https://github.com/varyonic/activeadmin-rails/pull/22
[#23]: https://github.com/varyonic/activeadmin-rails/pull/23
[#25]: https://github.com/varyonic/activeadmin-rails/pull/25
[#26]: https://github.com/varyonic/activeadmin-rails/pull/26
[#27]: https://github.com/varyonic/activeadmin-rails/pull/27
[#28]: https://github.com/varyonic/activeadmin-rails/pull/28
[#29]: https://github.com/varyonic/activeadmin-rails/pull/29
[#31]: https://github.com/varyonic/activeadmin-rails/pull/31
[#33]: https://github.com/varyonic/activeadmin-rails/pull/33
[#35]: https://github.com/varyonic/activeadmin-rails/pull/35
[#36]: https://github.com/varyonic/activeadmin-rails/pull/36
[#37]: https://github.com/varyonic/activeadmin-rails/pull/37
[#38]: https://github.com/varyonic/activeadmin-rails/pull/38
[#39]: https://github.com/varyonic/activeadmin-rails/pull/39
[#40]: https://github.com/varyonic/activeadmin-rails/pull/40
[#41]: https://github.com/varyonic/activeadmin-rails/pull/41
[#42]: https://github.com/varyonic/activeadmin-rails/pull/42
[#43]: https://github.com/varyonic/activeadmin-rails/pull/43
[#45]: https://github.com/varyonic/activeadmin-rails/pull/45
[#49]: https://github.com/varyonic/activeadmin-rails/pull/49
[#50]: https://github.com/varyonic/activeadmin-rails/pull/50
[#52]: https://github.com/varyonic/activeadmin-rails/pull/52
[#53]: https://github.com/varyonic/activeadmin-rails/pull/53
[#54]: https://github.com/varyonic/activeadmin-rails/pull/54

[@5t111111]: https://github.com/5t111111
[@aarek]: https://github.com/aarek
[@ajw725]: https://github.com/ajw725
[@alex-bogomolov]: https://github.com/alex-bogomolov
[@andreslemik]: https://github.com/andreslemik
[@blocknotes]: https://github.com/blocknotes
[@bolshakov]: https://github.com/bolshakov
[@buren]: https://github.com/buren
[@chancancode]: https://github.com/chancancode
[@chrp]: https://github.com/chrp
[@chumakoff]: https://github.com/chumakoff
[@craigmcnamara]: https://github.com/craigmcnamara
[@DanielHeath]: https://github.com/DanielHeath
[@deivid-rodriguez]: https://github.com/deivid-rodriguez
[@dennisvdvliet]: https://github.com/dennisvdvliet
[@dhyegofernando]: https://github.com/dhyegofernando
[@dkniffin]: https://github.com/dkniffin
[@dmitry]: https://github.com/dmitry
[@drn]: https://github.com/drn
[@eikes]: https://github.com/eikes
[@f1sherman]: https://github.com/f1sherman
[@faucct]: https://github.com/faucct
[@Fivell]: https://github.com/Fivell
[@glebtv]: https://github.com/glebtv
[@gonzedge]: https://github.com/gonzedge
[@HappyKadaver]: https://github.com/HappyKadaver
[@innparusu95]: https://github.com/innparusu95
[@ionut998]: https://github.com/ionut998
[@jasl]: https://github.com/jasl
[@javierjulio]: https://github.com/javierjulio
[@jawa]: https://github.com/jawa
[@JiiHu]: https://github.com/JiiHu
[@johnnyshields]: https://github.com/johnnyshields
[@kjeldahl]: https://github.com/kjeldahl
[@kobeumut]: https://github.com/kobeumut
[@leio10]: https://github.com/leio10
[@markstory]: https://github.com/markstory
[@mauriciopasquier]: https://github.com/mauriciopasquier
[@mconiglio]: https://github.com/mconiglio
[@Nguyenanh]: https://github.com/Nguyenanh
[@panasyuk]: https://github.com/panasyuk
[@PChambino]: https://github.com/PChambino
[@potatosalad]: https://github.com/potatosalad
[@pranas]: https://github.com/pranas
[@renotocn]: https://github.com/renotocn
[@RobinvanderVliet]: https://github.com/RobinvanderVliet
[@rogerkk]: https://github.com/rogerkk
[@seanlinsley]: https://github.com/seanlinsley
[@sgara]: https://github.com/sgara
[@ShallmentMo]: https://github.com/ShallmentMo
[@shekibobo]: https://github.com/shekibobo
[@shouya]: https://github.com/shouya
[@stefsava]: https://github.com/stefsava
[@tagliala]: https://github.com/tagliala
[@stereoscott]: https://github.com/stereoscott
[@tiagotex]: https://github.com/tiagotex
[@timoschilling]: https://github.com/timoschilling
[@TimPetricola]: https://github.com/TimPetricola
[@varyonic]: https://github.com/varyonic
[@vcsjones]: https://github.com/vcsjones
[@wasifhossain]: https://github.com/wasifhossain
[@Wowu]: https://github.com/Wowu
[@wspurgin]: https://github.com/wspurgin
[@zorab47]: https://github.com/zorab47