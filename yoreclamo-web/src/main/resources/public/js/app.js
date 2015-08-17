$(function() {

	$.fn.serializeFormJSON = function() {
	   var o = {};
	   var a = this.serializeArray();
	   $.each(a, function() {
	       if (o[this.name]) {
	           if (!o[this.name].push) {
	               o[this.name] = [o[this.name]];
	           }
	           o[this.name].push(this.value || '');
	       } else {
	           o[this.name] = this.value || '';
	       }
	   });
	   return JSON.stringify(o);
	};

	$("#company").select2({
  		placeholder: "Seleccione una empresa"
	});

	$('#modal-success').on("hide.bs.modal", function(){
	    window.location = "/";
	});
	$("#btn-step1").on("click",function(e){
        e.preventDefault();

        var form = $("#complain-form");

        form.validate({
			rules: {
				ignore: [],
	            title:{
	            	required: true,
	            	minlength: 8
	            },
	            body:{
	            	required: true,
	            	minlength: 50
	            },
	            company:{
	            	required: true	            	
	            }
        	}
    	});

        if (form.valid() == true){
	        $("#complain-fields").hide(500);
	        $("#contact-fields").show();
    	}
	});


 	$("#btn-register-complain").on("click",function(e){
        e.preventDefault();

        var form = $("#complain-form");

        form.validate({
			rules: {
	            name:{
	            	required: true,
	            	minlength: 8
	            },
	            email:{
	            	required: true
	            },
	            dni:{
	            	required: true,
	            	minlength: 8
	            },
	            phone:{
	            	required:true,
	            	minlength:8
	            }
        	}
    	});

		if (form.valid() == true){
			var dataForm = $("#complain-form");
			
			$.ajax({
			    	dataType: "json", 
					type: "POST",
					url: "/reclamo",
					data: dataForm.serialize(),
					success: function(data){
						$("#modal-success").modal('show');
					},
			  		error: function(e){
						console.log(e);
			  		}
			});
			
    	}
	});	



});