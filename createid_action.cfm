<cfinclude template="page_header.cfm">

<cfinvoke component="Audible" method="createUser" argumentcollection="#form#" returnvariable="result">

<div class="container">
    <div class="hero-unit">
    	
    	<h1>Register</h1>

    </div>

    <div class="row">
        <div class="span9">
    		<cfoutput>
                
                <h2>#result#</h2>
                <form action="app/index.cfm" method="post">
                    <input type="hidden" name="j_username"  value="#form.username#"/><br>
                
                    <input type="hidden" name="j_password" id="pwd"  value="#form.password#"/><br>
                
                    <input type="submit" name="Submit" class="form-control btn" id="btnSubmit" value="Continue to write your story"/>
                
                </form>

            </cfoutput>
    	</div>

<cfinclude template="page_footer.cfm">
