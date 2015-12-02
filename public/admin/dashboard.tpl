{extends file="admin/index.tpl"}
{block name="content"}
	<h1>Коротка статистика</h1>

	<div class="row">
		<div class="col-md-9">
			<div class="panel panel-primary">
				<div class="panel-heading"><h4>Last questions</h4></div>
				<div class="panel-body">
					<div class="list-group">
						{foreach from=$last_questions item=q}
							<div class="list-group-item">
								<div class="row-action-primary">
									<i class="mdi-communication-live-help"></i>
								</div>
								<div class="row-content">
									<div class="least-content">{$q.created_at}</div>
									<h4 class="list-group-item-heading"><a href="/question/{$q.id}">{$q.title|truncate:60:"...":false}</a></h4>
									<p class="list-group-item-text">{$q.content|truncate:60:"...":false}</p>
								</div>
							</div>
						{/foreach}
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-3">
			<div class="panel panel-success">
				<div class="panel-heading"><h4>Популярні категорії</h4></div>
				<div class="panel-body">
					<ul class="nav nav-pills nav-stacked">
						<li><a href="/">Java <span class="badge">340</span></a></li>
						<li><a href="/">PHP <span class="badge">156</span></a></li>
						<li><a href="/">HTML <span class="badge">104</span></a></li>
					</ul>
				</div>
			</div>
			<div class="panel panel-success">
				<div class="panel-heading"><h4>Популярні теги</h4></div>
				<div class="panel-body">
					<a href="/"><span class="label label-primary">Jaber</span></a>
					<a href="/"><span class="label label-primary">Java</span></a>
					<a href="/"><span class="label label-primary">tomcat</span></a>
					<a href="/"><span class="label label-primary">html</span></a>
					<a href="/"><span class="label label-primary">help</span></a>
					<a href="/"><span class="label label-primary">js</span></a>
					<a href="/"><span class="label label-primary">php</span></a>
					<a href="/"><span class="label label-primary">webstorm</span></a>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-4">
			<div class="panel panel-warning">
				<div class="panel-heading"><h4>Most popular users</h4></div>
				<div class="panel-body">
					<div class="list-group">
						{foreach from=$users item=u}
							<div class="list-group-item">
								<div class="row-picture">
									<img class="circle" src="{$template}/images/user-avatar.jpg" alt="icon">
								</div>
								<div class="row-content">
									<h4 class="list-group-item-heading"> <a href="/userprofile/{$u.id}">{$u.fname}</a></h4>
									<p class="list-group-item-text">Reputation - <span class="label label-info">{$u.karma}</span></p>
								</div>
							</div>
							<div class="list-group-separator"></div>
						{/foreach}
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-8">
			<div class="panel panel-primary">
				<div class="panel-heading"><h4>Last answers</h4></div>
				<div class="panel-body">
					<div class="list-group">
						{foreach from=$last_answers item=a}
							<div class="list-group-item">
								<div class="row-picture">
									<img class="circle" src="{$template}/images/user-avatar.jpg" alt="icon">
								</div>
								<div class="row-content">
									<h4 class="list-group-item-heading"> <a href="/userprofile/{$a.user_id}">Jaber</a> - <a href="/question/{$a.question_id}">{$a.content|truncate:30:"...":false}</a></h4>
									<p class="list-group-item-text">{$a.content|truncate:60:"...":false}</p>
								</div>
							</div>
						{/foreach}
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-4">
			<div class="panel panel-info">
				<div class="panel-heading"><h4>All questions count</h4></div>
				<div class="panel-body">
					<p class="lead">{$questions_count}</p>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="panel panel-info">
				<div class="panel-heading"><h4>All answers count</h4></div>
				<div class="panel-body">
					<p class="lead">{$answers_count}</p>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="panel panel-info">
				<div class="panel-heading"><h4>All users count</h4></div>
				<div class="panel-body">
					<p class="lead">{$users_count}</p>
				</div>
			</div>
		</div>
	</div>










{/block}