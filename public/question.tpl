{include file='header.tpl' site_title='MSV overflow'}
<div class="container">
    {include file='menu.tpl'}

    <div class="row">
        <h3 class="question-title">{$current_question.title}</h3>
        <div class="row">
            <div class="col-lg-9 col-md-9 col-sm-9">
                <div class="vote pull-left text-center">
                    <a href="#"><i class="mdi-hardware-keyboard-arrow-up"></i></a>
                    <h4 class="count">2</h4>
                    <a href="#" ><i class="mdi-hardware-keyboard-arrow-down"></i></a>
                    <a href="#" class="like-btn"><i class="mdi-action-grade"></i></a>
                    <p class="like-count">1</p>
                </div>
                <div class="col-lg-11 col-md-11 col-sm-11">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                            <p>{$current_question.content}</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-5 col-md-5 col-sm-5 pull-left">
                            <span class="label label-warning">java</span>
                            <span class="label label-warning">tomcat</span>
                            <span class="label label-warning">jaber</span>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-3 pull-right">
                            <div class="post-signature panel panel-default">
                                <div class="panel-body">
                                    <div class="user-action-time">
                                        asked <span title="{$current_question.created_at}" class="relativetime">{$current_question.created_at}</span>
                                    </div>
                                    <div class="user-details">
                                        <img class="user-avatar pull-left" src="http://lorempixel.com/56/56/people/1" alt="icon">
                                        <a class="user-profile-link" href="userprofile/">{$user.fname}</a>
                                        <span class="label label-info">{$user.karma}</span>
                                        <div class="clr"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                {include file='sidebar.tpl'}
        </div>
    </div>
</div>
{include file='footer.tpl'}