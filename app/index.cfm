  <cfinvoke component="Audibleapp" method="homequeries" returnvariable="queries" thisusername="#GetAuthUser()#">
 <cfset app = true>
 <cfinclude template="../page_header.cfm">  
 <div class="container">
    <div class="hero-unit">
      <h1>Audible Thoughts</h1>
      <cfoutput><h2>Homepage for #GetAuthUser()#</h2></cfoutput>
      

    </div>


      <div class="row">
       
        <div class="span9">
          <h2>My stories</h2>
          <table class="table">
            <cfoutput query="queries.posts">
              <tr>
                <td>#htmleditformat(left(queries.posts.content,150))# ...</td>
                <td>
                  <cfswitch expression="#queries.posts.showpost#">
                    <cfcase value="E">
                      Saved
                    </cfcase>
                    <cfcase value="R">
                      Submitted
                    </cfcase>
                    <cfcase value="Y">
                      Accepted
                    </cfcase>
                    <cfdefaultcase>
                      N/A
                    </cfdefaultcase>
                  </cfswitch>

                </td>
                <td><a href="view_post.cfm?postId=#queries.posts.id#">Actions</a></td>
              </tr>
            </cfoutput>
          </table>  

          
       </div>

           <div class="span3">
            <div class="well">
              <ul class="nav nav-list">
                <li class="nav-header">My Actions</li>
                <li><a class="" href="submit_post.cfm" >Submit a new story &raquo;</a></li>
                <li><a class="" href="ask_question.cfm" >Ask a question &raquo;</a></li>
                <li><a class="" href="withdraw.cfm" >Withdraw from study &raquo;</a></li>
                <li><a class="" href="register.cfm" >Register to receive a summary of the research &raquo;</a></li>
              </ul>
            </div>
          </div>
        </div>
        <div class="row">
       <div class="span9">
          <h2>My questions</h2> 
          <table class="table">
            <cfoutput query="queries.questions">
              <tr>
                <td>#htmleditformat(left(queries.questions.question,100))# ...</td>
                
                
                <td><cfif queries.questions.answered eq 'Y'>
                <a href="see_answer.cfm?id=#queries.questions.id#">Answer posted</a></cfif></td>
                
              </tr>
            </cfoutput>
          </table>  
        </div>
    
        </div>
      </div>


<cfinclude template="lastfooter.cfm">
