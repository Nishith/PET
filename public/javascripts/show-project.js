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