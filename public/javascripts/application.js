function load(){
  
  
  
$('#pictureBar div').not('#arrows1,#arrows2').css('border','2px solid #888');
$('#blurbBox1').css('display','none');
$('#blurbBox3').css('display','none');

$('#employer').mouseenter(function(){
  $('#employer').css('border','3px solid #000');
  $('#pictureBar div').not('#employer,#arrows1,#arrows2').css('border','2px solid #888');
  $('#blurbBox1').css('display','block');
  $('#blurbBox2').css('display','none');
  $('#blurbBox3').css('display','none');
});

$('#employee').mouseenter(function(){
  $('#employee').css('border','3px solid #000');
  $('#pictureBar div').not('#employee,#arrows1,#arrows2').css('border','2px solid #888');
  $('#blurbBox3').css('display','block');
  $('#blurbBox1').css('display','none');
  $('#blurbBox2').css('display','none');
});

$('#fileAJob').mouseenter(function(){
  $('#fileAJob').css('border','3px solid #000');
  $('#pictureBar div').not('#fileAJob,#arrows1,#arrows2').css('border','2px solid #888');
  $('#blurbBox2').css('display','block');
  $('#blurbBox3').css('display','none');
  $('#blurbBox1').css('display','none');
});





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


function signUpLoad(){
  $('#user_name').css('color','#aaa');
  $('#user_name').val('Username');
  $('#user_email').css('color','#aaa');
  $('#user_email').val('email@example.com');

  
  var nameCount=0;
  var emailCount=0;
  var passwordCount=0;
  
  $('#user_name').focus(function(){
    if (nameCount == 0){
    $('#user_name').val('');
    nameCount=1;
    $('#user_name').css('color','#000');}
  })
  $('#user_name').blur(function(){
    if (this.value == ""){
    $('#user_name').val('Username');
    nameCount=0;
    $('#user_name').css('color','#aaa');}
  })
  
  $('#user_email').focus(function(){
    if (emailCount == 0){
    $('#user_email').val('');
    emailCount=1;
    $('#user_email').css('color','#000');}
  })
  $('#user_email').blur(function(){
    if (this.value == ""){
    $('#user_email').val('email@example.com');
    emailCount=0;
    $('#user_email').css('color','#aaa');}
  })
  
  
}
