{extends file="admin/index.tpl"}
{block name="content"}
	<h1>All categories</h1>
	<div class="panel panel-default">
		<div class="panel-body">
			{if $categories && count($categories) > 0}
				<table class="table table-striped table-hover ">
					<thead>
					<tr>
						<th>Id</th>
						<th>Name</th>
						<th>Slug</th>
						<th>Parent Id</th>
						<th>Action</th>
					</tr>
					</thead>
					<tbody>
					{foreach from=$categories item=cat}
						<tr>
							<td><a href="/admin/category/{$cat['id']}/edit">{$cat['id']}</a></td>
							<td><a href="/admin/category/{$cat['id']}/edit">{$cat['name']}</a></td>
							<td><a href="/admin/category/{$cat['id']}/edit">{$cat['slug']}</a></td>
							<td><a href="/admin/category/{$cat['id']}/edit">{$cat['parent_id']}</a></td>
							<td>
								<div class="btn-group">
									<a href="#" data-target="#" class="btn-xs btn btn-primary dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bars"></i></a>
									<ul class="dropdown-menu dropdown-menu-right">
										<li><a href="/admin/category/{$cat['id']}/edit"><i class="fa fa-pencil"></i> Edit</a></li>
										<li><a href="/admin/category/{$cat['id']}/delete"><i class="fa fa-trash-o"></i> Delete</a></li>
									</ul>
								</div>
							</td>
						</tr>
					{/foreach}

					</tbody>
				</table>
			{else}
				<div class="alert alert-dismissible alert-info">
					<button type="button" class="close" data-dismiss="alert">×</button>
					<strong>Something happens with categories!</strong> Всьо прапала, шеф, всьо прапалааа!
				</div>
			{/if}
		</div>
	</div>
{/block}