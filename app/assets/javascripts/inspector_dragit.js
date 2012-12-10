function replace_element_w_i_d_draggable_info(ele, draggable) {
    var insp_d_data = $.parseJSON(draggable.attr("data-inspector-dragit"));
    var content = "<table>";
    for (var i = 0; i < insp_d_data.attributes.length; i++) {
        var label = insp_d_data.attributes[i].label
        var value = insp_d_data.attributes[i].value
        content += '<tr><td>' + label + ': </td><td>' + value  + '</td></tr>';
    }
    content += "</table>"
    $(ele).html(content);
}

(function( $ ){
    var methods = {
        init: function(options) {
            $(".inspector_dragit_inspector", $(this)).each(function(){
                $(this).droppable({
                    accept: ".inspector_dragit_draggable",
                    activeClass: "drop-focus",
                    drop: function( event, ui ) {
                        //TODO: the function below might be better off living inside
                        replace_element_w_i_d_draggable_info(this, ui.draggable);
                    }
                });
            });

            $(".inspector_dragit_draggable", $(this)).each(function(){
                $( $(this) ).draggable({
                    revert: "invalid",
                    containment: "document",
                    helper: "clone",
                    cursor: "move"
                })
            });
        }
    };

    jQuery.fn.inspector_dragit = function(method) {
        if ( methods[method] ) {
            if(method !== 'init') {methods.init.apply( this, arguments );}
            methods[ method ].apply( this, Array.prototype.slice.call( arguments, 1 ));
            return methods;
        } else if ( typeof method === 'object' || ! method ) {
            methods.init.apply( this, arguments );
            return methods;
        } else {
            $.error( 'Method ' +  method + ' does not exist on jQuery.marking' );
        }
    };
})( jQuery );
