module ActiveAdmin

  # All Pages controllers inherit from this controller.
  class PageController < BaseController

    layout 'active_admin'

    actions :index

    before_action :authorize_access!

    def index(options = {}, &block)
      render "active_admin/page/index"
    end

    def clear_page_actions!
      active_admin_config.clear_page_actions!
    end

    private

    def authorize_access!
      permission = action_to_permission(params[:action])
      authorize! permission, active_admin_config
    end

  end
end
