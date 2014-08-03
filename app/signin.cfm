<cfset app = true>
<cfinclude template="../page_header.cfm">

	
	<div class="container">
<div class="hero-unit">
	
	<h1>Audible Thoughts</h1>
	
</div>

<div class="row">
<div class="span7">

		<section id="eventHandlers">
		
		<p>
			

			<form action="index.cfm" method="post" class="form-control">
				<label for="loginId">Already registered? Login below with your username</label>
				<cfif isdefined("msg")>
					<div>
						<p><cfoutput><span class="btn btn-warning">#msg#</span></cfoutput></p>
					</div>
				</cfif>
				<input type="text" name="j_username" id="loginId" class="form-control" placeholder="Login" /><br>
				<label for="pwd">Password</label>
				<input type="password" name="j_password" id="pwd" class="form-control" placeholder="Password" /><br>
				
				<input type="submit" name="Submit" class="form-control btn" id="btnSubmit" value="Login to your area"/>
				
			</form>
		</p>
		</section>

	
		
	</div>


<div class="span2">
<h2>Not signed up?</h2>
<p><a class="btn btn-primary btn-lg" role="button" href="participantinfo.cfm">Information and sign up &raquo;</a></p>
</div>
<cfinclude template="page_footer.cfm">
