<div class="navbar navbar-collapse navbar-responsive-collapse">
	<ul class="nav admin-menu">

		{is_group groups="1,2"}
		<li {if $current_controller == 'admin' && $current_method == 'index'}class="active"{/if}>
			<a href="/admin"><i class="fa fa-tachometer"></i> Dashboard</a>
		</li>
		{/is_group}

		{is_group groups="1,2"}
		<li {if $current_controller == 'question'}class="active"{/if}>
			<a href="/admin/question#new" class="badge">2</a>
			<a href="/admin/question"><i class="fa fa-question"></i> Questions</a>
		</li>
		{/is_group}

		<li class="dropdown {if $current_controller == 'user'}active{/if}">
			<a href="/admin/user" class="dropdown-toggle" data-toggle="dropdown" data-target="#"><i class="fa fa-user"></i> Users <span class="caret"></span></a>
			{is_group groups="1,2"}
			<ul class="dropdown-menu">
				<li><a href="/admin/user"><i class="fa fa-list"></i> Show all users</a></li>
				<li><a href="/admin/user/add"><i class="fa fa-user-plus"></i> Add new user</a></li>
			</ul>
			{/is_group}
		</li>

		{is_group groups="1"}
		<li {if $current_method == 'setting'}class="active"{/if}>
			<a href="/admin/setting"><i class="fa fa-cog"></i> Settings</a>
		</li>
		{/is_group}

	</ul>
</div>