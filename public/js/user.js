/**
 * Application module
 *
 * @module MSV
 * @package user
 */
MSV.namespace('user');
MSV.user = (function(document, $){


    //dependencies
    var sys = MSV.system,
        app = MSV.app,
        _success = $('.alert-success'),
        _error = $('.alert-danger'),
        _question_content = $('div#questions tbody'),
        _question_template = $('#template_question'),
        _number_questions = $('.number-questions'),

        data = {};

        checkInput = function (_title_input,_question_input,_tags_input){
            var title =_title_input.value,
                question = _question_input.value,
                tags = _tags_input.value;
            if(title != "" && question != "" && tags != ""){
                data = {
                    'title': title,
                    'question': question,
                    'tags': tags
                }
                return data;
            }
            else {
                return false;
            }
        }
        add_question = function(form){
            var _title_input = form['title'],
                _question_input = form['question'],
                _question_editor = form.querySelector("trix-editor"),
                _tags_input = form['labels'];
            var url = form.getAttribute('action');
            var data = checkInput(_title_input,_question_input,_tags_input);
                if(data != false){
                    $.ajax({
                        url: url,
                        type: "POST",
                        data: data,
                        success: function(questions){
                            _success.slideDown('slow');
                            clear_form_data(_title_input,_question_input,_question_editor,_tags_input);
                            for(var i = 0, max = _number_questions.length;i<max;i++){
                                _number_questions[i].innerHTML = parseInt(_number_questions[i].innerHTML)+1;
                            }
                            _question_content.append(update_data(_question_template,JSON.parse(questions)));
                            setTimeout(function(){
                                _success.slideUp('slow');
                            },3500);
                        },
                        error: function(data) {
                            _error.removeClass('not-visible').addClass('visible');
                        }
                    })
                }
            return false;
        }
        update_data = function (id,questions) {
            var tpl = $(id).text();
            var base_url = window.location.host+'/';
            tpl = tpl.replace(/\{\$([0-9a-z_]+)\}/g,function(match,varName){
                if(varName == 'base_url'){
                    return base_url;
                }
                return questions[varName];
            });
            return tpl;
        }
        clear_form_data = function(title_input,question_input,question_editor,tags_input){
            var length = question_input.value.length;

            title_input.value = "";
            title_input.className = 'form-control empty';

            question_input.value = "";

            question_editor.editor.setSelectedRange([0, length]);
            question_editor.editor.deleteInDirection("forward");

            tags_input.value = "";
            tags_input.className = 'form-control empty';

        }
         delete_question = function (id,href){
             var url = href.getAttribute('href');
             var question = $('#question_'+id);
             //var edit_form = $('#edit_'+id);
             $.ajax({
                 url:url,
                 type: "POST",
                 data:{'id':id},
                 success: function(result){
                     if(result != false) {
                       // edit_form.remove();
                        question.remove();
                         for(var i = 0, max = _number_questions.length;i<max;i++){
                             _number_questions[i].innerHTML = parseInt(_number_questions[i].innerHTML)-1;
                         }
                     }
                 }
             })
            return false;
         }
        show_edit_form = function(id){
            var edit_form = '#edit_'+id;
            var question_content = $('#question_'+id).val();
            /*var question_editor = edit_form.querySelector("trix-editor");
            _question_editor.editor.setSelectedRange([0, 0])
            _question_editor.editor.insertString(question_content);*/
            $(edit_form).slideDown('slow');
        }
    return {
        add_question: add_question,
        delete_question : delete_question,
        update_data: update_data
    }

})(document, $);
