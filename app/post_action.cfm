<cfinvoke component="Audibleapp" method="submitpost" argumentcollection="#form#" returnvariable="postId" />
 <cfset app = true>
 <cfset minfooter = true>
 <cfinclude template="../page_header.cfm">  
 

 <div class="container">
    <div class="hero-unit">
      <h2>Thank you for submitting your story</h2>
      

    </div>


      <div class="row">
       <div class="span12">
  <div class="form-group">
  	<form action="edit_post_action.cfm" method="post" id="editPostForm">
        		<a class="btn btn-primary" href="index.cfm">Return to homepage &raquo;</a>
                
                <input class="btn btn-success" type="button" value="Submit story for inclusion in study &raquo;" name="include"/>
                <input class="btn btn-danger" type="button" value="Delete story &raquo;" name="delete"/>   
              
            </div>
              <input type="hidden" name="formAction" value="" id="formAction"/>
              <cfoutput>
                <input type="hidden" name="postId" value="#postid#"/>
                <input type="hidden" name="initialpost" value="true"/>
              </cfoutput>
          </form>

        <a href="index.cfm">Return to homepage</a>
      </div>
      </div>

<cfinclude template="lastfooter.cfm">
<script type="text/javascript">
  
  
  var viewpost = {
    onReady: function() {
      
      $(".btn").click(viewpost.submitPost);    
    },

    submitPost: function() {
      var action= $(this).attr('name');
      $("#formAction").val(action);
      $("#editPostForm").submit();
    }
  };

  $( document ).ready( viewpost.onReady);
 </script>