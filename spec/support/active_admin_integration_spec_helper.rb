module ActiveAdminIntegrationSpecHelper
  extend self

  def load_defaults!
    ActiveAdmin.unload!
    ActiveAdmin.load!
    ActiveAdmin.register(Category)
    ActiveAdmin.register(User)
    ActiveAdmin.register(Post){ belongs_to :user, optional: true }
  end

  # Sometimes we need to reload the routes within
  # the application to test them out
  def reload_routes!
    Rails.application.reload_routes!
  end

  # Helper method to load resources and ensure that Active Admin is
  # setup with the new configurations.
  #
  # Eg:
  #   load_resources do
  #     ActiveAdmin.register(Post)
  #   end
  #
  def load_resources
    ActiveAdmin.unload!
    yield
    reload_routes!
  end

  def arbo(assigns = {}, helpers = mock_action_view, &block)
    Arbo::Context.new(assigns, helpers, &block)
  end

  def render_component(assigns = {}, helpers = mock_action_view, &block)
    arbo(assigns, helpers, &block).children.first
  end

  # A mock action view to test view helpers
  class MockActionView < ::ActionView::Base
    include ActiveAdmin::ViewHelpers
    include Rails.application.routes.url_helpers

    def compiled_method_container
      self.class
    end
  end

  # Returns a fake action view instance to use with our renderers
  def mock_action_view(base = MockActionView)
    controller = ActionView::TestCase::TestController.new
    #this line needed because of rails bug https://github.com/rails/rails/commit/d8e98897b5703ac49bf0764da71a06d64ecda9b0
    controller.params = ActionController::Parameters.new

    base.new(view_paths, {}, controller)
  end

  def view_paths
    paths = ActionController::Base.view_paths
    # the constructor for ActionView::Base changed from Rails 6
    # and now expects an instance of ActionView::LookupContext
    return paths unless Rails::VERSION::MAJOR >= 6
    ActionView::LookupContext.new(paths)
  end

  def with_translation(translation)
    # If no translations have been loaded, any later calls to `I18n.t` will
    # cause the full translation hash to be loaded, possibly overwritting what
    # we've loaded via `store_translations`. We use this hack to prevent that.
    # TODO: Might not be necessary anymore once
    # https://github.com/svenfuchs/i18n/pull/353 lands.
    I18n.backend.send(:init_translations)
    I18n.backend.store_translations I18n.locale, translation
    yield
  ensure
    I18n.backend.reload!
  end
end
