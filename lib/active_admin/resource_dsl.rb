module ActiveAdmin
  # This is the class where all the register blocks are evaluated.
  class ResourceDSL < DSL

    private

    # Redefine sort behaviour for column
    #
    # For example:
    #
    #   # nulls last
    #   order_by(:age) do |order_clause|
    #     [order_clause.to_sql, 'NULLS LAST'].join(' ')  if order_clause.order == 'desc'
    #   end
    #
    #   # by last_name but in the case that there is no last name, by first_name.
    #   order_by(:full_name) do |order_clause|
    #     ['COALESCE(NULLIF(last_name, ''), first_name), first_name', order_clause.order].join(' ')
    #   end
    #
    #
    def order_by(column, &block)
      config.ordering[column] = block
    end

    def belongs_to(target, options = {})
      config.belongs_to(target, options)
    end

    # Scope collection to a relation
    def scope_to(*args, &block)
      config.scope_to(*args, &block)
    end

    # Create a scope
    def scope(*args, &block)
      config.scope(*args, &block)
    end

    # Store relations that should be included
    def includes(*args)
      config.includes.push *args
    end

    #
    # Keys included in the `permitted_params` setting are automatically whitelisted.
    #
    # Either
    #
    #   permit_params :title, :author, :body, tags: []
    #
    # Or
    #
    #   permit_params do
    #     defaults = [:title, :body]
    #     if current_user.admin?
    #       defaults + [:author]
    #     else
    #       defaults
    #     end
    #   end
    #
    def permit_params(*args, &block)
      config.permitted_attr_names = block_given? ? block : args
    end

    # Configure the index page for the resource
    def index(options = {}, &block)
      if block_given?
        options[:as] ||= :table
        config.set_page_presenter :index, ActiveAdmin::PagePresenter.new(options, &block)
      else
        config.set_page_options :index, options
      end
    end

    # Configure the show page for the resource
    def show(options = {}, &block)
      if block_given?
        config.set_page_presenter :show, ActiveAdmin::PagePresenter.new(options, &block)
      else
        config.set_page_options :show, options
      end
    end

    def form(options = {}, &block)
      if block_given?
        config.set_page_presenter :form, ActiveAdmin::PagePresenter.new(options, &block)
      else
        config.set_page_options :form, options
      end
    end

    # Configure the CSV format
    #
    # For example:
    #
    #   csv do
    #     column :name
    #     column("Author") { |post| post.author.full_name }
    #   end
    #
    #   csv col_sep: ";", force_quotes: true do
    #     column :name
    #   end
    #
    def csv(options = {}, &block)
      options[:resource] = config

      config.csv_builder = CSVBuilder.new(options, &block)
    end

    # Member Actions give you the functionality of defining both the
    # action and the route directly from your ActiveAdmin registration
    # block.
    #
    # For example:
    #
    #   ActiveAdmin.register Post do
    #     member_action :comments do
    #       @post = Post.find(params[:id]
    #       @comments = @post.comments
    #     end
    #   end
    #
    # Will create a new controller action comments and will hook it up to
    # the named route (comments_admin_post_path) /admin/posts/:id/comments
    #
    # You can treat everything within the block as a standard Rails controller
    # action.
    #
    def member_action(name, options = {}, &block)
      if (title = options.delete(:title))
        set_title_before_action(name, title)
      end

      define_controller_method(name, &block)

      config.add_member_route(name, options)
    end

    def collection_action(name, options = {}, &block)
      if (title = options.delete(:title))
        set_title_before_action(name, title)
      end

      define_controller_method(name, &block)

      config.add_collection_route(name, options)
    end

    def decorate_with(decorator_class)
      # Force storage as a string. This will help us with reloading issues.
      # Assuming decorator_class.to_s will return the name of the class allows
      # us to handle a string or a class.
      config.decorator_class_name = "::#{ decorator_class }"
    end

    # Defined Callbacks
    #
    # == After Build
    # Called after the resource is built in the new and create actions.
    #
    # ActiveAdmin.register Post do
    #   after_build do |post|
    #     post.author = current_user
    #   end
    # end
    #
    # == Before / After Create
    # Called before and after a resource is saved to the db on the create action.
    #
    # == Before / After Update
    # Called before and after a resource is saved to the db on the update action.
    #
    # == Before / After Save
    # Called before and after the object is saved in the create and update action.
    # Note: Gets called after the create and update callbacks
    #
    # == Before / After Destroy
    # Called before and after the object is destroyed from the database.
    #
    delegate :before_build,   :after_build,   to: :controller
    delegate :before_create,  :after_create,  to: :controller
    delegate :before_update,  :after_update,  to: :controller
    delegate :before_save,    :after_save,    to: :controller
    delegate :before_destroy, :after_destroy, to: :controller

    # This code defines both *_filter and *_action for Rails 5.0 and  *_action for Rails >= 5.1
    phases = [
      :before, :skip_before,
      :after,  :skip_after,
      :around, :skip
    ]
    keywords = if Rails::VERSION::MAJOR == 5 && Rails::VERSION::MINOR >= 1
                 [:action]
               else
                 [:action, :filter]
               end

    keywords.each do |name|
      phases.each do |action|
       define_method "#{action}_#{name}" do |*args, &block|
         controller.public_send "#{action}_action", *args, &block
       end
     end
    end

    # Specify which actions to create in the controller
    #
    # Eg:
    #
    #   ActiveAdmin.register Post do
    #     actions :index, :show
    #   end
    #
    # Will only create the index and show actions (no create, update or delete)
    delegate :actions, to: :controller

  end
end
