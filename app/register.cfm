  <cfif isDefined("form.submit")>
    <cfinvoke component="Audibleapp" method="registerForSummary" registeredEmail="#form.email#" returnvariable="result"/>
  </cfif>
 <cfset app = true>
 <cfset minfooter = true>
 <cfinclude template="../page_header.cfm">  
 

 <div class="container">
    <div class="hero-unit">
      <h1>Register for research summary</h1>
      

    </div>


      <div class="row">
       <div class="span9">
        
      <cfif not isdefined("form.submit")>
  

      <p>If you would like to receive a summary of the research findings once it is complete, please register here.</p>
      <p>Your email address isn't linked to your user ID so you will remain anonymous.</p>

          <form action="register.cfm" method="post" class="form-control">
             <div class="form-group ">
               <label for="email">Email address
            </label>
              <p><input type="text" placeholder="Email" class="form-control" id="email" name="email"></p>
                <p>
                  <input type="submit" class="btn btn-success" id="submit" value="Submit" name="submit"/>
              </p>
              </div>
          </form>
      <cfelse>
        <cfoutput>
          <p>#result#</p>
        </cfoutput>

      </cfif>
            

        
      </div>
      

<cfinclude template="page_footer.cfm">
