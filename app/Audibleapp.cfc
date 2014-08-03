<cfcomponent>
	
	<cffunction name="userPosts" returntype="Query">
		<cfargument name="thisusername" >
		<cfargument name="postId" default="-1">
			<cfquery name="posts">
				select p.id, p.content, p.showpost, p.create_date
				from northern_aliweb.posts p, northern_aliweb.users u
				where p.userid = u.id
				and u.username = <cfqueryparam value="#thisusername#" cfsqltype="cf_sql_varchar">
				<cfif postId neq -1>
					and p.id = <cfqueryparam value="#postId#" cfsqltype="cf_sql_numeric">
				</cfif>
			</cfquery>

			<cfreturn posts />
	</cffunction>

	<cffunction name="userQuestions" returntype="Query">
		<cfargument name="thisusername" >
		<cfargument name="questionId" default="-1">
			<cfquery name="qs">
				select q.id, q.question, q.answer, q.answered, q.create_date, u.username
				from northern_aliweb.questions q, northern_aliweb.users u
				where q.userid = u.id
				and u.username = <cfqueryparam value="#thisusername#" cfsqltype="cf_sql_varchar">
				<cfif questionId neq -1>
					and q.id = <cfqueryparam value="#questionId#" cfsqltype="cf_sql_numeric">
				</cfif>
			</cfquery>

			<cfreturn qs />
	</cffunction>

	<cffunction name="homequeries" returntype="Struct">
		<cfargument name="thisusername" >
			<cfset var loc = {} />
			<cfset loc.posts = userPosts(thisusername) />
			<cfset loc.questions = userQuestions(thisusername) />

			<cfreturn loc />

	</cffunction>

	<cffunction name="submitpost" returntype="Numeric">
		<cfargument name="content">

		<cfquery name="q">
			insert into northern_aliweb.posts (content, userid, create_date, showpost) VALUES (
				<cfqueryparam value="#content#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#getThisUserId(getAuthUser())#" cfsqltype="cf_sql_numeric">,
				<cfqueryparam value="#now()#" cfsqltype="cf_sql_date">,
				'E'
				)
		</cfquery>
		<cfquery name="id">
			select max(id) id from northern_aliweb.posts 
			where content = <cfqueryparam value="#content#" cfsqltype="cf_sql_varchar">
			and userid = <cfqueryparam value="#getThisUserId(getAuthUser())#" cfsqltype="cf_sql_numeric">
		</cfquery>

		<cfreturn id.id />
	</cffunction>

	<cffunction name="submitquestion" >
		<cfargument name="question">

		<cfquery name="q">
			insert into northern_aliweb.questions (question, answered, userid, create_date) VALUES (
				<cfqueryparam value="#question#" cfsqltype="cf_sql_varchar">,
				'N',
				<cfqueryparam value="#getThisUserId(getAuthUser())#" cfsqltype="cf_sql_numeric">,
				<cfqueryparam value="#now()#" cfsqltype="cf_sql_date">
				)
		</cfquery>

		</cffunction>

	<cffunction name="editpost">
		<cfargument name="content">
		<cfargument name="formAction">
		<cfargument name="postId">
		<cfargument name="initialpost" default="false">

			<cfswitch expression="#formAction#">
				<cfcase value="include">
					<cfset var showpost = 'R'>			
				</cfcase>
				<cfcase value="save">
					<cfset var showpost = 'E'>			
				</cfcase>
				<cfcase value="delete">
					<cfset var showpost = 'N'>			
				</cfcase>
				<cfcase value="approve">
					<cfset var showpost = 'Y'>			
				</cfcase>
				<cfdefaultcase>
					<cfset var showpost = 'E'>	
				</cfdefaultcase>
			</cfswitch>
		<cfquery name="q">
			update northern_aliweb.posts 
				set showpost = <cfqueryparam value="#showpost#" cfsqltype="cf_sql_varchar">
				<cfif showpost neq 'N'>
					<cfif initialpost eq false>
						,content = <cfqueryparam value="#content#" cfsqltype="cf_sql_varchar">	
					</cfif>
				</cfif>
				where userid = <cfqueryparam value="#getThisUserId(getAuthUser())#" cfsqltype="cf_sql_numeric">
				and id = <cfqueryparam value="#postId#" cfsqltype="cf_sql_numeric">
				
		</cfquery>


	</cffunction>


	<cffunction name="getThisUserId" returntype="Numeric">
		<cfargument name="thisuser" type="string">

		<cfquery name="q">
			select id from northern_aliweb.users where username = <cfqueryparam value="#thisuser#" cfsqltype="cf_sql_varchar">
		</cfquery>

		<cfreturn q.id />
	</cffunction>

	<cffunction name="thisStatus" returntype="String">
		<cfargument name="showpost" type="string" required="true">

		<cfquery name="q" >
			select name from northern_aliweb.poststatus
			where status = <cfqueryparam value="#showpost#" cfsqltype="cf_sql_varchar">
		</cfquery>
		<cfreturn q.name />
	</cffunction>


	<cffunction name="deleteuser">
		<cfset var thisUser = getThisUserId(getAuthUser()) />

		<cfquery name="removeQuestions">
			delete from northern_aliweb.questions where userid = <cfqueryparam value="#thisUser#" cfsqltype="cf_sql_numeric">
		</cfquery>
		<cfquery name="removePosts">
			delete from northern_aliweb.posts where userid = <cfqueryparam value="#thisUser#" cfsqltype="cf_sql_numeric">
		</cfquery>
		<cfquery name="removeUser">
			delete from northern_aliweb.users where id = <cfqueryparam value="#thisUser#" cfsqltype="cf_sql_numeric">
		</cfquery>
	</cffunction>

</cfcomponent>