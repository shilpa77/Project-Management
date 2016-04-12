function updateStatus(task_id)
{
	alert("1111");
	alert(task_id);
	
	alert($(".select"+task_id).val());
	task_status = $(".select"+task_id).val();
	$.ajax
	({
		type : "get",
		url : "/tasks/update_status",
		data : {
			task_id : task_id,
			status : task_status
		},
		success : function(data) {
			$('.status'+task_id).html(task_status);	
		}
	});	
}

function validateCheckbox()
{
	$('#proj-dev').validate({
		rules : {
			'developer[]':{
				required: true
			}
		},
		errorPlacement: function(error, element) {
            element.parent().before(error);
        }
	});
}

function validateProjForm()
{
	$('#new_project').validate({
		rules : {
			'project[name]':{
				required: true
			},
			'project[description]':{
				required: true
			}
		},
		messages : {
			'project[name]':{
				required: '*Please enter project name'
			},
			'project[description]':{
				required: '*Please enter project description'
			}
		},
		
		errorPlacement: function(error, element) {
            element.parent().before(error);
        }
	});
}

function validateSignUpForm()
{
	$('#new_user').validate({
		rules : {
			'user[email]':{
				required: true,
				email: true
			},
			'user[password]':{
				required: true
			},
			'user[password_confirmation]':{
				required: true
			},
			'user[role]':{
				required: true
			}
		}
	});
}
