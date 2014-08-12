<cfinclude template="page_header.cfm">

	
<div class="container">
    <div class="hero-unit">
    	
    	<h1>Register</h1>

    </div>

    <div class="row">
        <div class="span9">
    		<section id="consentForm">
                <form action="createid_action.cfm" method="post" class="signupform" id="createForm">
                	<div class="form-group ">
                        <label for="newuserid">Give yourself an anonymous user name so that you can log in again in future.
                        </label>
                        <input type="text" placeholder="User name" class="form-control float-left" id="newuserid" name="username">
                        <div id="username-target" class="ajax-target"></div>
                        <input type="hidden" id="username-status" value="-1">
                        <div class="clear"></div>
                    
                        <label for="password">Enter a password (at least 5 characters)</label>
                        <input type="password" placeholder="Password" class="form-control float-left" name="password" id="password">
                    
                        <div id="password-target" class="ajax-target"></div>
                        <input type="hidden" id="password-status" value="-1">
                        <div class="clear"></div>

                        <label for="age">Age:</label>      
                        <input type="text" placeholder="Age" class="form-control" name="age" id="age">
                        <p>Sex 
                            <select name="sex" class="form-control">
                            	<option value='F'>Female</option>
                            	<option value='M'>Male</option>
                            	<option value='P'>Prefer not to say</option>
                            </select>
                        </p>
                        <p>What is your current working pattern?
                            <select name="mhp" id="mhp" class="form-control">
                            	<option value='F'>Full time</option>
                            	<option value='P'>Part time</option>
                                <option value='S'>Studying</option>
                                <option value='N'>Not in work</option>
                                <option value='X'>Prefer not to say</option>
                                <option value='O'>Other</option>
                            </select>
                        </p>
                        <p>What sector do you work in?
                            <select name="sector" id="sector" class="form-control">
                                <option>Agriculture</option>
                                <option>Construction</option>
                                <option>Electricity, gas and water supply</option>
                                <option>Manufacturing</option>
                                <option>Mining and quarrying</option>
                                <option>Creative industries</option>
                                <option>Information Technology</option>
                                <option>Education</option>
                                <option>Social work</option>
                                <option>Health</option>
                                <option>Financial and business services</option>
                                <option>Hotels and restaurants</option>
                                <option>Public administration</option>
                                <option>Armed forces</option>
                                <option>Self employed tradesperson</option>
                                <option>Real estate and renting activities</option>
                                <option>Tourism</option>
                                <option>Transport, storage and communication</option>
                                <option>Wholesale and retail trade</option>
                                <option>None of the above</option>
                            </select>
                        </p>
                            
                        <p>Are you or have you ever been employed in mental health services?  
                            <select name="mentalhealth" class="form-control">
                                <option value='N'>No</option>
                                <option value='Y'>Yes</option>
                                <option value='P'>Prefer not to say</option>
                            </select>
                        </p>
                        <p>What is your ethnic group?
                            <select name='ethnic' id='ethnic' class='form-control'>
                                <option value='1'>White English / Welsh / Scottish / Northern Irish / British </option>
                                <option value='2'>White - Irish </option>
                                <option value='3'>White - Gypsy or Irish Traveller </option>
                                <option value='4'>Any other White background, please describe</option>
                                <option value='5'>White and Black Caribbean </option>
                                <option value='6'>White and Black African </option>
                                <option value='7'>White and Asian </option>
                                <option value='8'>Any other Mixed / Multiple ethnic background, please describe</option>
                                <option value='9'>Asian / Asian British - Indian </option>
                                <option value='10'>Asian / Asian British - Pakistani </option>
                                <option value='11'>Asian / Asian British - Bangladeshi </option>
                                <option value='12'>Asian / Asian British - Chinese </option>
                                <option value='13'>Any other Asian background, please describe</option>
                                <option value='14'>African </option>
                                <option value='15'>Caribbean </option>
                                <option value='16'>Any other Black / African / Caribbean background, please describe</option>
                                <option value='17'>Arab </option>
                                <option value='18'>Any other ethnic group, please describe</option>
                                
                            </select>
                        </p>
                        <p id="ethnicselfcontainer" style="display:none;">Please describe your ethnic group 
                            <input type="text" placeholder="Ethnic Group" class="form-control" name="ethnicgroup" >
                        </p>
                        <p>
                            <button type="submit" class="btn btn-success" disabled id="createId">Create ID</button>
                        </p>
                              
                                <input type="hidden" name="direct" value="Y" />
                                <input type="hidden" name="checkpwdesponse" id="checkpwdesponse">
                                <input type="hidden" name="checkuserresponse" id="checkuseresponse">
                    </div> 
                </form> 
            </section>

    	</div>

<cfinclude template="page_footer.cfm">
<script type="text/javascript" src="assets/at.js"   ></script> 
<script type="text/javascript">

</script>