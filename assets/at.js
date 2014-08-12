$(function() {
	initCreateUserIdPageBindings();
	
});

function validAge(age) {
	if (isNaN(age)) {return false;} else if (age < 18 || age > 125) {return false;} else {return true;}
}



function validPassword(password) {
	var result = 0;

 		if(password.length > 4) {
 			result=1;
 			$("#password-target").html("Password OK");}

 			else {
 				$("#password-target").html("Password needs to be at least 5 characters");
 			}
 		$("#password-status").val(result);
	  return result;
}



function initParticpantChecklist() {
	$(".checkAgreed").click(function(){
		var n = $( "input:checked" ).length;
		if(n==5){
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

	//reinstate bindings for first 3 fields
	$("#newuserid").change(function(){
		
		var unique = uniqueUserId($(this).val());
		
			testform();
		
	});
	$("#password").change(function(){
		var isValidPassword = validPassword($(this).val());
		
			testform();
		
	});

	$("#age").change(function(){
				testform();
		
	});

	
}


function testform() {
		
		var userStatus = $("#username-status").val();
		var passwordStatus = $("#password-status").val();
		var age = $("#age").val();
		if(userStatus!=1){return false;}
	
		if(passwordStatus!=1){return false;}
		
	 	if(validAge(age) == false) {return false;}
		shouldCreateButtonBeActive(userStatus,passwordStatus);
			
	}

function isOK(){
	return true;
	
}

function notOK(){
	return false;
}

function shouldCreateButtonBeActive(userStatus, passwordStatus){
	
	if(userStatus==1 && passwordStatus==1){
	$("#createId").prop('disabled',false);
	} else
	{$("#createId").prop('disabled',true);}
}

function uniqueUserId(userId) {
 	$.ajax({ 
        type: "POST", 
        url: 'Audible.cfc?method=checkId&_cf_nodebug=true&returnformat=json&username=' + userId,
        dataType: "html", 
        success: function(response) { 
            var r = jQuery.parseJSON(response);
            $("#username-target").html(r.RESULT);
     		$("#username-status").val(r.RETURNSTATUS);
        	}
        }); 
	  
}

