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
       <div class="span6">
        
      <cfif not isdefined("form.submit")>
  

      <p>If you would like to receive a summary of the research once it is complete, please provide your email address and you will be added to the mailing list.</p>
          <p>Please note that this email address is not linked to your user profile so your anonymity is protected.</p>
          <form action="register.cfm" method="post" class="form-control">
             <div class="form-group ">
               <label for="email">Email address
            </label>
              <p><input type="text" placeholder="Email" class="form-control" id="email" name="email"></p>
                <p>
                  <input type="submit" class="btn btn-success" id="submit" value="Submit" name="submit"/>
              </p>
          </form>
      <cfelse>
        <cfoutput>
          <p>#result#</p>
        </cfoutput>

      </cfif>
            </div>
             </div>

          </form>


        </div>
      </div>
      

<cfinclude template="lastfooter.cfm">
