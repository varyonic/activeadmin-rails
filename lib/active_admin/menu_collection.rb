module ActiveAdmin

  DEFAULT_MENU = :default

  # A MenuCollection stores multiple menus for any given namespace. Namespaces delegate
  # the addition of menu items to this class.
  class MenuCollection
    def initialize
      @menus = {}
    end

    # Add a new menu item to a menu in the collection
    def add(menu_name, menu_item_options = {})
      menu = find_or_create(menu_name)

      menu.add menu_item_options
    end

    def clear!
      @menus = {}
    end

    def exists?(menu_name)
      @menus.keys.include? menu_name
    end

    def fetch(menu_name)
      build_menus!

      @menus[menu_name] or
        raise NoMenuError, "No menu by the name of #{menu_name.inspect} in available menus: #{@menus.keys.join(", ")}"
    end

    def menu(menu_name)
      menu = find_or_create(menu_name)

      yield(menu) if block_given?

      menu
    end

    def built?
      @menus.present?
    end

    def build_menus!
      return if built?

      build_default_menu
    end

    def build_default_menu
      find_or_create DEFAULT_MENU
    end

    private

    def find_or_create(menu_name)
      menu_name ||= DEFAULT_MENU
      @menus[menu_name] ||= ActiveAdmin::Menu.new
    end

  end

end
