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
    <div class="navbar navbar-default">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="javascript:void(0)">Brand</a>
        </div>
        <div class="navbar-collapse collapse navbar-responsive-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="javascript:void(0)">Active</a></li>
                <li><a href="javascript:void(0)">Link</a></li>
                <li class="dropdown">
                    <a href="bootstrap-elements.html" data-target="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="javascript:void(0)">Action</a></li>
                        <li><a href="javascript:void(0)">Another action</a></li>
                        <li><a href="javascript:void(0)">Something else here</a></li>
                        <li class="divider"></li>
                        <li class="dropdown-header">Dropdown header</li>
                        <li><a href="javascript:void(0)">Separated link</a></li>
                        <li><a href="javascript:void(0)">One more separated link</a></li>
                    </ul>
                </li>
            </ul>
            <form class="navbar-form navbar-left">
                <input type="text" class="form-control col-lg-8" placeholder="Search">
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="javascript:void(0)">Link</a></li>
                <li class="dropdown">
                    <a href="bootstrap-elements.html" data-target="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="javascript:void(0)">Action</a></li>
                        <li><a href="javascript:void(0)">Another action</a></li>
                        <li><a href="javascript:void(0)">Something else here</a></li>
                        <li class="divider"></li>
                        <li><a href="javascript:void(0)">Separated link</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>

<!-- jQuery first, then Bootstrap JS. -->
<script src="{$template}/js/jquery.min.js"></script>
<script src="{$template}/bootstrap/js/bootstrap.min.js"></script>
<script src="{$template}/js/system.js"></script>
<script src="{$template}/js/app.js"></script>

<!-- Material Design for Bootstrap -->
<script src="{$template}/bootstrap-material-design/js/material.min.js"></script>
<script src="{$template}/bootstrap-material-design/js/ripples.min.js"></script>
<script>
        $.material.init();
</script>

</body>
</html>