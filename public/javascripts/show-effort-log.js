/**
 * Created by JetBrains RubyMine.
 * User: kpantic
 * Date: 11/8/11
 * Time: 8:28 PM
 * To change this template use File | Settings | File Templates.
 */

$("#project-select").change(function(obj){
    window.location = "/effort_logs/project/"+$("#project-select").val();
});

$("#new-effort-log-dialog").dialog({
    autoOpen:false,
    title: "Log Effort",
    modal: true,
    width: '800px'
});

$(".log-effort").click(function() {
    $("#effort_log_project_phase_deliverable_id").val($(this).parent().parent().find('input').val());
    $("#new-effort-log-dialog").dialog("open");
    return false;
});