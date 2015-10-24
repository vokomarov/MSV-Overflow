{extends file="admin/index.tpl"}
{block name="content"}

	<h1>All users</h1>

	<div class="panel panel-default">
		<div class="panel-body">
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
				<tr>
					<td>1</td>
					<td>Volodymyr Komarov</td>
					<td>@vovanms</td>
					<td>vovikems@gmail.com</td>
					<td>Admin</td>
					<td>+4</td>
					<td>15.10.15 14:43</td>
					<td>
						<div class="btn-group">
							<a href="#" data-target="#" class="btn-xs btn btn-primary dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bars"></i></a>
							<ul class="dropdown-menu dropdown-menu-right">
								<li><a href="#"><i class="fa fa-pencil"></i> Edit</a></li>
								<li><a href="#"><i class="fa fa-trash-o"></i> Delete</a></li>
								<li class="divider"></li>
								<li><a href="#"><i class="fa fa-ban"></i> Ban user</a></li>
							</ul>
						</div>
					</td>
				</tr>
				<tr class="danger">
					<td>1</td>
					<td>Volodymyr Komarov</td>
					<td>@vovanms</td>
					<td>vovikems@gmail.com</td>
					<td>Banned</td>
					<td>+4</td>
					<td>15.10.15 14:43</td>
					<td>
						<div class="btn-group">
							<a href="#" data-target="#" class="btn-xs btn btn-primary dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bars"></i></a>
							<ul class="dropdown-menu dropdown-menu-right">
								<li><a href="#"><i class="fa fa-pencil"></i> Edit</a></li>
								<li><a href="#"><i class="fa fa-trash-o"></i> Delete</a></li>
								<li class="divider"></li>
								<li><a href="#"><i class="fa fa-ban"></i> Ban user</a></li>
							</ul>
						</div>
					</td>
				</tr>
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
		</div>
	</div>

{/block}