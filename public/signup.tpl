<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags always come first -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Login</title>

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
<div class="container padding-100">
    <div class="row">
        <div class="col-lg-3 col-md-3 col-lg-offset-4 col-md-offset-4">
            <h4 class="text-center">Sign up to continue to</h4>
        </div>
        <div class="col-lg-1 col-md-1">
            <img class="login-logo" src="{$template}/images/logo.png" alt="logo"/>
        </div>
    </div>
    <div  class="row padding-15">
        <div class="col-lg-4 col-md-4 col-lg-offset-4 col-md-offset-4">
            <form class="form-horizontal">
                <fieldset>
                    <div class="form-group">
                        <label for="inputName" class="col-lg-3 control-label text-left">Name</label>
                        <div class="col-lg-9">
                            <input type="text" class="form-control" id="inputName" placeholder="Name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail" class="col-lg-3 text-left control-label">Email</label>
                        <div class="col-lg-9">
                            <input type="email" class="form-control" id="inputEmail" placeholder="Email">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword" class="col-lg-3 text-left control-label">Password</label>
                        <div class="col-lg-9">
                            <input type="password" class="form-control" id="inputPassword" placeholder="********">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="confirmPassword" class="col-lg-3 text-left control-label">Confirm Password</label>
                        <div class="col-lg-9 top-offset-15">
                            <input type="password" class="form-control" id="confirmPassword" placeholder="********">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-10 col-lg-offset-2 text-right">
                            <button class="btn btn-default">Cancel</button>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </div>
                </fieldset>
            </form>
        </div>
    </div>
    <div class="row padding-15">
        <div class="col-lg-4 col-md-4 col-lg-offset-4 col-md-offset-4">
            <div class="switch text-center">
                <p>Already have an account? <a href="{$base}index.php/login">Log in</a></p>
            </div>
        </div>
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