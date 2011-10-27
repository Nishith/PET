/**
 * Created by JetBrains RubyMine.
 * User: nishithnand
 * Date: 10/4/11
 * Time: 3:46 PM
 * To change this template use File | Settings | File Templates.
 */
$("#new-dialog").dialog({
    autoOpen:false,
    title: "New Project",
    modal: true
});
$("#new-project").click(function() {
    $("#new-dialog").dialog("open");
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

$("#edit-dialog").dialog({
    autoOpen:false,
    title: "Edit Project",
    modal: true
});

$("#edit-project").click(function() {
    $("#edit-dialog").dialog("open");
    return false;
});

$("#project-select").change(function(obj){
    window.location = "/projects/"+$("#project-select").val();
});

$("#new-phase-dialog").dialog({
    autoOpen:false,
    title: "New Project Phase",
    modal: true,
    width: '500px'

});
$("#new-phase").click(function() {
    $("#new-phase-dialog").dialog("open");
    return false;
});

$("#new-deliverable-dialog").dialog({
    autoOpen:false,
    title: "New Deliverable",
    modal: true,
    width: '500px'

});
$(".new-deliverable").click(function() {
    $("#deliverable_position").val($(this).parent().find('tr').length);
    $("#phase_name").val($(this).parent().parent().find('a').get(0).text);
    $("#project_phase_deliverable_project_phase_id").val($(this).parent().parent().attr('id').substr(6));
    $("#new-deliverable-dialog").dialog("open");
    return false;
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
            url: '/projects/sort'})

    }
});

var fixHelper = function(e, ui) {
    ui.children().each(function() {
        $(this).width($(this).width());
    });
    return ui;
};

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
           url: '/project_phases/sort'
        });
    }
}).disableSelection();