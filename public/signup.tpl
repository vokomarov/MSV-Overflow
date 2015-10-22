{include file='header.tpl' site_title='Sign up - MSV overflow'}

<div class="container login-page">
    <div class="text-center heading">
        <h4>Sign up to continue to  <img src="{$template}/images/logo-dark-horisontal.png" alt="MSV Overflow"/></h4>
    </div>
    <div class="">
        <div class="panel panel-default login-box">
            <div class="panel-body">
                <form action="#" method="post">
                    <div class="form-group">
                        <input class="form-control floating-label input-lg" id="name" name="name" type="text" placeholder="Display name" data-hint="Vasya K.">
                    </div>
                    <div class="form-group">
                        <input class="form-control floating-label input-lg" id="login" name="login" type="text" placeholder="Login" data-hint="Please, type only a-A, 0-9 and - characters">
                    </div>
                    <div class="form-group">
                        <input class="form-control floating-label input-lg" id="email" name="email" type="email" placeholder="Email" data-hint="help-me@msv.ua">
                    </div>
                    <div class="form-group">
                        <input class="form-control floating-label input-lg" id="password" name="password" type="password" placeholder="Password" data-hint="Don't worry, We don't see your password, maybe :)">
                    </div>
                    <div class="form-group">
                        <input class="form-control floating-label input-lg" id="cpassword" name="cpassword" type="password" placeholder="Confirm password" data-hint="Input password from previous field again">
                    </div>
                    <div class="form-group">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" checked="checked"> Я погоджуюсь, в разі потреби, передати свою печінку у власність MSV Overflow
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <a role="button" href="/" class="btn btn-default">Back</a>
                        <button type="submit" class="btn btn-primary pull-right">Sign Up</button>
                    </div>
                    <div class="clear"></div>
                </form>
                <p class="text-center">By registering, you don't agree to Terms of Use and Rrivacy Policy</p>
            </div>
        </div>

        <div class="panel panel-default login-box">
            <div class="panel-body text-center">
                <p>Already have an account? <a href="/login">Log in</a></p>
            </div>
        </div>
    </div>


{*
    <div class="row padding-15">
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
                <p>Already have an account? <a href="/login">Log in</a></p>
            </div>
        </div>
    </div>
    *}
</div>
{include file='footer.tpl'}