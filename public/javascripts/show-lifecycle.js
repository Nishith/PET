/**
 * Created by JetBrains RubyMine.
 * User: shtsao
 * Date: 11/14/11
 * Time: 9:27 PM
 * To change this template use File | Settings | File Templates.
 */

$("#lifecycle-select").change(function(obj){
    window.location = "/lifecycles/"+$("#lifecycle-select").val();
});

$("#new-dialog").dialog({
    autoOpen:false,
    title: "New Lifecycle",
    modal: true,
    width: '350px'
});
$("#new-lifecycle").click(function() {
    $("#new-dialog").dialog("open");
    return false;
});

$("#edit-dialog").dialog({
    autoOpen:false,
    title: "Edit Lifecycle",
    modal: true,
    width: '350px'
});

$("#edit-lifecycle").click(function() {
    $("#edit-dialog").dialog("open");
    return false;
});

$(function() {
		$("#notaccordion").addClass("ui-accordion ui-widget ui-helper-reset")
		.find("h3")
			.addClass("ui-accordion-header ui-helper-reset ui-state-default ui-corner-top ui-corner-bottom")
			.prepend('<span class="ui-icon ui-icon-triangle-1-e"/>')
			.click(function() {
				$(this).toggleClass("ui-accordion-header-active").toggleClass("ui-state-active")
					.toggleClass("ui-state-default").toggleClass("ui-corner-bottom")
				.find("> .ui-icon").toggleClass("ui-icon-triangle-1-e").toggleClass("ui-icon-triangle-1-s");
				$(this).next().toggleClass("ui-accordion-content-active");
                $(this).next().toggle();
				return false;
			})
			.next().addClass("ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom").toggle().toggle();
});

$('#phases').sortable({
    axis: 'y',
    dropOnEmpty: false,
    items: 'li',
    opacity: 0.6,
    scroll: true,
    update: function(){

        $.ajax({
            beforeSend: function(xhr) {
                xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
            },
            type: 'post',
            data: $('#phases').sortable('serialize'),
            dataType: 'script',
            /*
            complete: function(request){
                $('#phases').effect('highlight');
            },*/
            url: '/lifecycles/sort'})

    }
});

$(".deliverables tbody").sortable({
    helper: fixHelper,
    dropOnEmpty:false,
    opacity: 0.6,
    scroll: false,
    update: function(event, ui){
        $.ajax({
           beforeSend: function(xhr){
               xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
           },
           type: 'post',
           data: $(this).sortable('serialize'),
           dataType: 'script',
           url: '/lifecycle_phases/sort'
        });
    }
}).disableSelection();

var fixHelper = function(e, ui) {
    ui.children().each(function() {
        $(this).width($(this).width());
    });
    return ui;
};

$("#new-phase-dialog").dialog({
    autoOpen:false,
    title: "New Lifecycle Phase",
    modal: true,
    width: '500px'

});
$("#new-phase").click(function() {
    $("#new-phase-dialog").dialog("open");
    return false;
});

function show_phase_dialog(phase_id){
    $("#view-phase-dialog-content").load("/lifecycle_phases/"+phase_id+"/?no_layout=true",
    function(){
        $("#view-phase-dialog").dialog({
            autoOpen:false,
            title: "Phase Details",
            modal: true
        });
        $("#view-phase-dialog").dialog("open");
        $("#edit-phase-link").click(function(){
            edit_phase_dialog(phase_id);
            $("#view-phase-dialog").dialog("close");
            return false;
        });
    });

    return false;
}

function edit_phase_dialog(phase_id){
    $("#edit-phase-dialog-content").load("/lifecycle_phases/"+phase_id+"/edit/?no_layout=true",
    function(){
        $("#edit-phase-dialog").dialog({
            autoOpen:false,
            title: "Edit Phase",
            modal: true,
            width: '500px'

        });

        $("#edit-phase-dialog").dialog("open");
    });
    return false;
}

//Adding dialog boxes for phase deliverables

$("#new-deliverable-dialog").dialog({
    autoOpen:false,
    title: "New Lifecycle Phase deliverable",
    modal: true,
    width: '500px'

});
$("#new-deliverable").click(function() {
    $("#new-deliverable-dialog").dialog("open");
    return false;
});

function show_deliverable_dialog(deliverable_id){
    $("#view-deliverable-dialog-content").load("/lifecycle_phase_deliverables/"+deliverable_id+"/?no_layout=true",
    function(){
        $("#view-deliverable-dialog").dialog({
            autoOpen:false,
            title: "Deliverable Details",
            modal: true
        });
        $("#view-deliverable-dialog").dialog("open");
        $("#edit-deliverable-link").click(function(){
            edit_deliverable_dialog(deliverable_id);
            $("#view-deliverable-dialog").dialog("close");
            return false;
        });
    });

    return false;
}

function edit_deliverable_dialog(deliverable_id){
    $("#edit-deliverable-dialog-content").load("/lifecycle_phase_deliverables/"+deliverable_id+"/edit/?no_layout=true",
    function(){
        $("#edit-deliverable-dialog").dialog({
            autoOpen:false,
            title: "Edit Deliverable",
            modal: true,
            width: '500px'

        });

        $("#edit-deliverable-dialog").dialog("open");
    });
    return false;
}

$("#new-deliverable-dialog").dialog({
    autoOpen:false,
    title: "New Deliverable",
    modal: true,
    width: '500px'

});

$(".new-deliverable").click(function() {
    $("#deliverable_position").val($(this).parent().find('tr').length);
    $("#phase_name").val($(this).parent().parent().find('a').get(0).text);
    $("#lifecycle_phase_deliverable_lifecycle_phase_id").val($(this).parent().parent().attr('id').substr(6));
    $("#new-deliverable-dialog").dialog("open");
    return false;
});
