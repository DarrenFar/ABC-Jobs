$("#formValidation").validate({
    rules:{
        fullname:{
            minlength: 3
        },
        email:{
            email:true
        },
        password:{
            minlength: 5
        },
        confirmpassword:{
            equalTo: "#password"
        },
        code:{
			minlength : 4,
			maxlength : 4
		}

    },

    submitHandler: function(form) {
      form.submit();
    }
   });