{include file='header.tpl' site_title='Dashboard'}

<div class="container-fluid admin-page">
	<div class="row">
		<div class="col-md-2">
			{include file='admin/menu.tpl'}
		</div>
		<div class="col-md-10">
			<div class="content admin-content {$current_method}">
				<ul class="breadcrumb">
					<li><a href="/">MSV overflow</a></li>
					{if isset($current_method) && $current_method != 'index'}
						<li><a href="/admin">
								{if isset($menu[$current_controller])}
									{$menu[$current_controller]|capitalize}
								{else}
									{$current_controller|capitalize}
								{/if}
							</a></li>
						<li class="active">
							{if isset($menu[$current_method])}
								{$menu[$current_method]|capitalize}
							{else}
								{$current_method|capitalize}
							{/if}
						</li>
					{else}
						<li class="active"><a href="/admin">
								{if isset($menu[$current_controller])}
									{$menu[$current_controller]|capitalize}
								{else}
									{$current_controller|capitalize}
								{/if}
							</a></li>
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