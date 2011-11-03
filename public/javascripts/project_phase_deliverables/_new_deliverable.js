/**
 * Created by JetBrains RubyMine.
 * User: kpantic
 * Date: 10/27/11
 * Time: 1:44 PM
 * To change this template use File | Settings | File Templates.
 */

$("#project_phase_deliverable_deliverable_type_id").change(function(obj){
    if($("#project_phase_deliverable_deliverable_type_id").val() == ""){
        //users choose "ad-hoc"
        $("#project_phase_deliverable_uom_id").removeAttr("disabled");

    }else{
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
    }
});

$("#project_phase_deliverable_uom_id").change(function(obj){
    var uom = $("#project_phase_deliverable_uom_id option:selected").text();
    $("#size_uom").text(uom.toLowerCase());
    $("#size_uom_singular").text((uom.toLowerCase()).singularize());
});

$(".deliverable_form").submit(function(){
    $("#project_phase_deliverable_uom_id").removeAttr("disabled");
});

function calculate_effort(obj){
    var size   = $("#project_phase_deliverable_estimated_size").val();
    var rate   = $("#project_phase_deliverable_production_rate").val();
    var effort = $("#project_phase_deliverable_total_effort").val();
    if((size != 0) && (rate != 0)){
        $("#project_phase_deliverable_total_effort").val(size * rate);
    }
    else if((rate != 0) && (effort != 0)){
        $("#project_phase_deliverable_estimated_size").val(effort / rate);
    }
    else if((effort != 0) && (size != 0)){
        $("#project_phase_deliverable_production_rate").val(effort / size);
    }
    else alert("Please enter two of the values from Estimated size, Production rate, or Total effort to calculate the third.");
}