<cfcomponent name="Audible">
	<cffunction name="dashboard" returntype="struct">
		<cfset var status = structNew() >
			<cfquery name="users">
				select count(id) users from northern_aliweb.users 
			</cfquery>
			<cfquery name="posts">
				select count(id) posts from northern_aliweb.posts
			</cfquery>
			<cfquery name="saved" >
				select count(id) posts from northern_aliweb.posts where showpost = 'E'
			</cfquery>
			<cfquery name="submitted" >
				select count(id) posts from northern_aliweb.posts where showpost = 'R'
			</cfquery>
			
			<cfquery name="approved" >
				select count(id) posts from northern_aliweb.posts where showpost = 'Y'
			</cfquery>
			<cfquery name="qs">
				select count(id) questions from northern_aliweb.questions
				where answered != 'Y'
			</cfquery>

			<cfset status.users = users.users />
			<cfset status.posts = posts.posts />
			<cfset status.saved = saved.posts />
			<cfset status.submitted = submitted.posts />
			<cfset status.approved = approved.posts />
			<cfset status.questions = qs.questions />


		<cfreturn status />
	</cffunction>

	<cffunction name="userDetails" returntype="Query">
		<cfargument name="id" type="numeric" required="true">
			
			<cfquery name="q">
				select u.id, u.username, u.sector, u.age, u.sex, u.create_date 
				from northern_aliweb.users u
				<cfif id neq 0>
					where u.id = <cfqueryparam value="#id#" cfsqltype="cf_sql_numeric">
				</cfif>
			</cfquery>				
	
		<cfreturn q />
	</cffunction>

	<cffunction name="extraDetails" returntype="Query">
		<cfargument name="id" type="numeric" required="true">
			
			<cfquery name="q">
				select u.mentalhealth, u.ethnic, u.ethnicgroup
				from northern_aliweb.users u
				<cfif id neq 0>
					where u.id = <cfqueryparam value="#id#" cfsqltype="cf_sql_numeric">
				</cfif>
			</cfquery>				
	
		<cfreturn q />
	</cffunction>


	<cffunction name="countPosts" returntype="Numeric">
		<cfargument name="id" type="numeric" required="true">

			<cfquery name="posts">
					select count(p.id) posts
					from northern_aliweb.posts p
					where p.userid = <cfqueryparam value="#id#" cfsqltype="cf_sql_numeric">
			</cfquery>
		<cfreturn posts.posts />

	</cffunction>

	<cffunction name="postDetails" returntype="Query">
		<cfargument name="userid" type="numeric" required="true">
		<cfargument name="postid" type="numeric" required="false">
		<cfargument name="type" type="string" required="false">
			
			<cfquery name="posts">
					select p.id , p.content, p.create_date, s.name
					from northern_aliweb.posts p, northern_aliweb.poststatus s
					where p.showpost = s.status
					<cfif userid neq 0>
					and	p.userid = <cfqueryparam value="#userid#" cfsqltype="cf_sql_numeric">
					</cfif>
					<cfif isDefined("postid")>
						<cfif postid neq 0>
							and p.id = <cfqueryparam value="#postid#" cfsqltype="cf_sql_numeric">	
						</cfif>
					</cfif>
					<cfif isDefined("type")>
						and p.showpost = <cfqueryparam value="#type#" cfsqltype="cf_sql_varchar" >
					</cfif>
			</cfquery>
		<cfreturn posts />		
	</cffunction>

	<cffunction name="getPostType" returntype="String">
		<cfargument name="type" type="string">

			<cfquery name="q">
				select name from northern_aliweb.poststatus
				where status = <cfqueryparam value="#type#" cfsqltype="cf_sql_varchar">
			</cfquery>

			<cfreturn q.name />
	</cffunction>


	<cffunction name="questions" returntype="Query">
		<cfargument name="id" type="numeric" required="true">
		<cfargument name="type" type="string" required="false">			
			<cfquery name="q">
					select q.id, q.question , q.create_date, u.username, q.answered 
					from northern_aliweb.questions q, northern_aliweb.users u
					where q.userid = u.id
					<cfif id neq 0>
					and	q.id = <cfqueryparam value="#id#" cfsqltype="cf_sql_numeric">
					</cfif>
					<cfif isDefined("#type#")>
						and q.answered = <cfqueryparam value="#type#" cfsqltype="cf_sql_varchar">
					</cfif>
					order by q.id desc
			</cfquery>
		<cfreturn q />		
	</cffunction>

</cfcomponent>