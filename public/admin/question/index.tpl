{extends file="admin/index.tpl"}
{block name="content"}

	<h1>Questions</h1>

	<ul class="nav nav-tabs">
		<li class="active"><a href="#all" data-toggle="tab">All</a></li>
		<li><a href="#open" data-toggle="tab">Open</a></li>
		<li><a href="#solved" data-toggle="tab">Solved</a></li>
		<li><a href="#closed" data-toggle="tab">Closed</a></li>

	</ul>
	<div id="myTabContent" class="tab-content">
		<div class="tab-pane fade active in" id="all">

			<div class="panel panel-default">
				<div class="panel-body">

					<h2>All question</h2>

					<div class="list-group">

						<div class="list-group-item">
							<div class="row-action-primary">
								<i class="mdi-communication-live-help"></i>
							</div>
							<div class="row-content">
								<div class="least-content">15m ago <br>
									<div class="btn-group">
										<a href="#" data-target="#" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bars"></i></a>
										<ul class="dropdown-menu dropdown-menu-right">
											<li><a href="#">Edit</a></li>
											<li><a href="#">Delete</a></li>
											<li class="divider"></li>
											<li><a href="#">Open</a></li>
											<li><a href="#">Close</a></li>
											<li><a href="#">Solve</a></li>
										</ul>
									</div>
								</div>
								<h4 class="list-group-item-heading">
									<span class="label label-info">open</span>
									<a href="/admin/question/edit/5">Tile with a label</a>
									<a href="/"><i class="fa fa-external-link"></i></a></h4>
								<p class="list-group-item-text">Donec id elit non mi porta gravida at eget metus.</p>
							</div>
						</div>
						<div class="list-group-separator"></div>
						<div class="list-group-item">
							<div class="row-action-primary">
								<i class="mdi-communication-live-help"></i>
							</div>
							<div class="row-content">
								<div class="least-content">15m ago <br>
									<div class="btn-group">
										<a href="#" data-target="#" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bars"></i></a>
										<ul class="dropdown-menu dropdown-menu-right">
											<li><a href="#">Edit</a></li>
											<li><a href="#">Delete</a></li>
											<li class="divider"></li>
											<li><a href="#">Open</a></li>
											<li><a href="#">Close</a></li>
											<li><a href="#">Solve</a></li>
										</ul>
									</div>
								</div>
								<h4 class="list-group-item-heading">
									<span class="label label-info">open</span>
									<a href="/admin/question/edit/5">Tile with a label</a>
									<a href="/"><i class="fa fa-external-link"></i></a></h4>
								<p class="list-group-item-text">Donec id elit non mi porta gravida at eget metus.</p>
							</div>
						</div>
						<div class="list-group-separator"></div>
						<div class="list-group-item">
							<div class="row-action-primary">
								<i class="mdi-communication-live-help"></i>
							</div>
							<div class="row-content">
								<div class="least-content">15m ago <br>
									<div class="btn-group">
										<a href="#" data-target="#" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bars"></i></a>
										<ul class="dropdown-menu dropdown-menu-right">
											<li><a href="#">Edit</a></li>
											<li><a href="#">Delete</a></li>
											<li class="divider"></li>
											<li><a href="#">Open</a></li>
											<li><a href="#">Close</a></li>
											<li><a href="#">Solve</a></li>
										</ul>
									</div>
								</div>
								<h4 class="list-group-item-heading">
									<span class="label label-success">solved</span>
									<a href="/admin/question/edit/5">Tile with a label</a>
									<a href="/"><i class="fa fa-external-link"></i></a></h4>
								<p class="list-group-item-text">Donec id elit non mi porta gravida at eget metus.</p>
							</div>
						</div>
						<div class="list-group-separator"></div>
						<div class="list-group-item">
							<div class="row-action-primary">
								<i class="mdi-communication-live-help"></i>
							</div>
							<div class="row-content">
								<div class="least-content">15m ago <br>
									<div class="btn-group">
										<a href="#" data-target="#" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bars"></i></a>
										<ul class="dropdown-menu dropdown-menu-right">
											<li><a href="#">Edit</a></li>
											<li><a href="#">Delete</a></li>
											<li class="divider"></li>
											<li><a href="#">Open</a></li>
											<li><a href="#">Close</a></li>
											<li><a href="#">Solve</a></li>
										</ul>
									</div>
								</div>
								<h4 class="list-group-item-heading">
									<span class="label label-default">closed</span>
									<a href="/admin/question/edit/5">Tile with a label</a>
									<a href="/"><i class="fa fa-external-link"></i></a></h4>
								<p class="list-group-item-text">Donec id elit non mi porta gravida at eget metus.</p>
							</div>
						</div>
						<div class="list-group-separator"></div>
					</div>

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

		</div>
		<div class="tab-pane fade" id="open">
			<div class="panel panel-default">
				<div class="panel-body">
					<h2>Open questions</h2>
				</div>
			</div>
		</div>
		<div class="tab-pane fade" id="solved">
			<div class="panel panel-default">
				<div class="panel-body">
					<h2>Solved questions</h2>
				</div>
			</div>
		</div>
		<div class="tab-pane fade" id="closed">
			<div class="panel panel-default">
				<div class="panel-body">
					<h2>Closed questions</h2>
				</div>
			</div>
		</div>
	</div>


{/block}