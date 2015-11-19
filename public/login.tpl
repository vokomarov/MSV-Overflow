{include file='header.tpl' site_title='Login - MSV overflow'}
<div class="container login-page">
    <div class="text-center heading">
        <h4>Log in to continue to  <img src="{$template}/images/logo-dark-horisontal.png" alt="MSV Overflow"/></h4>
    </div>
    <div class="">
        <div class="panel panel-default login-box">
            <div class="panel-body">
                {if isset($register)}
                <div class="alert alert-dismissable alert-success">
                    <button type="button" class="close" data-dismiss="alert">×</button>
                    <strong>Well done!</strong> You successfully registered. Now you can login with your new account.
                </div>
                {/if}

                {if isset($error)}
                    <div class="alert alert-dismissable alert-danger">
                        <button type="button" class="close" data-dismiss="alert">×</button>
                        <strong>Wrong access!</strong> Check your login or password.
                    </div>
                {/if}
                <form action="/auth/login" method="post">
                    <div class="form-group">
                        <input class="form-control floating-label input-lg" id="auth_login" name="login" type="text" placeholder="Login or Email">
                    </div>
                    <div class="form-group">
                        <input class="form-control floating-label input-lg" id="auth_password" name="password" type="password" placeholder="Password">
                        <p class="text-right"><a href="/login/forgot" class="forgot-password">forgot password?</a></p>
                        <p class="text-warning hidden forgot-password-notify">А голову ти свою не забув?</p>
                    </div>
                    <div class="form-group">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" checked="checked" name="remember"> Remember me forever
                        </div>
                    </div>
                    <input type="hidden" name="action" value="login">
                    <div class="form-group">
                        <a role="button" href="/" class="btn btn-default">Back</a>
                        <button type="submit" class="btn btn-primary pull-right">Log In</button>
                    </div>
                </form>
            </div>
        </div>

        <div class="panel panel-default login-box">
            <div class="panel-body text-center">
                <p>Don't have an account? <a href="/signup">Sign Up</a></p>
            </div>
        </div>
    </div>
</div>
{*
<div class="container padding-100">
    <div class="row">
        <div class="col-lg-3 col-md-3 col-lg-offset-4 col-md-offset-4">
            <h4 class="text-center">Log in</h4>
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
                        <div class="col-lg-10 col-lg-offset-2 text-right">
                            <button class="btn btn-default">Cancel</button>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </div>
                </fieldset>
            </form>
        </div>
    </div>
</div>
*}
{include file='footer.tpl'}