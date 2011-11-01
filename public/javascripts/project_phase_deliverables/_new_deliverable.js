/**
 * Created by JetBrains RubyMine.
 * User: kpantic
 * Date: 10/27/11
 * Time: 1:44 PM
 * To change this template use File | Settings | File Templates.
 */

$("#project_phase_deliverable_deliverable_type_id").change(function(obj){
    $.ajax({
       beforeSend: function(xhr){
               xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
           },
       type: 'post',
       data: {'id': $("#project_phase_deliverable_deliverable_type_id").val()},
       dataType: 'json',
       url: '/project_phase_deliverables/getuom',
       success: function(data){
           $("#project_phase_deliverable_uom_id").val(data.uom.id);
           $("#project_phase_deliverable_uom_id").attr("disabled","disabled");
           $("#project_phase_deliverable_uom_id").change();
       }
    });
});

$("#project_phase_deliverable_uom_id").change(function(obj){
    var uom = $("#project_phase_deliverable_uom_id option:selected").text();
    $("#size_uom").text(uom.toLowerCase());
    $("#size_uom_singular").text((uom.toLowerCase()).singularize());
});