<cfcomponent>
	<cffunction name="checkId" returntype="String" access="remote">
		<cfargument name="username" type="string">
		<cfset var loc = {} />
		<cfset loc.returnStatus = 0/>
		<cfquery name="q">
			select username from users where lower(username) = <cfqueryparam value="#lcase(username)#" cfsqltype="cf_sql_varchar">
		</cfquery>
		<cfif q.recordcount eq 0>
			<cfif len(username) lt 4>
				<cfset loc.result = 'User name needs to be at least 4 characters long.' />
			<cfelse>
				<cfset loc.result = "User name OK">
				<cfset loc.returnStatus = 1>
			</cfif>
		<cfelse>
			<cfset loc.result = "That username is already taken">
		</cfif>

		
		<cfreturn SerializeJson(loc) />
	</cffunction>


	<cffunction name="createUser" returntype="string" >
		<cfargument name="username">
		<cfargument name="password">
		<cfargument name="age">
		<cfargument name="sex">
		<cfargument name="sector">
		<cfargument name="mentalhealth">
		<cfargument name="ethnic">
		<cfargument name="ethnicgroup">
		<cfargument name="mhp">
		<cfargument name="direct">
		<cftry>
		<cfquery name="q" >
			insert into northern_aliweb.users (
				username,
				password,
				create_date,
				age,
				sex,
				mhp,
				mentalhealth,
				ethnic,
				ethnicgroup,
				usedirect,
				sector

				) VALUES (
				<cfqueryparam value="#username#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#password#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#now()#" cfsqltype="cf_sql_date">,
				<cfqueryparam value="#age#" cfsqltype="cf_sql_numeric">,
				<cfqueryparam value="#sex#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#mhp#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#mentalhealth#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#ethnic#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#ethnicgroup#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#direct#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#sector#" cfsqltype="cf_sql_varchar">
				)
		</cfquery>	
			<cfcatch type="database">
				<cfreturn cfcatch.detail />
			</cfcatch>
		</cftry>

		<cfreturn 'User profile created successfully' />

	</cffunction>

	

</cfcomponent>