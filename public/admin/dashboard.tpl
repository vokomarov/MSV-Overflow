{extends file="admin/index.tpl"}
{block name="content"}
	<h1>Коротка статистика</h1>

	<div class="row">
		<div class="col-md-9">
			<div class="panel panel-primary">
				<div class="panel-heading"><h4>Останні питання</h4></div>
				<div class="panel-body">
					<div class="list-group">
						<div class="list-group-item">
							<div class="row-action-primary">
								<i class="mdi-communication-live-help"></i>
							</div>
							<div class="row-content">
								<div class="least-content">10m ago</div>
								<h4 class="list-group-item-heading"><a href="/">How to connect Google API to Laravel</a></h4>
								<p class="list-group-item-text">Please help, i cannot connect google pi for laravel application</p>
							</div>
						</div>
						<div class="list-group-separator"></div>
						<div class="list-group-item">
							<div class="row-action-primary">
								<i class="mdi-communication-live-help"></i>
							</div>
							<div class="row-content">
								<div class="least-content">1h ago</div>
								<h4 class="list-group-item-heading"><a href="/">Directory index not work on my hosting</a></h4>
								<p class="list-group-item-text">Please help</p>
							</div>
						</div>
						<div class="list-group-separator"></div>
						<div class="list-group-item">
							<div class="row-action-primary">
								<i class="mdi-communication-live-help"></i>
							</div>
							<div class="row-content">
								<div class="least-content">yesterday</div>
								<h4 class="list-group-item-heading"><a href="/">My wordpress site has been hacked</a></h4>
								<p class="list-group-item-text">Some people hacked my site on shared hosting.</p>
							</div>
						</div>
						<div class="list-group-separator"></div>
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
				<div class="panel-heading"><h4>Популярні користувачі</h4></div>
				<div class="panel-body">
					<div class="list-group">
						<div class="list-group-item">
							<div class="row-picture">
								<img class="circle" src="http://lorempixel.com/56/56/people/1" alt="icon">
							</div>
							<div class="row-content">
								<h4 class="list-group-item-heading"> <a href="/">Jaber</a></h4>
								<p class="list-group-item-text">Загальна карма користувача - <span class="label label-info">56</span></p>
							</div>
						</div>
						<div class="list-group-separator"></div>
						<div class="list-group-item">
							<div class="row-picture">
								<img class="circle" src="http://lorempixel.com/56/56/people/6" alt="icon">
							</div>
							<div class="row-content">
								<h4 class="list-group-item-heading"> <a href="/"> SV Revizor</a></h4>
								<p class="list-group-item-text">Загальна карма користувача - <span class="label label-info">24</span></p>
							</div>
						</div>
						<div class="list-group-separator"></div>
						<div class="list-group-item">
							<div class="row-picture">
								<img class="circle" src="http://lorempixel.com/56/56/people/6" alt="icon">
							</div>
							<div class="row-content">
								<h4 class="list-group-item-heading"> <a href="/">VovanMS</a></h4>
								<p class="list-group-item-text">Загальна карма користувача - <span class="label label-info">16</span></p>
							</div>
						</div>
						<div class="list-group-separator"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-8">
			<div class="panel panel-primary">
				<div class="panel-heading"><h4>Останні відповіді</h4></div>
				<div class="panel-body">
					<div class="list-group">
						<div class="list-group-item">
							<div class="row-picture">
								<img class="circle" src="http://lorempixel.com/56/56/people/1" alt="icon">
							</div>
							<div class="row-content">
								<h4 class="list-group-item-heading"> <a href="/">Jaber</a> - <a href="/">How to connect Google API to Laravel</a></h4>
								<p class="list-group-item-text">I don't know, please contact to admin</p>
							</div>
						</div>
						<div class="list-group-separator"></div>
						<div class="list-group-item">
							<div class="row-picture">
								<img class="circle" src="http://lorempixel.com/56/56/people/6" alt="icon">
							</div>
							<div class="row-content">
								<h4 class="list-group-item-heading"> <a href="/"> SV Revizor</a> - <a href="/">Directory index not work on my hosting</a></h4>
								<p class="list-group-item-text">Go to google</p>
							</div>
						</div>
						<div class="list-group-separator"></div>
						<div class="list-group-item">
							<div class="row-picture">
								<img class="circle" src="http://lorempixel.com/56/56/people/6" alt="icon">
							</div>
							<div class="row-content">
								<h4 class="list-group-item-heading"> <a href="/">VovanMS</a> - <a href="/">My wordpress site has been hacked</a></h4>
								<p class="list-group-item-text">ахаха, лошара</p>
							</div>
						</div>
						<div class="list-group-separator"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="panel panel-info">
				<div class="panel-heading"><h4>Всього запитань</h4></div>
				<div class="panel-body">
					<p class="lead">987</p>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="panel panel-info">
				<div class="panel-heading"><h4>Всього відповідей</h4></div>
				<div class="panel-body">
					<p class="lead">4154</p>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="panel panel-info">
				<div class="panel-heading"><h4>Всього користувачів</h4></div>
				<div class="panel-body">
					<p class="lead">345</p>
				</div>
			</div>
		</div>
	</div>










{/block}