/**
 * Created by JetBrains RubyMine.
 * User: kpantic
 * Date: 10/27/11
 * Time: 1:44 PM
 * To change this template use File | Settings | File Templates.
 */

$("#edit_project_phase_deliverable_deliverable_type_id").change(function(obj){
    if($("#edit_project_phase_deliverable_deliverable_type_id").val() == ""){
        //users choose "ad-hoc"
        $("#edit_project_phase_deliverable_uom_id").removeAttr("disabled");

    }else{
        $.ajax({
           beforeSend: function(xhr){
                   xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
               },
           type: 'post',
           data: {'id': $("#edit_project_phase_deliverable_deliverable_type_id").val()},
           dataType: 'json',
           url: '/project_phase_deliverables/getuom',
           success: function(data){
               $("#edit_project_phase_deliverable_uom_id").val(data.uom.id);
               $("#edit_project_phase_deliverable_uom_id").attr("disabled","disabled");
               $("#edit_project_phase_deliverable_uom_id").change();
           }
        });
    }
});

$("#edit_project_phase_deliverable_uom_id").change(function(obj){
    var uom = $("#edit_project_phase_deliverable_uom_id option:selected").text();
    $("#edit_size_uom").text(uom.toLowerCase());
    $("#edit_size_uom_singular").text((uom.toLowerCase()).singularize());
});

$(".deliverable_form").submit(function(){
    $("#edit_project_phase_deliverable_uom_id").removeAttr("disabled");
});