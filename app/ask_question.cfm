  
 <cfset app = true>
 <cfset minfooter = true>
 <cfinclude template="../page_header.cfm">  
 <script src="../assets/jquery.autosize.min.js"></script>

 <div class="container">
    <div class="hero-unit">
      <h1>Ask a question</h1>
      

    </div>


      <div class="row">
       <div class="span12">
        
          <form action="question_action.cfm" method="post">
            
              <label for="question">Use this form to ask a question to the researcher.</label>
          <p>You will have to login and check the status of your question at a later date as we do not have contact details for you.</p>
              <textarea 
                name="question" 
                
                id="question" 
                rows="4" 
                class="form-control span12"   
                placeholder="Ask a question here"
              ></textarea>
            
            <br>
 

            <div class="form-group"><input class="btn btn-primary" type="submit" value="Submit question &raquo;" name="submit"/></div>
          </form>
      </div>
      </div>

<cfinclude template="lastfooter.cfm">
<script type="text/javascript">
  $("#question").autosize();
 </script>
