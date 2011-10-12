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
})