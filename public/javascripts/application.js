// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


function load(){
  

$('#usersByTag').css('display','none');
$('#postTab').css('background-color','#fff');
$('#postTab a').css('color','#19d700');
$('#userTab').css('background-color','#ccc');
$('#userTab a').css('color','#444');


$('#postTab').click(function(){
  $('#postsByTag').css('display','block');
  $('#usersByTag').css('display','none');
  $('#postTab').css('background-color','#fff');
  $('#postTab a').css('color','#19d700');
  $('#userTab').css('background-color','#ccc');
  $('#userTab a').css('color','#444');
})


$('#userTab').click(function(){
  $('#postsByTag').css('display','none');
  $('#usersByTag').css('display','block');
  $('#userTab').css('background-color','#fff');
  $('#userTab a').css('color','#19d700');
  $('#postTab').css('background-color','#ccc');
  $('#postTab a').css('color','#444');
})

}