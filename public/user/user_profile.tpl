{include file='header.tpl' site_title='User Profile'}
<div class="container">
    {include file='menu.tpl'}
    <div class="row">
        <ul class="nav nav-tabs" style="margin-bottom: 15px;">
            <li class="active"><a href="#profile" data-toggle="tab">Profile</a></li>
            <li><a href="#questions" data-toggle="tab">Questions <span class="badge">{count($user_questions)}</span></a></li>
            <li><a href="#answers" data-toggle="tab">Answers<span class="badge">{count($user_answers)}</span></a></li>
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
                                    <span class="number">{$number_questions}</span>
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
                                    <tr>
                                        <td><a href="question/view/{$question.id}">{$question.title}</a></td>
                                        <td>{$question.karma}</td>
                                        <td>{$question.views}</td>
                                        <td>{$question.created_at}</td>
                                        <td>{$question.updated_at}</td>
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
                <p>add questions</p>
            </div>
        </div>
    </div>
</div>
{include file='footer.tpl'}