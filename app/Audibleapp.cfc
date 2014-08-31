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
		<cftry>
			<cfmail to="#application.adminEmail#" from="Audible Thoughts<user@audiblethoughts.co.uk>" subject="User created a story" type="html">
				<p>User #getAuthUser()# just saved a story but has yet to submit it.</p>
				
			</cfmail>
			<cfcatch type="any">
				<cflog file="AudibleLog" text="#cfcatch.message#">
			</cfcatch>
		</cftry>
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
		<cftry>
			<cfmail to="#application.adminEmail#" 
			
			from="Audible Thoughts<user@audiblethoughts.co.uk>" 
			subject="User asked a question" type="html">
				<p>User #getAuthUser()# just asked this:</p>
				<p>
				#question#
				</p>
			</cfmail>
			<cfcatch type="any">
				<cflog file="AudibleLog" text="#cfcatch.message#">
			</cfcatch>
		</cftry>
		</cffunction>

	<cffunction name="editpost" returntype="String">
		<cfargument name="content">
		<cfargument name="formAction">
		<cfargument name="postId">
		<cfargument name="initialpost" default="false">
		
		<cfset var action =''/>
			<cfswitch expression="#formAction#">
				<cfcase value="include">
					<cfset updatePost(postId, content, 'R', initialpost) />
					<cfset action = 'submitting' />
				</cfcase>
				<cfcase value="includenow">
					<cfset updatePost(postId, ' ', 'R', initialpost) />
					<cfset action = 'submitting' />
				</cfcase>
				<cfcase value="save">
					<cfset updatePost(postId, content, 'E', initialpost) />
					<cfset action = 'editing' />
				</cfcase>
				<cfcase value="delete">
					<cfset deletePost(postId) />
					<cfset action = 'deleting' />
				</cfcase>
				<cfdefaultcase>
					<cfset action = ''>	
				</cfdefaultcase>
			</cfswitch>
		
				
			<cfif formAction eq 'include'>
				<cftry>
					<cfmail to="#application.adminEmail#" from="Audible Thoughts<user@audiblethoughts.co.uk>" subject="User submitted their story" type="html">
						<p>User #getAuthUser()# just submitted their story.</p>
						<p>
						#content#
						</p>
					</cfmail>
					<cfcatch type="any">
						<cflog file="AudibleLog" text="#cfcatch.message#">
					</cfcatch>
				</cftry>
			</cfif>

			<cfif formAction eq 'includenow'>
				<cfset var thisContent = userPosts(getAuthUser(), postId)>
					<cftry>
					<cfmail to="#application.adminEmail#" from="Audible Thoughts<user@audiblethoughts.co.uk>" subject="User submitted their story" type="html">
						<p>User #getAuthUser()# just submitted their story (without further editing).</p>
						<p>
						#thisContent.content#
						</p>
					</cfmail>
					<cfcatch type="any">
						<cflog file="AudibleLog" text="#cfcatch.message#">
					</cfcatch>
				</cftry>
			</cfif>
		<cfreturn action />
	</cffunction>

	<cffunction name="updatePost" returntype="void">
		<cfargument name="postId">
		<cfargument name="content">
		<cfargument name="showpost">
		<cfargument name="initialpost" >

		<cfquery name="q">
			update northern_aliweb.posts 
				set showpost = <cfqueryparam value="#showpost#" cfsqltype="cf_sql_varchar">
					<cfif initialpost eq false>
						,content = <cfqueryparam value="#content#" cfsqltype="cf_sql_varchar">	
					</cfif>
				
				where userid = <cfqueryparam value="#getThisUserId(getAuthUser())#" cfsqltype="cf_sql_numeric">
				and id = <cfqueryparam value="#postId#" cfsqltype="cf_sql_numeric">
				
		</cfquery>
	</cffunction>

	<cffunction name="deletePost" returntype="void">
		<cfargument name="postId">

		<cfquery name="q">
			delete from northern_aliweb.posts where id = <cfqueryparam value="#postId#" cfsqltype="cf_sql_numeric">
				and userid = <cfqueryparam value="#getThisUserId(getAuthUser())#" cfsqltype="cf_sql_numeric">
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
		<cftry>
			<cfmail to="#application.adminEmail#" from="Audible Thoughts<user@audiblethoughts.co.uk>" subject="User withdrew from study" type="html">
				<p>User #getAuthUser()# just withdrew from the study and all their content has been deleted.</p>
				
			</cfmail>
			<cfcatch type="any">
				<cflog file="AudibleLog" text="#cfcatch.message#">
			</cfcatch>
		</cftry>
	</cffunction>

	<cffunction name="registerForSummary" returntype="String">
		<cfargument name="registeredEmail" type="string">
		<cfif isValid("email", registeredEmail)>
			<cfquery name="checkDuplicate">
				select email from registeredemails where email = <cfqueryparam value="#registeredEmail#" cfsqltype="cf_sql_varchar">
			</cfquery>
			<cfif checkDuplicate.recordcount eq 0>
				<cfquery name="q">
				insert into northern_aliweb.registeredemails (email, create_date)
				 VALUES (<cfqueryparam value="#registeredEmail#" cfsqltype="cf_sql_varchar">,
				 	<cfqueryparam value="#Now()#" cfsqltype="cf_sql_date">)
				</cfquery>
				<cfset var result = 'Email address registered' />
			<cfelse>
				<cfset var result = 'Duplicated email address' />
			</cfif>
			

		<cfelse>
			<cfset var result = 'Invalid email address' />
		</cfif>
		<cfreturn result />
	</cffunction>
</cfcomponent>