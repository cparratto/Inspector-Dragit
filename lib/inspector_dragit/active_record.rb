module InspectorDragit
  module ActiveRecord
    class AttributeBuilder < Array
      def add(label, attr)
        self << {:label => label,:attr => attr}
      end
    end

    module Include
      def inspector_dragit_template
        self.class.respond_to?(:class_insp_dragit_template) ? self.class.class_insp_dragit_template : {:title => "", :attributes => []}
      end

      def inspector_dragit_data
        id_data = {}
        id_data[:title] = inspector_dragit_template[:title]
        id_data[:attributes] = []
        inspector_dragit_template[:attributes].each do |a_hash|
          id_data[:attributes] << {:label => a_hash[:label], :value => self.send(a_hash[:attr]) }
        end
        id_data
      end
    end

    module Extend
      attr_accessor :class_insp_dragit_template, :class_insp_dragit_title, :class_insp_dragit_attrs

      @class_insp_dragit_title = ""
      @class_insp_dragit_attrs = AttributeBuilder.new
      @class_insp_dragit_template = {:title => @class_insp_dragit_title, :attributes => @class_insp_dragit_attrs}

      def go_go_dragit(&block)
        @class_insp_dragit_title = ""
        @class_insp_dragit_attrs = AttributeBuilder.new
        block.call(@class_insp_dragit_title, @class_insp_dragit_attrs)
        @class_insp_dragit_template = {:title => @class_insp_dragit_title,
                                       :attributes => @class_insp_dragit_attrs}
      end
    end
  end
end