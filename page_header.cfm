<!DOCTYPE html>
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<title>Audible Thoughts</title>
	<meta name="description" content="PhD Research into mental health">
    <meta name="author" content="The Northern Union Ltd">
	
	
	<cfif isdefined("app")>
		<cfset filePrefix = '../'>
	<cfelse>
		<cfset filePrefix = ''>
	</cfif>
	<cfoutput>
	<link rel="icon" type="image/png" href="#fileprefix#aticon.png" />
	<link href="#filePrefix#assets/bootstrap.css" rel="stylesheet">
	<link href="#filePrefix#assets/bootstrap-responsive.css" rel="stylesheet">
 	<link href='http://fonts.googleapis.com/css?family=Nothing+You+Could+Do' rel='stylesheet' type='text/css'> 
    <script src="#filePrefix#assets/jquery.js"></script>
	<script src="#filePrefix#assets/bootstrap.js"></script>
	<link href="#filePrefix#assets/at.css" rel="stylesheet" type="text/css">
	</cfoutput>
	<style>
	 /* Utility */
	.centered { text-align: center !important; }
	.inline{ display: inline !important; }
	.margin10{ margin: 10px; }
	.padding10{ padding: 10px; }
	.margin0{ margin: 0px; }
	.padding0{ padding: 0px; }
	.footer {
	  margin-top: 45px;
	  padding: 35px 35px;
	  border-top: 1px solid #e5e5e5;
	}
	.footer p {
	  margin-bottom: 0;
	  color: #555;
	}
	body{ padding-top: 50px; }

	h1, .brand {font-family: 'Nothing You Could Do', sans-serif;}

	li, h3 {}

	.hero-unit {
		background-color: #DBDBFF;
	}

	#hidey {
		display: none;
	}

	.float-left {float: left;}

	.clear {clear: both;}

	
	.ajax-target {
		float: left;
		font-weight: bold;
		margin: 5px 0 0 25px;
	}
	</style>
	
</head>
<body data-spy="scroll">
	
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			
			<div class="container">
				<cfoutput>
		<!---		<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
		            <span class="icon-bar"></span>
		            <span class="icon-bar"></span>
		            <span class="icon-bar"></span>
		        </a> --->
				
				<a class="brand" href="index.cfm"><strong>Audible Thoughts</strong></a>

				
				<ul class="nav pull-right">
					<li class="dropdown">
						<a href="##" class="dropdown-toggle" data-toggle="dropdown">
							<i class="icon-info-sign icon-white"></i> Menu <b class="caret"></b>
						</a>
						<ul id="actions-submenu" class="dropdown-menu">
							 		<li><a href="#fileprefix#index.cfm">Audible Thoughts homepage</a></li>
									<cfif isdefined("app")>
										<li><a href="index.cfm">Your homepage</a></li>
										<li><a href="logout.cfm">Log out</a></li>
									<cfelse>
										<li><a href="app/">Your homepage</li>
									</cfif>
							 		
									<li><a href="#filePrefix#about.cfm">Researcher</a></li>
								
									<li><a href="#filePrefix#contact.cfm">Contact</a></li>
									<li><a href="#fileprefix#participantinfo.cfm">About the research</a></li>
						</ul>
					</li>
				</ul>
				</cfoutput>
			</div> 
		</div> 
	</div> 

	