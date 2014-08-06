  
 <cfset app = true>
 <cfset minfooter = true>
 <cfinclude template="../page_header.cfm">  
 <script src="../assets/jquery.autosize.min.js"></script>

 <div class="container">
    <div class="hero-unit">
      <h1>Submit your story</h1>
      

    </div>


      <div class="row">
       <div class="span12">
        <h3>Summary of the research</h3>
          <p>I'm investigating the way mental health service users and healthcare staff work together to make decisions about mental health care. Previous research tells me that service users and healthcare professionals don't always agree about why people experience mental health problems and when they do, what can be done to help. I am interested to find out whether these differences are common and whether they affect people's experiences of using mental health services. </p>  
          <h3>What do I do next?</h3>

          <form action="post_action.cfm" method="post">
            
              <label for="content">This is a place to share your story about your experiences of mental health care. There is no right or wrong way to write, so please share whatever feels comfortable in your own words. You can save your study and come back to it later if you like. If you change your mind, you can click on the 'withdraw from study' button.  </label>
              <textarea 
                name="content" 
                
                id="content" 
                rows="4" 
                class="form-control span12"   
                placeholder="Enter your story here"
              ></textarea>
            
            <br>
 

            <div class="form-group"><input class="btn btn-primary" type="submit" value="Save story &raquo;" name="submit"/></div>
          </form>
      </div>
      </div>

<cfinclude template="../lastfooter.cfm">
<script type="text/javascript">
  $("#content").autosize();
 </script>
