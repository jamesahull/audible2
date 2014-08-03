<cfcomponent>
	<cfset This.name = "AudiblethoughtsApp2">
	<cfset this.sessionmanagement = 'true'>
	<cfset this.loginstorage="session">


<cfset this.datasource = "northern_aliweb">

<cffunction name="onmissingtemplate">
	<cflocation url="../404.cfm">
</cffunction>

<cffunction name="onrequeststart">
	<cflogin>
		<cfif not isdefined("cflogin")>
			<cfinclude template="signin.cfm">
			<cfabort>
		<cfelse>
			<cfquery name="q">
				select username, '' roles from northern_aliweb.users 
				where username = <cfqueryparam value="#cflogin.name#" cfsqltype="cf_sql_varchar">
				and password = <cfqueryparam value="#cflogin.password#" cfsqltype="cf_sql_varchar">
			</cfquery>
			<cfif q.recordcount eq 1>
				<cfloginuser name="#cflogin.name#" password="#cflogin.password#" roles="#q.roles#">	
			<cfelse>
				<cfset msg="Your credentials are incorrect. Please try again.">
				<cfinclude template="signin.cfm">
				<cfabort>
			</cfif>
			
				
			
		</cfif>
	</cflogin>
</cffunction>
</cfcomponent>