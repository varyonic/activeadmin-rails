module ActiveAdmin
  module Deprecation
    module_function

    def deprecator # :nodoc:
      @deprecator ||= ActiveSupport::Deprecation.new
    end

    def warn(message, callstack = caller)
      deprecator.warn "Active Admin: #{message}", callstack
    end

  end
end
