module ActiveAdmin

  # Each Namespace builds up it's own menu as the global navigation
  #
  # To build a new menu:
  #
  #   menu = Menu.new do |m|
  #     m.add label: 'Dashboard', url: '/'
  #     m.add label: 'Users',     url: '/users'
  #   end
  #
  # If you're interested in configuring a menu item, take a look at the
  # options available in `ActiveAdmin::MenuItem`
  #
  class Menu

    def initialize(parent = nil)
      @parent_item = parent
      @children = {}
      yield(self) if block_given?
    end

    attr_reader :parent_item

    def [](id)
      @children[self.class.normalize_id(id)]
    end

    def []=(id, child)
      @children[self.class.normalize_id(id)] = child
    end

    # Recursively builds any given menu items. There are two syntaxes supported,
    # as shown in the below examples. Both create an identical menu structure.
    #
    # Example 1:
    #   menu = Menu.new
    #   menu.add label: 'Dashboard' do |dash|
    #     dash.add label: 'My Child Dashboard'
    #   end
    #
    # Example 2:
    #   menu = Menu.new
    #   menu.add label:  'Dashboard'
    #   menu.add parent: 'Dashboard', label: 'My Child Dashboard'
    #
    def add(options, &block)
      parent_id = options.delete(:parent)

      if parent_id
        parent_item = find_or_add_parent_item(parent_id)
        item = parent_item.add(options)
      else
        item = new_item(options)
      end

      yield(item) if block_given?

      item
    end

    # Whether any children match the given item.
    def include?(item)
      @children.values.include? item
    end

    # Used in the UI to visually distinguish which menu item is selected.
    def current?(item)
      self == item || include?(item)
    end

    def items
      @children.values
    end

    attr_reader :children
    protected
    attr_writer :children

    # The method that actually adds new menu items. Called by the public method.
    # If this ID is already taken, transfer the children of the existing item to the new item.
    def new_item(options)
      ActiveAdmin::MenuItem.new(options.merge parent: parent_item).tap do |item|
        item.submenu.children = children[item.id].children if children[item.id]
        children[item.id] = item
      end
    end

    def self.normalize_id(id)
      case id
      when String, Symbol, ActiveModel::Name
        id.to_s.downcase.tr ' ', '_'
      when ActiveAdmin::Resource::Name
        id.param_key
      else
        raise TypeError, "#{id.class} isn't supported as a Menu ID"
      end
    end

    # fetch parent or add if not present
    def find_or_add_parent_item(parent_id)
      self[parent_id] || add(label: parent_id)
    end

  end
end
