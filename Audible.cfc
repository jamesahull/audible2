<cfcomponent>
	<cffunction name="checkId" returntype="String" access="remote">
		<cfargument name="username" type="string">
		<cfset var result = ''/>
		<cfquery name="q">
			select username from users where lower(username) = <cfqueryparam value="#lcase(username)#" cfsqltype="cf_sql_varchar">
		</cfquery>
		<cfif q.recordcount eq 0>
			<cfif len(username) lt 5>
				<cfset result = 'User name needs to be at least 5 characters long.' />
			<cfelse>
				<cfset result = "User name OK">
			</cfif>
		<cfelse>
			<cfset result = "That username is already taken">
		</cfif>

		<cfreturn result />
	</cffunction>

	<cffunction name="checkPassword" returntype="String" access="remote">
		<cfargument name="attempt" type="string">
		<cfset var result = 'Password OK'>

		<cfif len(attempt) LT 5>
			<cfset result = "Password not long enough">
		</cfif>
		<cfreturn result>
	</cffunction>

</cfcomponent>