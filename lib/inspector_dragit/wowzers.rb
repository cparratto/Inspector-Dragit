module InspectorDragit
  module Wowzers
    class InvalidRecordArgument <  Exception
      def message
        "Wowzer: Please make sure you pass ActiveRecords that include the InspectorDragit::ActiveRecord module."
      end
    end

    class InvalidInspectorArgument <  Exception
      def message
        "Wowzer: The inspector view helper is being passed the correct options."
      end
    end
  end
end