<cfinclude template="page_header.cfm">

	
	<div class="container">
<div class="hero-unit">
	
	<h1>Participant Consent Form</h1>

</div>

<div class="row">
<div class="span9">

		<section id="consentForm">
 <form id="agreeForm" action="createid.cfm" method="post">
	 	<table>
	 		<tr>
	 			<td>
            <label for="agree1">I have read and understood the participant information page</label>
            	</td>
            	<td>
            <input type="checkbox" id="agree1" class="checkAgreed"></td></tr><tr>
            	<td>
            <label for="agree2">I have had the opportunity to ask questions and discuss the study</label></td>
            	<td>
            <input type="checkbox" id="agree2" class="checkAgreed"></td></tr><tr>
            	<td>
            <label for="agree3">I have had satisfactory answers to any questions</label></td>
            	<td>
            <input type="checkbox" id="agree3" class="checkAgreed"></td></tr><tr>
            	<td>
            <label for="agree4">I have been given enough information to decide whether I want to take part in this study</label></td>
            	<td>
            <input type="checkbox" id="agree4" class="checkAgreed"></td></tr><tr>
            	<td colspan="2">
            I understand I am free to withdraw from the study:
            </td></tr><tr>
            <td>
            <label for="agree5" class="indent">Up to to two weeks after posting my information on this site</label></td>
        	<td>
            <input type="checkbox" id="agree5" class="checkAgreed"></td></tr><tr>
        	<td>
            <label for="agree6" class="indent">Without having to give any reason for withdrawing</label></td>
        	<td>
            <input type="checkbox" id="agree6" class="checkAgreed"></td></tr><tr>
        	<td>
            <label for="agree7" class="indent">That if I choose to withdraw, my written information will be destroyed and  any data I have provided will not be used in the study</label></td>
        	<td>
            <input type="checkbox" id="agree7" class="checkAgreed"></td></tr><tr>
        	<td>
	        
            <label for="agree8">I understand that any information that I provide will be kept confidential, stored securely and only accessed by those carrying out the study</label></td>
            	<td>
            <input type="checkbox" id="agree8" class="checkAgreed"></td></tr><tr>
            	<td>
			<label for="agree9">I understand that information I provide may be quoted in published documents but that this information will be anonymised</label></td>
            	<td>
            <input type="checkbox" id="agree9" class="checkAgreed"></td></tr><tr>
            	<td>
            <label for="agree10">I agree to take part in this study</label></td>
            	<td>
            <input type="checkbox" id="agree10" class="checkAgreed"></td></tr><tr>
            	<tr>
                    <td colspan='2'><label for="direct">As part of this research project, the researcher may use direct quotes from people's stories. Please confirm below whether you agree to this:</label><br>
                    <input type="radio" name="direct" id="direct" value="Y" checked="checked"  > I agree to the use of (anonymised) quotes in this research project<br>
                    <input type="radio" name="direct" id="direct" value="N"> I agree to take part in this research but would prefer not to be quoted
                    </td>
                </tr>
        </table>
    

        <div id="createUserButtonDiv" style="display:none"><a class="btn btn-primary btn-lg" id="createUserButton" role="button" onclick="document.getElementById('agreeForm').submit();">Register &raquo;</a></div>
    </form>
 

		</section>

	
		
	</div>
<cfinclude template="page_footer.cfm">
   <script type="text/javascript" src="assets/at.js"   ></script> 
   <script type="text/javascript">
    initParticpantChecklist();
    </script>
