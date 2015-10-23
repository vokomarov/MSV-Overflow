<div class="navbar navbar-collapse navbar-responsive-collapse">
	<ul class="nav admin-menu">

		<li {if $current_controller == 'admin' && $current_method == 'index'}class="active"{/if}>
			<a href="/admin"><i class="fa fa-tachometer"></i> Dashboard</a>
		</li>

		<li {if $current_controller == 'question'}class="active"{/if}>
			<a href="/admin/question#new" class="badge">2</a>
			<a href="/admin/question"><i class="fa fa-question"></i> Questions</a>
		</li>

		<li class="dropdown {if $current_controller == 'user'}active{/if}">
			<a href="/admin/user" class="dropdown-toggle" data-toggle="dropdown" data-target="#"><i class="fa fa-user"></i> Users <span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="/admin/user"><i class="fa fa-list"></i> Show all users</a></li>
				<li><a href="/admin/user/add"><i class="fa fa-user-plus"></i> Add new user</a></li>
			</ul>
		</li>

		<li class="dropdown {if $current_controller == 'category'}active{/if}">
			<a href="/category" class="dropdown-toggle" data-toggle="dropdown" data-target="#"><i class="fa fa-list"></i> Categories <span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="/admin/category"><i class="fa fa-list"></i> Show all categories</a></li>
				<li><a href="/admin/category/add"><i class="fa fa-plus"></i> Add new category</a></li>
			</ul>
		</li>

		<li {if $current_method == 'setting'}class="active"{/if}>
			<a href="/admin/setting"><i class="fa fa-cog"></i> Settings</a>
		</li>

	</ul>
</div>