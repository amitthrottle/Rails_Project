 $(document).ready(function(){	 

  $('#customer_date_time, #doctor_start_time, #doctor_end_time').datetimepicker({
	    
		onGenerate:function( ct ){
		    $(this).find('.xdsoft_date.xdsoft_weekend').addClass('xdsoft_disabled');
		},		
		weekends:['01.01.2014','02.01.2014','03.01.2014','04.01.2014','05.01.2014','06.01.2014'],
		format:'d.m.Y H:i',
		startDate:'+2014/08/01',
		lang:'en',
		inline: false,
		allowTimes:['10:00', '10:30', '11:00', '11:30', '17:00', '17:30', '18:00']
	});
 });