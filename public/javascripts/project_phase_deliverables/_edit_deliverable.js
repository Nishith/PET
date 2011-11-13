/**
 * Created by JetBrains RubyMine.
 * User: kpantic
 * Date: 10/27/11
 * Time: 1:44 PM
 * To change this template use File | Settings | File Templates.
 */

$(function(){
    update_edit_historical_data();
});

$("#edit_project_phase_deliverable_deliverable_type_id").change(function(obj){
    update_edit_historical_data();
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

$("#edit_project_phase_deliverable_complexity").change(function(obj){
    update_edit_historical_data();
});

$("#edit_project_phase_deliverable_uom_id").change(function(obj){
    var uom = $("#edit_project_phase_deliverable_uom_id option:selected").text();
    $("#edit_size_uom").text(uom.toLowerCase());
    $("#edit_size_uom_singular").text((uom.toLowerCase()).singularize());
});

$(".deliverable_form").submit(function(){
    $("#edit_project_phase_deliverable_uom_id").removeAttr("disabled");
});



function update_edit_historical_data(){
    if($("#edit_project_phase_deliverable_deliverable_type_id").val() == ""){
        $("#edit-historical-data tbody").html("<tr><td colspan='3'>Not available for Ad-Hoc Deliverables</td></tr>");
    }else{
        $.ajax({
            beforeSend: function(xhr) {
                    xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
            },
            type: 'post',
                data: {'deliverable_type_id':$("#edit_project_phase_deliverable_deliverable_type_id").val(),
                    'complexity':$("#edit_project_phase_deliverable_complexity").val()},
                dataType: 'json',
                success: function(data){
                    var htmlstring = "";
                    for(var attr in data){
                        htmlstring += "<tr><td>Min</td><td>Avg</td><td>Max</td></tr>";
                        htmlstring += "<tr><td>" +
                            data[attr].min +
                            "</td><td>" +
                            data[attr].avg +
                            "</td><td>" +
                            data[attr].max +
                            "</td></tr>";
                    }
                    $("#edit-historical-data tbody").html(htmlstring);
                },
                url: '/historical_data/get'
        });
    }
}