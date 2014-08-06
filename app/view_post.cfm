  <cfinvoke component="Audibleapp" method="userPosts" returnvariable="posts" thisusername="#GetAuthUser()#" postId="#url.postId#">  
  <cfinvoke component="Audibleapp" method="thisStatus" returnvariable="status" showpost="#posts.showpost#">
 <cfset app = true>
 <cfset minfooter = true>
 <cfinclude template="../page_header.cfm">  
 <script src="../assets/jquery.autosize.min.js"></script>

 <div class="container">
    <div class="hero-unit">
      <h1>Your story</h1>
      

    </div>


      <div class="row">
       <div class="span12">
        
        <h2>Story Status: <cfoutput>#status#</cfoutput>  </h2>
        
          <form action="edit_post_action.cfm" method="post" id="editPostForm">
            <cfif posts.showpost eq 'E'>    
              <label for="content">You may edit your story here if you have not yet submitted it for inclusion. </label>
              <textarea 
                name="content" 
                
                id="content" 
                rows="4" 
                class="form-control span12"   
            
              ><cfoutput>#posts.content#</cfoutput></textarea>
            
            <br>
            <cfelse>
              <cfoutput>#posts.content#</cfoutput>
            </cfif>


            <div class="form-group">
              <cfif posts.showpost eq 'E'>    
                <input class="btn btn-primary" type="button" value="Save story &raquo;" name="save"/>
                <input class="btn btn-success" type="button" value="Submit story for inclusion &raquo;" name="include"/>
               </cfif>
               <cfif posts.showpost eq 'E' or posts.showpost eq 'R'>
                <input class="btn btn-danger" type="button" value="Delete story &raquo;" name="delete"/>   
               </cfif>
              
            </div>
              <input type="hidden" name="formAction" value="" id="formAction"/>
              <cfoutput>
                <input type="hidden" name="postId" value="#posts.id#"/>
              </cfoutput>
          </form>
        
            

            <div>

            </div>
        
      </div>
      </div>

<cfinclude template="../lastfooter.cfm">
<script type="text/javascript">
  
  
  var viewpost = {
    onReady: function() {
      $("#content").autosize();  
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
