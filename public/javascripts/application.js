function load(){
  
$('#bioContent').css('display','none');
$('#skillsContent').css('display','none');
$('#credsTab').css('background-color','#fff');
$('#credsTab a').css('color','#19d700');
$('#bioTab').css('background-color','#ccc');
$('#bioTab a').css('color','#444');  
$('#skillsTab').css('background-color','#ccc');
$('#skillsTab a').css('color','#444');

$('#credsTab').click(function(){
  $('#credsContent').css('display','block');
  $('#bioContent').css('display','none');
  $('#skillsContent').css('display','none');
  $('#credsTab').css('background-color','#fff');
  $('#credsTab a').css('color','#19d700');
  $('#bioTab').css('background-color','#ccc');
  $('#bioTab a').css('color','#444');
  $('#skillsTab').css('background-color','#ccc');
  $('#skillsTab a').css('color','#444');
})

$('#bioTab').click(function(){
  $('#bioContent').css('display','block');
  $('#credsContent').css('display','none');
  $('#skillsContent').css('display','none');
  $('#bioTab').css('background-color','#fff');
  $('#bioTab a').css('color','#19d700');
  $('#credsTab').css('background-color','#ccc');
  $('#credsTab a').css('color','#444');
  $('#skillsTab').css('background-color','#ccc');
  $('#skillsTab a').css('color','#444');
})


$('#skillsTab').click(function(){
  $('#skillsContent').css('display','block');
  $('#bioContent').css('display','none');
  $('#credsContent').css('display','none');
  $('#skillsTab').css('background-color','#fff');
  $('#skillsTab a').css('color','#19d700');
  $('#bioTab').css('background-color','#ccc');
  $('#bioTab a').css('color','#444');
  $('#credsTab').css('background-color','#ccc');
  $('#credsTab a').css('color','#444');
})
  
  
  

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