<!DOCTYPE html>
<html lang="en">
<head>
	<!-- Required meta tags always come first -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>{$site_title}</title>

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
		<div class="container{if isset($is_admin)}-fluid{/if}">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand {if isset($is_home)}logo-hide{/if}" href="/"><img src="{$template}/images/logo-white-horisontal.png" alt="logo"/> </a>

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
					{if $is_logged}
						<li class="dropdown"><a href="#" data-target="#" class="dropdown-toggle" data-toggle="dropdown">Hello, @{$user['login']} <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="/userprofile/profile/{$user['id']}">Profile</a></li>

								<li class="divider"></li>
								<li><a href="/logout">Logout</a></li>
							</ul>
						</li>
					{else}
						<li><a href="/signup">Sign up</a></li>
						<li><a href="/signin">Log in</a></li>
					{/if}
				</ul>
			</div>
		</div>
	</div>
</header>