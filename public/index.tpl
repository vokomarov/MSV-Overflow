{include file='header.tpl' site_title='MSV overflow'}

<div class="container">
    {include file='menu.tpl'}
        <div class="row">
            <div class="col-lg-9 col-md-9">
                <div class="row">
                    <h3 class="pull-left">Top Questions</h3>
                    <div class="pull-right">
                        <ul class="nav nav-tabs top-offset" >
                            <li class="active"><a href="?tab=interesting" data-toggle="tab">Interesting</a></li>
                            <li><a href="?tab=featured" data-toggle="tab">Featured</a></li>
                            <li><a href="?tab=hot" data-toggle="tab">Hot</a></li>
                            <li><a href="?tab=week" data-toggle="tab">Week</a></li>
                            <li><a href="?tab=month" data-toggle="tab">Month</a></li>
                        </ul>
                    </div>
                </div>
                {foreach from=$question_item key=myid item=i}
                    <div class="row light-post">
                        <div class="col-lg-1 col-md-1 col-sm-1 text-center top-offset">
                            <p>0</p>
                            <p>votes</p>
                        </div>
                        <div class="col-lg-1 col-md-1 col-sm-1 text-center top-offset">
                            <p>0</p>
                            <p>answer</p>
                        </div>
                        <div class="col-lg-1 col-md-1 col-sm-1 text-center top-offset">
                            <p>0</p>
                            <p>views</p>
                        </div>
                        <div class="col-lg-9 col-md-9 col-sm-9">
                            <a href="question/view/{$i.id}">{$i.title}</a>
                            <div class="row">
                                <div class="col-lg-8 col-md-8 col-sm-8">
                                    <span class="label label-warning">java</span>
                                    <span class="label label-warning">tomcat</span>
                                    <span class="label label-warning">jaber</span>
                                </div>
                            </div>

                            {foreach from = $question_users key = myid item = users}
                                {if $i.user_id == $users.id}
                                    <div class="col-lg-4 col-md-4 col-sm-4 pull-right">
                                        <p class="text-primary"> asked <span class="relativetime">{$users.created_at}</span> <a href="userprofile/{$users.id}" class="user-profile-link">{$users.fname}</a></p>
                                    </div>
                                {/if}
                            {/foreach}
                        </div>
                    </div>
                {/foreach}
            </div>
        {include file='sidebar.tpl'}
        </div>
    </div>

    {include file='footer.tpl'}