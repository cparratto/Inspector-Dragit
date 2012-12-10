module InspectorDragit
  module ViewHelpers
    def isp_dragit_draggable_class
      "inspector_dragit_draggable"
    end

    def isp_dragit_inspector_class
      "inspector_dragit_inspector"
    end

    def go_go_dragit_draggable_content(name, record, content_or_options_with_block = nil, opts = nil, escape = true, &block)
      opts = {} if opts.nil?
      opts[:data] = {} if opts[:data].nil?
      opts[:data][:inspector_dragit] = record.inspector_dragit_data.to_json

      if opts[:class].blank?
        opts[:class] = isp_dragit_draggable_class
      else
        opts[:class] << " " << isp_dragit_draggable_class
      end

      content_tag(name, content_or_options_with_block, opts, escape, &block)
    end

    def go_go_dragit_inspector_content(name=:div, content_or_options_with_block = nil, opts = nil, escape = true, &block)
      opts = {} if opts.nil?
      if opts[:class].blank?
        opts[:class] = isp_dragit_inspector_class
      else
        opts[:class] << " " << isp_dragit_inspector_class
      end

      return content_tag(name, content_or_options_with_block, opts, escape, &block)
    end
  end
end