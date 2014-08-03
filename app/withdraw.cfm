  
 <cfset app = true>
 <cfset minfooter = true>
 <cfinclude template="../page_header.cfm">  
 

 <div class="container">
    <div class="hero-unit">
      <h1>Withdraw from study</h1>
      

    </div>


      <div class="row">
       <div class="span6">
          <p>This will delete all your stories, questions and your user details.</p>
          <button class="btn-danger">This action is permanent and cannot be reversed!</button>
              <p></p>
        </div>        
      </div>
      <div class="row">
        <div class="span6">    

            <a class="btn btn-primary" href="confirm_withdraw.cfm">Withdraw from study and delete me &raquo;</a>
        </div>
      </div>
      

<cfinclude template="lastfooter.cfm">
