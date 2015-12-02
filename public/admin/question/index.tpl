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
						{foreach from=$questions item=q}
							<div class="list-group-item">
								<div class="row-action-primary">
									<i class="mdi-communication-live-help"></i>
								</div>
								<div class="row-content">
									<div class="least-content">{$q.created_at} <br>
										<div class="btn-group">
											<a href="#" data-target="#" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bars"></i></a>
											<ul class="dropdown-menu dropdown-menu-right">
												{*<li><a href="#">Edit</a></li>*}
												<li><a href="/admin/question/{$q.id}/delete">Delete</a></li>
												<li class="divider"></li>
												<li><a href="/admin/question/{$q.id}/approve">Approve</a></li>
												<li><a href="/admin/question/{$q.id}/disapprove">Disapprove</a></li>
												<li><a href="/admin/question/{$q.id}/open">Open</a></li>
												<li><a href="/admin/question/{$q.id}/close">Close</a></li>
												<li><a href="/admin/question/{$q.id}/solve">Solve</a></li>
											</ul>
										</div>
									</div>
									<h4 class="list-group-item-heading">
										<span class="label label-info">open</span>
										<a href="/question/{$q.id}">{$q.title} <i class="fa fa-external-link"></i></a>
										</h4>
									<p class="list-group-item-text">{$q.content|truncate:70:"...":false}</p>
								</div>
							</div>
							<div class="list-group-separator"></div>
						{/foreach}
					</div>

					{*<ul class="pagination">
						<li class="disabled"><a href="/">«</a></li>
						<li class="active"><a href="/">1</a></li>
						<li><a href="/">2</a></li>
						<li><a href="/">3</a></li>
						<li><a href="/">4</a></li>
						<li><a href="/">5</a></li>
						<li><a href="/">»</a></li>
					</ul>*}

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