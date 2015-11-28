{extends file="admin/index.tpl"}
{block name="content"}

	<h1>All users</h1>

	<div class="panel panel-default">
		<div class="panel-body">
			{if $users && count($users) > 0}
			<table class="table table-striped table-hover ">
				<thead>
				<tr>
					<th>Id</th>
					<th>Name</th>
					<th>Login</th>
					<th>Email</th>
					<th>Group</th>
					<th>Rating</th>
					<th>Registered at</th>
					<th>Action</th>
				</tr>
				</thead>
				<tbody>
					{foreach from=$users item=user}
						<tr>
							<td><a href="/admin/user/{$user['id']}">{$user['id']}</a></td>
							<td><a href="/admin/user/{$user['id']}">{$user['fname']}</a></td>
							<td><a href="/admin/user/{$user['id']}">@{$user['login']}
									{if $user['group']=='4'}
										<span class="label label-warning">Banned</span>
									{/if}
								</a></td>
							<td><a href="/admin/user/{$user['id']}">{$user['email']}</a></td>
							<td><a href="/admin/user/{$user['id']}">{$group[$user['group']]}</a></td>
							<td>{if $user['karma'] > 0}
									+
								{elseif $user['karma'] < 0}
									-
								{/if}
								{$user['karma']}
							</td>
							<td><a href="/admin/user/{$user['id']}">{$user['created_at']}</a></td>
							<td>
								<div class="btn-group">
									<a href="#" data-target="#" class="btn-xs btn btn-primary dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bars"></i></a>
									<ul class="dropdown-menu dropdown-menu-right">
										<li><a href="/admin/user/{$user['id']}/edit"><i class="fa fa-pencil"></i> Edit</a></li>
										<li><a href="/admin/user/{$user['id']}/delete"><i class="fa fa-trash-o"></i> Delete</a></li>
										<li class="divider"></li>
										{if $user['group']=='4'}
											<li><a href="/admin/user/{$user['id']}/unban"><i class="fa fa-ban"></i> Unban user</a></li>
										{else}
											<li><a href="/admin/user/{$user['id']}/ban"><i class="fa fa-ban"></i> Ban user</a></li>
										{/if}

									</ul>
								</div>
							</td>
						</tr>
					{/foreach}

				</tbody>
			</table>

			<ul class="pagination">
				<li class="disabled"><a href="/">«</a></li>
				<li class="active"><a href="/">1</a></li>
				<li><a href="/">2</a></li>
				<li><a href="/">3</a></li>
				<li><a href="/">4</a></li>
				<li><a href="/">5</a></li>
				<li><a href="/">»</a></li>
			</ul>
			{else}
				<div class="alert alert-dismissible alert-info">
					<button type="button" class="close" data-dismiss="alert">×</button>
					<strong>Something happens with users!</strong> Всьо прапала, шеф, всьо прапалааа!
				</div>
			{/if}
		</div>
	</div>

{/block}