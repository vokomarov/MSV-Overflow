{include file='header.tpl' site_title='User Profile'}
<div class="container">
    {include file='menu.tpl'}
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

{include file='footer.tpl'}