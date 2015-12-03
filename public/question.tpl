{include file='header.tpl' site_title='MSV overflow'}
<div class="container">
    {include file='menu.tpl'}

    <div class="row">
        <h3 class="question-title">{$current_question.title}</h3>
        <div class="row">
            <div class="col-lg-9 col-md-9 col-sm-9">
                <div class="vote pull-left text-center">
                    <a href="#"><i class="mdi-hardware-keyboard-arrow-up"></i></a>
                    <h4 class="count">{$current_question.karma}</h4>
                    <a href="#" ><i class="mdi-hardware-keyboard-arrow-down"></i></a>
                </div>
                <div class="col-lg-11 col-md-11 col-sm-11">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                            <p>{$current_question.content}</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-5 col-md-5 col-sm-5 pull-left">
                            {foreach from=$current_question.labels key=myid item=labels}
                                <span class="label label-warning">{$labels}</span>
                            {/foreach}
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-3 pull-right">
                            <div class="post-signature panel panel-default">
                                <div class="panel-body">
                                    <div class="user-action-time">
                                        asked <span title="{$current_question.created_at}" class="relativetime">{$current_question.created_at}</span>
                                    </div>
                                    <div class="user-details">
                                        <img class="user-avatar pull-left" src="http://lorempixel.com/56/56/people/1" alt="icon">
                                        <a class="user-profile-link" href="/userprofile/{$question_user.id}">{$question_user.fname}</a>
                                        <span class="label label-info">{$question_user.karma}</span>
                                        <div class="clr"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            {include file='sidebar.tpl'}
            <div class="col-lg-9 col-md-9 col-sm-9">
                <h3 class="question-title">Answers</h3>
            </div>
            <div class="col-lg-9 col-md-9 col-sm-9" id="comment_box">
            {foreach from = $answers_question key = id item = answers}
                <div class="row" id="answer_{$answers.id}">
                    <div class="vote pull-left text-center">
                        <a href="#"><i class="mdi-hardware-keyboard-arrow-up"></i></a>
                        <h4 class="count">{$answers.karma}</h4>
                        <a href="#" ><i class="mdi-hardware-keyboard-arrow-down"></i></a>
                    </div>
                    <div class="col-lg-11 col-md-11 col-sm-11">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                                <p>{$answers.content}</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3 col-md-3 col-sm-3 pull-right">
                                <div class="post-signature panel panel-default">
                                    <div class="panel-body">
                                        <div class="user-action-time">
                                            answered <span title="{$answers.created_at}" class="relativetime">{$answers.created_at}</span>
                                        </div>
                                        <div class="user-details">
                                                <img class="user-avatar pull-left" src="http://lorempixel.com/56/56/people/1" alt="icon">
                                                <a class="user-profile-link" href="/userprofile/{$answers.user_id}">{$answers.user_name}</a>
                                                <span class="label label-info">{$answers.user_karma}</span>
                                                <div class="clr"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        {if $answers.user_id == $logged_user}
                        <div class="row" id="an">
                            <div class="col-lg-2 col-md-2 col-sm-2 pull-right text-right">
                                <a class="delete_question" href="{$base_url}question/delete_answer" onclick="return MSV.question.delete_comment({$answers.id},this);">Delete <i class="fa fa-trash-o"></i></a>
                            </div>
                        </div>
                        {/if}
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12 separator"></div>
                </div>
            {/foreach}
             </div>
            {if $is_logged}
            <div class="col-lg-9 col-md-9 col-sm-9" id="add_answer_form">
                <h3 class="question-title">Add comment</h3>
                <div class="panel panel-default">
                    <div class="panel-body">
                        <form action="{$base_url}question/add_comment" method="POST" onsubmit="return MSV.question.add_comment(this,{$current_question.id});">
                            <fieldset>
                                <div class="row form-group">
                                    <div class="col-lg-offset-1 col-lg-2">
                                        <label for="question" class="control-label">Answer<span class="text-danger">*</span></label>
                                    </div>
                                    <div class="col-lg-8">
                                        <div class="form-control-wrapper"><input type="hidden" class="form-control" name="question" id="question" required=""></div>
                                        <trix-editor input="question" class="form-control"></trix-editor>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col-lg-6 pull-right">
                                        <button type="submit" class="btn btn-primary">Post Your Answer</button>
                                    </div>
                                </div>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
            {/if}
        </div>
    </div>
</div>
{literal}
<script id="template_comment" type="text/html">
    <div class="row" id="answer_{$id}">
        <div class="vote pull-left text-center">
            <a href="#"><i class="mdi-hardware-keyboard-arrow-up"></i></a>
            <h4 class="count">{$karma}</h4>
            <a href="#" ><i class="mdi-hardware-keyboard-arrow-down"></i></a>
        </div>
        <div class="col-lg-11 col-md-11 col-sm-11">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                    <p>{$content}</p>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-3 pull-right">
                    <div class="post-signature panel panel-default">
                        <div class="panel-body">
                            <div class="user-action-time">
                                answered <span title="{$created_at}" class="relativetime">{$created_at}</span>
                            </div>
                            <div class="user-details">
                                <img class="user-avatar pull-left" src="http://lorempixel.com/56/56/people/1" alt="icon">
                                <a class="user-profile-link" href="userprofile/{$user_id}">{$user_name}</a>
                                <span class="label label-info">{$user_karma}</span>
                                <div class="clr"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-2 col-md-2 col-sm-2 pull-right text-right">
                    <a class="delete_question" href="{$base_url}question/delete_answer" onclick="return MSV.question.delete_comment({$id},this);">Delete <i class="fa fa-trash-o"></i></a>
                </div>
            </div>
        </div>
        <div class="col-lg-12 col-md-12 col-sm-12 separator"></div>
    </div>
</script>
{/literal}
{include file='footer.tpl'}