{extends file="admin/index.tpl"}

{block name="content"}

	<h1>{$user['fname']} (@{$user['login']})</h1>
	<div class="panel panel-default">
		<div class="panel-body">
			{if isset($allow_edit)}
			<a href="#edit-info" class="btn btn-primary edit-user pull-right"><i class="fa fa-pencil"></i> Edit info</a>
			{/if}
			<h3 class="pull-left">User @{$user['login']} detail info</h3>
			<div class="clearfix"></div>
			<hr>
			<div class="admin-tabs">
				{if isset($allow_edit)}
				<div {if isset($edit)}class="active"{/if}>
					<form action="/admin/user/{$user['id']}/edit" method="POST">
						<fieldset>
							<legend>Please, fill require field</legend>

							{if isset($error)}
								<div class="alert alert-dismissable alert-warning">
									<button type="button" class="close" data-dismiss="alert">×</button>
									<h4>Error!</h4>
									<p>{$error}</p>
								</div>
							{/if}

							<div class="row form-group">
								<div class="col-lg-offset-1 col-lg-2">
									<label for="fname" class="control-label">Display name</label>
								</div>
								<div class="col-lg-3">
									<input type="text" class="form-control floating-label" name="name" id="name" placeholder="First name" value="{$user['fname']}">
								</div>
							</div>

							<div class="row form-group">
								<div class="col-lg-offset-1 col-lg-2">
									<label for="login" class="control-label">Login <span class="text-danger">*</span></label>
								</div>
								<div class="col-lg-3 ">
									<input type="text" class="form-control floating-label" name="login" id="login" placeholder="Login" required value="{$user['login']}" disabled>
								</div>
							</div>

							<div class="row form-group">
								<div class="col-lg-offset-1 col-lg-2">
									<label for="email" class="control-label">Email <span class="text-danger">*</span></label>
								</div>
								<div class="col-lg-3">
									<input type="email" class="form-control floating-label no-check" name="email" id="email" placeholder="Email" required value="{$user['email']}">
								</div>
							</div>

							<div class="row form-group">
								<div class="col-lg-offset-1 col-lg-2">
									<label for="password" class="control-label">New password <span class="text-danger">*</span></label>
								</div>
								<div class="col-lg-3">
									<input type="password" class="form-control floating-label" name="password" id="password" placeholder="Password">
								</div>
							</div>

							<div class="row form-group">
								<div class="col-lg-offset-1 col-lg-2">
									<label for="confirm_password" class="control-label">Confirm new password <span class="text-danger">*</span></label>
								</div>
								<div class="col-lg-3">
									<input type="password" class="form-control floating-label" name="cpassword" id="confirm_password" placeholder="Confirm password">
								</div>
							</div>

							<div class="row form-group">
								<div class="col-lg-offset-1 col-lg-2">
									<label for="group" class="control-label">Group</label>
								</div>
								<div class="col-lg-3">
									<select class="form-control" id="group" name="group">
										<option {if $user['group'] == 1}selected{/if} value="1">Admin</option>
										<option {if $user['group'] == 2}selected{/if} value="2">Moderator</option>
										<option {if $user['group'] == 3}selected{/if} value="3">User</option>
										<option {if $user['group'] == 4}selected{/if} value="4">Banned</option>
									</select>
								</div>
							</div>
							<input type="hidden" name="action" value="update">
							<div class="row form-group">
								<div class="col-lg-3">
									<button class="btn btn-default" onclick="history.go(-1);">Back</button>
								</div>
								<div class="col-lg-9">
									<button type="submit" class="btn btn-primary">Save</button>
								</div>
							</div>

						</fieldset>
					</form>
				</div>
				{/if}
				<div {if !isset($edit)}class="active"{/if}>
					<div class="row">
						<div class="col-lg-2 text-right">
							<p><b>Display name:</b></p>
						</div>
						<div class="col-lg-3">
							<p>{$user['fname']}</p>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-2 text-right">
							<p><b>User login:</b></p>
						</div>
						<div class="col-lg-3">
							<p>{$user['login']}</p>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-2 text-right">
							<p><b>Contact email:</b></p>
						</div>
						<div class="col-lg-3">
							<p><a href="mailto:{$user['email']}">{$user['email']}</a></p>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-2 text-right">
							<p><b>Group:</b></p>
						</div>
						<div class="col-lg-3">
							<p>{$group[$user['group']]}</p>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-2 text-right">
							<p><b>Rating (karma):</b></p>
						</div>
						<div class="col-lg-3">
							<p>{$user['karma']}</p>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-2 text-right">
							<p><b>Questions added count:</b></p>
						</div>
						<div class="col-lg-3">
							<p>0</p>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-2 text-right">
							<p><b>Questions answered count:</b></p>
						</div>
						<div class="col-lg-3">
							<p>0</p>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-2 text-right">
							<p><b>Questions best answered count:</b></p>
						</div>
						<div class="col-lg-3">
							<p>0</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

{/block}