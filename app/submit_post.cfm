  
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
        <h3>What is the purpose of the research?</h3>
<p>Collaborative practice is a type of team working where service users and healthcare staff work in partnership to determine the type of mental healthcare a person needs. In theory, this kind of working encourages greater equality than the traditional patient / professional relationship. However, some previous research questions its supposed benefits. One reason is that mental health service users, healthcare staff and the general public may not be agreed on the causes of mental health problems or about what services and treatments they believe to be helpful. The purpose of this research is to find out more about people's experiences of care within the mental healthcare system and find out more about working relationships between service users and healthcare workers. </p>  
          <form action="post_action.cfm" method="post">
            
              <label for="content">Please write here about your experiences within mental health. It would be helpful if you could give as much detail as you feel comfortable sharing. I am interested in hearing about a range of experiences, both positive and negative. You may wish to write about communication, the extent to which you felt you were listened to, the way staff related to you, the physical environment and so on. There is no right or wrong way to tell your story, please write in a way which feels comfortable to you. <br>Thank you. </label>
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

<cfinclude template="lastfooter.cfm">
<script type="text/javascript">
  $("#content").autosize();
 </script>
