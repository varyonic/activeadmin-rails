require 'active_admin/base_controller/authorization'
require 'active_admin/base_controller/menu'

module ActiveAdmin
  # BaseController for ActiveAdmin.
  # It implements ActiveAdmin controllers core features.
  class BaseController < ::InheritedResources::Base
    helper ::ActiveAdmin::ViewHelpers
    helper_method :env

    layout 'active_admin'

    before_action :only_render_implemented_actions
    before_action :authenticate_active_admin_user

    class << self
      # Ensure that this method is available for the DSL
      public :actions

      # Reference to the Resource object which initialized
      # this controller
      attr_accessor :active_admin_config
    end

    # By default Rails will render un-implemented actions when the view exists. Because Active
    # Admin allows you to not render any of the actions by using the #actions method, we need
    # to check if they are implemented.
    def only_render_implemented_actions
      raise AbstractController::ActionNotFound unless action_methods.include?(params[:action])
    end

    include Authorization
    include Menu

    private

    # Calls the authentication method as defined in ActiveAdmin.authentication_method
    def authenticate_active_admin_user
      send(active_admin_namespace.authentication_method) if active_admin_namespace.authentication_method
    end

    def current_active_admin_user
      send(active_admin_namespace.current_user_method) if active_admin_namespace.current_user_method
    end
    helper_method :current_active_admin_user

    def current_active_admin_user?
      !!current_active_admin_user
    end
    helper_method :current_active_admin_user?

    def active_admin_config
      self.class.active_admin_config
    end
    helper_method :active_admin_config

    def active_admin_namespace
      active_admin_config.namespace
    end
    helper_method :active_admin_namespace

    ACTIVE_ADMIN_ACTIONS = [:index, :show, :new, :create, :edit, :update, :destroy]

    def active_admin_root
      controller, action = active_admin_namespace.root_to.split '#'
      {controller: controller, action: action}
    end

    def page_presenter
      active_admin_config.get_page_presenter(params[:action].to_sym) || default_page_presenter
    end
    helper_method :page_presenter

    def default_page_presenter
      PagePresenter.new
    end

    def page_title
      if page_presenter[:title]
        helpers.render_or_call_method_or_proc_on(self, page_presenter[:title])
      else
        default_page_title
      end
    end
    helper_method :page_title

    def default_page_title
      active_admin_config.name
    end
  end
end
