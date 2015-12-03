/**
 * Application module
 *
 * @module MSV
 * @package question
 */
MSV.namespace('question');
MSV.question = (function(document, $) {


    //dependencies
    var sys = MSV.system,
        app = MSV.app,
        user = MSV.user,
        _comment_content = $('div#comment_box'),
        _comment_template = $('#template_comment'),
        _answer_form = $('div#add_answer_form');

    add_comment = function(form,answer_id) {
        var _question_input = form['question'],
            _question_editor = form.querySelector("trix-editor"),
            url = form.getAttribute('action');
        if (_question_input.value != ""){
            $.ajax({
                url: url,
                type: "POST",
                data: {
                        'question_id':answer_id,
                        'content':_question_input.value
                },
                success: function(answer){
                    _question_editor.editor.setSelectedRange([0, _question_input.value.length]);
                    _question_editor.editor.deleteInDirection("forward");
                    _comment_content.append(user.update_data(_comment_template,JSON.parse(answer)));
                    setTimeout(function (){
                        _answer_form.slideUp('slow');
                    },1000)

                },
                error: function(data) {
                    setTimeout(function (){
                        _answer_form.slideUp('slow');
                    },1000)
                }
            });
        }
        return false;
    }
    delete_comment = function(answer_id,href) {
        var url = href.getAttribute('href');
        var answer = $('#answer_'+answer_id);
        $.ajax({
            url:url,
            type: "POST",
            data:{'id':answer_id},
            success: function(result){
                if(result != false) {
                    answer.slideUp('slow');
                    setTimeout(function(){
                        answer.remove();
                    },1000);
                }
            },
            error: function(data) {
                sys.log('error');
            }
        })
        return false;
    }
    return {
        add_comment: add_comment,
        delete_comment: delete_comment
    }
})(document, $);