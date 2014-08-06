<cfinvoke component="controllers.Audible" method="getBlogPosts" returnvariable="blog" />
<cfinclude template="page_header.cfm">
	
	<div class="container">
<div class="hero-unit">
	
	<h1>Things I've written</h1>
	
</div>

<div class="row">
<div class="span12">

		<section id="blog">
		    <table class="table">

		    <cfoutput query="blog">
		    	<tr>
		    		<th>#blog.title#</th>
		    		<th>#left(blog.publisheddate,10)#</th>
		    	</tr>
		    	<tr>
		    		<td colspan="2">#blog.content#</td>
		    	</tr>

		    </cfoutput> 

		    </table>
	        
		</section>

	
		
	</div>
<cfinclude template="page_footer.cfm">
