 <cfinvoke component="Audibleapp" method="editpost" argumentcollection="#form#" returnvariable="action" />
 <cfset app = true>
 <cfset minfooter = true>
 <cfinclude template="../page_header.cfm">  
 

 <div class="container">
    <div class="hero-unit">
    	<cfoutput>
      		<h1>Thank you for #action# your story</h1>
      	</cfoutput>

    </div>


      <div class="row">
       <div class="span12">
        <cfif action eq 'deleting'>
          <p>Your story has been deleted – and will not be used in the study.</p>
        </cfif>
        <a href="index.cfm">Return to homepage</a>
      </div>
      </div>

<cfinclude template="../lastfooter.cfm">
