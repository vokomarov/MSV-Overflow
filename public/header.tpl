<!DOCTYPE html>
<html lang="en">
<head>
	<!-- Required meta tags always come first -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>MSV overflow</title>

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="{$template}/bootstrap/css/bootstrap.min.css">

	<!-- Material Design for Bootstrap -->
	<link rel="stylesheet" href="{$template}/bootstrap-material-design/css/roboto.min.css">
	<link rel="stylesheet" href="{$template}/bootstrap-material-design/css/material-fullpalette.min.css">
	<link rel="stylesheet" href="{$template}/bootstrap-material-design/css/ripples.min.css">

	<link rel="stylesheet" href="{$template}/css/font-awesome.min.css">
	<link rel="stylesheet" href="{$template}/css/styles.css">

</head>
<body>
<header class="header">
	<div class="navbar navbar-default">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				{if !isset($is_home)}
					<a class="navbar-brand" href="/"><img src="{$template}/images/logo-white-horisontal.png" alt="logo"/> </a>
				{/if}
			</div>
			<div class="navbar-collapse collapse navbar-responsive-collapse">
				<ul class="nav navbar-nav navbar-left">
					<li>
						<form class="navbar-form navbar-left" action="/search" method="POST">
							<input type="text" class="form-control col-lg-8" placeholder="Search">
						</form>
					</li>
					<li class="dropdown">
						<a href="#" data-target="#" class="dropdown-toggle" data-toggle="dropdown">Help<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="javascript:void(0)">Action</a></li>
							<li><a href="javascript:void(0)">Another action</a></li>
							<li><a href="javascript:void(0)">Something else here</a></li>
							<li class="divider"></li>
							<li><a href="javascript:void(0)">Separated link</a></li>
						</ul>
					</li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="/signup">Sign up</a></li>
					<li><a href="/login">Log in</a></li>
				</ul>
			</div>
		</div>
	</div>
</header>