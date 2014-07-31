<cfcomponent>
	<cfset This.name = "AudiblethoughtsApp-2.0">

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
				select loginid, roles from users 
				where loginid = <cfqueryparam value="#cflogin.name#" cfsqltype="cf_sql_varchar">
				and pwd = <cfqueryparam value="#cflogin.password#" cfsqltype="cf_sql_varchar">
			</cfquery>
			<cfif q.recordcount eq 1>
				<cfloginuser name="#cflogin.name#" password="#cflogin.password#" roles="#q.roles#">	
			<cfelse>
				<cflocation url="../index.cfm">
			</cfif>
			
				
			
		</cfif>
	</cflogin>
</cffunction>
</cfcomponent>