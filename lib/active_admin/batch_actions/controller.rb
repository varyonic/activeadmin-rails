module ActiveAdmin
  module BatchActions
    module Controller

      # Controller action that is called when submitting the batch action form
      def batch_action
        if action_present?
          selection  =            params[:collection_selection] || []
          inputs     = JSON.parse params[:batch_action_inputs]  || '{}'
          valid_keys = StringSymbolOrProcSetting.new(current_batch_action.inputs).value(self).try(:keys)
          inputs     = inputs.with_indifferent_access.slice *valid_keys
          method_name = "batch_action_#{params[:batch_action]}"
          if respond_to?(method_name, true)
            send method_name, selection, inputs
          else
            instance_exec selection, inputs, &current_batch_action.block
          end
        else
          raise "Couldn't find batch action \"#{params[:batch_action]}\""
        end
      end

      protected

      def action_present?
        params[:batch_action].present? && current_batch_action
      end

      def current_batch_action
        active_admin_config.batch_actions.detect{ |action| action.sym.to_s == params[:batch_action] }
      end

      COLLECTION_APPLIES = [
        :authorization_scope,
        :filtering,
        :scoping,
        :includes,
      ].freeze

      def batch_action_collection(only = COLLECTION_APPLIES)
        find_collection(only: only)
      end
    end
  end
end
