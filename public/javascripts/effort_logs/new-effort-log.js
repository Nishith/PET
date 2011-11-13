/**
 * Created by JetBrains RubyMine.
 * User: kpantic
 * Date: 11/12/11
 * Time: 4:54 PM
 * To change this template use File | Settings | File Templates.
 */


$(function()
{

    $('#selectedDatepicker').datepicker({
	beforeShow: readSelected, onSelect: updateSelected, 
	minDate: new Date(2001, 1 - 1, 1), maxDate: new Date(), 
	showOn: 'both', buttonImageOnly: true, buttonImage: '/images/calendar.jpg'}); 
    
    // Prepare to show a date picker linked to three select controls 
    function readSelected() { 
	$('#selectedDatepicker').val($('#effort_log_date_2i').val() + '/' + 
				     $('#effort_log_date_3i').val() + '/' + $('#effort_log_date_1i').val()); 
	return {}; 
} 
    
    // Update three select controls to match a date picker selection 
    function updateSelected(date) { 
	$('#effort_log_date_2i').val(parseFloat(date.substring(0, 2))); 
	$('#effort_log_date_3i').val(parseFloat(date.substring(3, 5)));  
        $('#effort_log_date_1i').val(parseFloat(date.substring(6, 10))); 
    }
});
