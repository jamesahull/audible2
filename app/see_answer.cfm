<cfinvoke component="Audibleapp" method="userQuestions" questionid="#url.id#" returnvariable="answeredQuestions" thisusername="#GetAuthUser()#" />
 <cfset app = true>
 <cfset minfooter = true>
 <cfinclude template="../page_header.cfm">  
 

 <div class="container">
    <div class="hero-unit">
      <h1>Your question</h1>
      

    </div>


      <div class="row">
       <div class="span12">
  
            <cfoutput>
    <section id="questions">
      
      <table class="table">
        <cfloop query="answeredQuestions">
        <tr>
          <th>Posted By: #answeredQuestions.username#</th>
          <th>Post Date: #dateformat(answeredQuestions.create_date, "dd/mm/yy")#</th>
          

        </tr>
        <tr>
          <td colspan="2">#answeredQuestions.question#</td>
        </tr>
        <tr>
          <td colspan="2">Researcher's answer: <b>#answeredQuestions.answer#</b></td>
        </tr>
        </cfloop>
      </table>

    
    
    </section>

  

  </cfoutput>

        		<a class="btn btn-primary" href="index.cfm">Return to homepage &raquo;</a>
                
      </div>
      </div>

<cfinclude template="../lastfooter.cfm">
