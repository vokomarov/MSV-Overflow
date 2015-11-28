{include file='header.tpl' site_title='User Profile'}
<div class="container">
    {include file='menu.tpl'}
    <ul class="nav nav-tabs" style="margin-bottom: 15px;">
        <li class="active"><a href="#profile" data-toggle="tab">Profile</a></li>
        <li><a href="#questions" data-toggle="tab">Questions <span class="badge">{count($user_questions)}</span></a></li>
        <li><a href="#answers" data-toggle="tab">Answers</a></li>
        <li><a href="#add_question" data-toggle="tab">Add questions</a></li>
    </ul>
    <div id="myTabContent" class="tab-content">
        <div class="tab-pane fade active in" id="profile">
            <p>profile</p>
        </div>
        <div class="tab-pane fade" id="questions">
            {foreach from = $user_questions key = myid item = question}
            <a href="question/view/{$question.id}">{$question.title}</a>
                <ul class="dropdown-menu dropdown-menu-right">
                    <li><a href="#"><i class="fa fa-pencil"></i> Edit</a></li>
                    <li><a href="#"><i class="fa fa-trash-o"></i> Delete</a></li>
                    <li class="divider"></li>
                    <li><a href="#"><i class="fa fa-ban"></i> Ban user</a></li>
                </ul>
            {/foreach}
        </div>
        <div class="tab-pane fade" id="answers">
            <p>answers</p>
        </div>
        <div class="tab-pane fade" id="add_question">
            <p>add questions</p>
        </div>
    </div>
</div>
{include file='footer.tpl'}