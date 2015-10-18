{include file='header.tpl' site_title='Dashboard'}

<div class="container admin-page">
	<div class="row">
		<div class="col-md-3">
			{include file='admin/menu.tpl'}
		</div>
		<div class="col-md-9">
			<div class="content {$current_method}">
				<ul class="breadcrumb">
					<li><a href="/">MSV overflow</a></li>
					{if isset($current_method)}
						<li><a href="/admin">{$current_controller|capitalize}</a></li>
						<li class="active">{$current_method|capitalize}</li>
					{else}
						<li class="active"><a href="/admin">{$current_controller|capitalize}</a></li>
					{/if}
				</ul>
				{block "content"}
					<h1>Welcome on admin</h1>
				{/block}
			</div>
		</div>
	</div>
</div>

{include file='footer.tpl'}