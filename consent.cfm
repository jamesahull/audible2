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
            <label for="agree1">I have read and understood what this study is about</label>
            	</td>
            	<td>
            <input type="checkbox" id="agree1" class="checkAgreed"></td></tr><tr>
            	<td>
            <label for="agree2">I have been given the chance to ask questions about the study</label></td>
            	<td>
            <input type="checkbox" id="agree2" class="checkAgreed"></td></tr><tr>
            	<td>
            <label for="agree3">I understand I am able to withdraw from the study </label></td>
            	<td>
            <input type="checkbox" id="agree3" class="checkAgreed"></td></tr><tr>
            	<td>
            <label for="agree4">I agree to take part</label></td>
            	<td>
            <input type="checkbox" id="agree4" class="checkAgreed"></td></tr><tr>
            	<tr>
                    <td colspan='2'><label for="direct">As part of this research project, the researcher may use direct quotes from people's stories. Please confirm below whether you agree to this:</label><br>
                    <input type="radio" name="direct" id="direct" value="Y" checked="checked"  > I agree to the use of quotes from my story and understand this will be anonymous <br>
                    <input type="radio" name="direct" id="direct" value="N"> I'm happy to take part but please do not use quotes taken from my story.
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
