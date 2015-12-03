{include file='header.tpl' site_title='User Profile'}
<div class="container">
    {include file='menu.tpl'}
    <div class="row">
        <ul class="nav nav-tabs" style="margin-bottom: 15px;">
            <li class="active"><a href="#profile" data-toggle="tab">Profile</a></li>
            <li><a href="#questions" data-toggle="tab">Questions <span class="badge number-questions" >{$number_questions}</span></a></li>
            <li><a href="#answers" data-toggle="tab">Answers<span class="badge">{$number_answers}</span></a></li>
            <li><a href="#add_question" data-toggle="tab">Add questions</a></li>
        </ul>
    </div>
    <div class="row">
        <div id="myTabContent" class="tab-content">
            <div class="tab-pane fade active in" id="profile">
                <div class="panel panel-default">
                    <div class="panel-body">
                            <div class="col-md-3">
                                <div id="avatar-card" class="avatar-card">
                                    <div class="avatar">
                                            <img src="{$template}/images/user-avatar.jpg" alt="" class="avatar-user">
                                    </div>
                                    <div class="reputation" title="reputation">
                                       {$user_info.karma} <span class="label-uppercase">reputation</span>
                                    </div>
                                </div>
                        </div>
                        <div class="col-md-5">
                            <div class="user-card">
                                <h2 class="user-card-name">{$user_info.fname} {$user_info.lname}</h2>
                                <div class="answers col-md-2">
                                    <span class="number">{$number_answers}</span>
                                    answers
                                </div>
                                <div class="answers col-md-2">
                                    <span class="number number-questions">{$number_questions}</span>
                                    questions
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="questions">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <table class="table table-striped table-hover ">
                            <thead>
                            <tr>
                                <th>Title</th>
                                <th>Rating</th>
                                <th>Views</th>
                                <th>Created at</th>
                                <th>Updated at</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>
                                {foreach from = $user_questions key = myid item = question}
                                    <tr id="question_{$question.id}">
                                        <td><a href="/question/{$question.id}">{$question.title}</a></td>
                                        <td>{$question.karma}</td>
                                        <td>{$question.views}</td>
                                        <td>{$question.created_at}</td>
                                        <td>{$question.updated_at}</td>
                                        <td>
                                            <div class="btn-group">
                                                <a href="#" data-target="#" class="btn-xs btn btn-primary dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bars"></i><div class="ripple-wrapper"></div></a>
                                                <ul class="dropdown-menu dropdown-menu-right">
                                                    <li><a href="#" onclick="show_edit_form({$question.id})"><i class="fa fa-pencil"></i> Edit</a></li>
                                                    <li><a class="delete_question" href="{$base_url}user/userprofile/delete_question" onclick="return delete_question({$question.id},this);"><i class="fa fa-trash-o"></i> Delete</a></li>
                                                </ul>
                                            </div>
                                        </td>
                                    </tr>
                                 {*   <tr class="without-hover" id="edit_{$question.id}">
                                        <td colspan="6">
                                            <div class="not-visible">
                                                <form action="{$base_url}user/userprofile/add_question" method="POST" onsubmit="return update_question(this);">
                                                    <fieldset>
                                                        <div class="row form-group">
                                                            <div class="col-lg-offset-1 col-lg-2">
                                                                <label for="title" class="control-label">Title<span class="text-danger">*</span></label>
                                                            </div>
                                                            <div class="col-lg-8">
                                                                <div class="form-control-wrapper"><input type="text" class="form-control" name="title" required="" value="{$question.title}"><div class="floating-label">Title</div><span class="material-input"></span></div>
                                                            </div>
                                                        </div>
                                                        <div class="row form-group">
                                                            <div class="col-lg-offset-1 col-lg-2">
                                                                <label for="question" class="control-label">Question<span class="text-danger">*</span></label>
                                                            </div>
                                                            <div class="col-lg-8">
                                                                <div class="form-control-wrapper"><input type="hidden" class="form-control" name="question_{$question.id}" id="question_{$question.id}" required="" value="{$question.content}"></div>
                                                                <trix-editor id="question_editor_{$question.id}" input="question_{$question.id}" class="form-control"></trix-editor>
                                                            </div>
                                                        </div>

                                                        <div class="row form-group">
                                                            <div class="col-lg-offset-1 col-lg-2">
                                                                <label for="labels" class="control-label">Labels<span class="text-danger">*</span></label>
                                                            </div>
                                                            <div class="col-lg-8 ">
                                                                <div class="form-control-wrapper"><input type="text" class="form-control" name="labels"  required="" value="{$question.tags}"><div class="floating-label">Labels separate,</div><span class="material-input"></span></div>
                                                            </div>
                                                        </div>

                                                        <div class="row form-group">
                                                            <div class="col-lg-6 pull-right">
                                                                <button type="submit" class="btn btn-primary">Edit</button>
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </form>
                                            </div>
                                        </td>
                                    </tr>*}
                                {/foreach}
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="answers">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <table class="table table-striped table-hover ">
                            <thead>
                            <tr>
                                <th>Question Title</th>
                                <th>Rating</th>
                                <th>Created at</th>
                                <th>Updated at</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            {foreach from = $user_answers key = myid item = answers}
                                <tr>
                                    <td>{$answers.question_title}</td>
                                    <td>{$answers.karma}</td>
                                    <td>{$answers.created_at}</td>
                                    <td>{$answers.updated_at}</td>
                                    <td>
                                        <div class="btn-group">
                                            <a href="#" data-target="#" class="btn-xs btn btn-primary dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bars"></i><div class="ripple-wrapper"></div></a>
                                            <ul class="dropdown-menu dropdown-menu-right">
                                                <li><a href="#"><i class="fa fa-pencil"></i> Edit</a></li>
                                                <li><a href="#"><i class="fa fa-trash-o"></i> Delete</a></li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                            {/foreach}
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="add_question">
                <div class="panel panel-default">
                    <div class="panel-body">
                            <div class="alert alert-dismissible alert-success not-visible">
                                <button type="button" class="close" data-dismiss="alert">×</button>
                                <strong>Well done!</strong> You successfully
                                <a href="javascript:void(0)" class="alert-link">add new question</a>.
                            </div>
                            <div class="alert alert-dismissible alert-danger not-visible">
                                <button type="button" class="close" data-dismiss="alert">×</button>
                                <strong>Oh snap!</strong>
                                <a href="javascript:void(0)" class="alert-link">Change a few things up</a> and try submitting again.
                            </div>
                        <form action="{$base_url}user/userprofile/add_question" method="POST" onsubmit="return add_question(this);">
                            <fieldset>
                                <legend>Please, fill require field</legend>
                                <div class="row form-group">
                                    <div class="col-lg-offset-1 col-lg-2">
                                        <label for="title" class="control-label">Title<span class="text-danger">*</span></label>
                                    </div>
                                    <div class="col-lg-8">
                                        <div class="form-control-wrapper"><input type="text" class="form-control empty" name="title" id="title" required=""><div class="floating-label">Title</div><span class="material-input"></span></div>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col-lg-offset-1 col-lg-2">
                                        <label for="question" class="control-label">Question<span class="text-danger">*</span></label>
                                    </div>
                                    <div class="col-lg-8">
                                        <div class="form-control-wrapper"><input type="hidden" class="form-control" name="question" id="question" required=""></div>
                                        <trix-editor input="question" class="form-control"></trix-editor>
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <div class="col-lg-offset-1 col-lg-2">
                                        <label for="labels" class="control-label">Labels<span class="text-danger">*</span></label>
                                    </div>
                                    <div class="col-lg-8 ">
                                        <div class="form-control-wrapper"><input type="text" class="form-control empty" name="labels" id="labels" required=""><div class="floating-label">Labels separate,</div><span class="material-input"></span></div>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col-lg-6 pull-right">
                                        <button type="submit" class="btn btn-primary">Ask</button>
                                    </div>
                                </div>
                            </fieldset>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
{literal}
<script id="template_question" type="text/html">
    <tr id="question_{$id}">
        <td><a href="question/view/{$id}">{$title}</a></td>
        <td>{$karma}</td>
        <td>{$views}</td>
        <td>{$created_at}</td>
        <td>{$updated_at}</td>
        <td>
            <div class="btn-group">
                <a href="#" data-target="#" class="btn-xs btn btn-primary dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bars"></i><div class="ripple-wrapper"></div></a>
                <ul class="dropdown-menu dropdown-menu-right">
                    <li><a href="#"><i class="fa fa-pencil"></i> Edit</a></li>
                    <li><a class="delete_question" href="{$base_url}user/userprofile/delete_question" onclick="return delete_question({$id},this);"><i class="fa fa-trash-o"></i> Delete</a></li>
                </ul>
            </div>
        </td>
    </tr>
</script>
{/literal}
{include file='footer.tpl'}