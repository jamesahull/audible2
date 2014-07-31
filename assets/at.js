$(function() {
	 iDOK = 0;
	
});

function validAge(age) {
	if (isNaN(age)) {return false;} else if (age < 18 || age > 125) {return false;} else {return true;}
}

function uniqueUserId(userId) {
	var url = 'Audible.cfc?method=checkId&_cf_nodebug=true&returnformat=plain&username=' + userId;

 	$.ajax({ 
            type: "POST", 
            url: url,
            dataType: "html", 
            success: function(response) { 
                $("#username-target").html(response);
         //     	console.log('ajax success: ' + $('#checkuserresponse').val());
            	}
            }); 
	  if($('#checkuserresponse').val() == 1)
                	{return 1;} else {return 0;}
}

function validPassword(password) {
	var url = 'Audible.cfc?method=checkPassword&_cf_nodebug=true&returnformat=plain&attempt=' + password;
	var result = 0;
 	$.ajax({ 
            type: "POST", 
            url: url,
            dataType: "html", 
            success: function(response) { 
                $("#password-target").html(response);
           //   	console.log('ajax success: ' + $('#checkpwdesponse').val());
           		result = 1;

            	}
            }); 
 		console.log('result of pwd function:' + result);
	  return result;
}



function initParticpantChecklist() {
	$(".checkAgreed").click(function(){
		var n = $( "input:checked" ).length;
		if(n==11){
			$("#createUserButtonDiv").show();
			} else {
			$("#createUserButtonDiv").hide();
			}
		

		});
}

function initCreateUserIdPageBindings() {
	$("#mhp").change(function(){
		var mhp = $(this).val();
		if (mhp=='Y') {
			$("#jobtitle").show();
		} else {
			$("#jobtitle").hide();
		}
	});
	$("#ethnic").change(function(){
		var ethnic = $(this).val();
		if (['4','8','13','16','18'].indexOf(ethnic) !== -1) {
			$("#ethnicselfcontainer").show();
		} else {
			$("#ethnicselfcontainer").hide();
		}
	});
/*
	$("#newuserid").blur(function(){
		var userId = $(this).val();
		uniqueUserId(userId);
	});
		
	$("#password").blur(function(){
		var password = $(this).val();
		validPassword(password);
	});
		
*/

	$("#createForm").change(function(){
		
		
		var userId = $("#newuserid").val();
		var password = $("#password").val();
		var age =  $("#age").val();
		var userIdStatus = $("#checkuserresponse").val();
		var unique = uniqueUserId(userId);
		var isValidPassword = validPassword(password);
		var response;
		console.log('pwd:' + isValidPassword);
		if(unique == 0) {return false;}
		if (isValidPassword == 0) {return false;} 
	//	if(validAge(age) == false) {console.log('fail at validage');return false;}


		
		$("#createId").prop('disabled',false);
	});
}