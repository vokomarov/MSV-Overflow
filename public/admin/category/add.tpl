{extends file="admin/index.tpl"}
{block name="content"}
	<h1>Add category</h1>
	<div class="panel panel-default">
		<div class="panel-body">

			<form action="#" method="POST">
				<fieldset>
					<legend>Please, fill require field</legend>

					{if isset($error)}
						<div class="alert alert-dismissable alert-warning">
							<button type="button" class="close" data-dismiss="alert">×</button>
							<h4>Error!</h4>
							<p>{$error}</p>
						</div>
					{/if}

					<div class="row form-group">
						<div class="col-lg-offset-1 col-lg-2">
							<label for="name" class="control-label">Category name</label>
						</div>
						<div class="col-lg-3">
							<input type="text" class="form-control floating-label" name="name" id="name" placeholder="Category">
						</div>
					</div>

					<div class="row form-group">
						<div class="col-lg-offset-1 col-lg-2">
							<label for="slug" class="control-label">Category slug (my-category-test)</label>
						</div>
						<div class="col-lg-3">
							<input type="text" class="form-control floating-label" name="slug" id="slug" placeholder="Category">
						</div>
					</div>

					<div class="row form-group">
						<div class="col-lg-offset-1 col-lg-2">
							<label for="parent_id" class="control-label">Parent category</label>
						</div>
						<div class="col-lg-3">
							<select class="form-control" id="parent_id" name="parent_id">
								<option value="0" selected>Root category</option>
								{foreach from=$categories item=cat}
									<option value="{$cat['id']}">{$cat['name']}</option>
								{/foreach}
							</select>
						</div>
					</div>
					<input type="hidden" name="action" value="add">
					<div class="row form-group">
						<div class="col-lg-3">
							<button class="btn btn-default" onclick="history.go(-1);">Back</button>
						</div>
						<div class="col-lg-9">
							<button type="submit" class="btn btn-primary">Add category</button>
						</div>
					</div>

				</fieldset>
			</form>


		</div>
	</div>
{/block}