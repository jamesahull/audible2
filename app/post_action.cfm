<cfinvoke component="Audibleapp" method="submitpost" argumentcollection="#form#" returnvariable="postId" />
 <cfset app = true>
 <cfset minfooter = true>
 <cfinclude template="../page_header.cfm">  
 <script src="../assets/jquery.autosize.min.js"></script>

 <div class="container">
    <div class="hero-unit">
      <h1>Thank you</h1>
      

    </div>


      <div class="row">
       <div class="span9">
         <div class="form-group">
            <p>Thank you very much for taking part. If you have any questions about this research, please contact me <a href="ask_question.cfm">here</a>.</p>
          	 <form action="edit_post_action.cfm" method="post" id="editPostForm">
             		<a class="btn btn-primary" href="index.cfm">Return to homepage &raquo;</a>
                <input class="btn btn-success standard-submit" type="button" value="Submit story for inclusion in study &raquo;" name="includenow"/>
              <input class="btn btn-danger" id="deleteStory" type="button" value="Delete story &raquo;" name="delete"/>
              <input type="hidden" name="formAction" value="" id="formAction"/>
                <cfoutput>
                  <input type="hidden" name="postId" value="#postid#"/>
                  <input type="hidden" name="initialpost" value="true"/>
                </cfoutput>
             </form>
                    
            </div>
              
        </div>
      
<cfinclude template="submitscripts.cfm">

<cfinclude template="../page_footer.cfm">
