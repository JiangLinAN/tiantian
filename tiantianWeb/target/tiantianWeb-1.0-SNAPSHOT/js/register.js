$(function () {

    var error_name = false;
    var error_password = false;
    var error_check_password = false;
    var error_email = false;
    var error_check = false;
    var userN = 0;
    var passW = 0;
    var passR = 0;
    var email = 0;

    $('#but').click(function () {
    	console.log("ajax running"+ userN + passW + passR + email)
        if (userN == 1 && passR == 1 && passW == 1 && email == 1) {
            $.ajax({
                url: "http://localhost:8080/tiantianWeb_war_exploded/user/regist",
                type: 'post',
                data: JSON.stringify({
                    "username": $("#user_name").val(),
                    "password": $("#pwd").val(),
                    "mail": $("#email").val()
                }),
                contentType: 'application/json',
                success: function (data) {
                    if (data == "1") {
                        alert("注册成功");
                        location.href="http://localhost:8080/tiantianWeb_war_exploded/login.jsp";
                    }
                    if (data == "-1"){
                        alert("用户名或邮箱重复");
                    }
                    if (data == "-2"){
                        alert("用户名不能包含特殊字符 @")
                    }
                },
                error: function () {
                   alert("注册失败")
                }
            })
        }else {
            alert("输入错误,请重新输入!")
        }

    })

    $('#user_name').blur(function () {
        check_user_name();
    });

    $('#pwd').blur(function () {
        check_pwd();
    });

    $('#rpwd').blur(function () {
        check_rpwd();
    });

    $('#email').blur(function () {
        check_email();
    });

    $('#allow').click(function () {

        if ($(this).is(':checked')) {
            error_check = false;
            $(this).siblings('span').hide();
        } else {
			console.log("allow");
            error_check = true;
            $(this).siblings('span').html('请勾选同意');
            $(this).siblings('span').show();
        }
    });


    function check_user_name() {
        var len = $('#user_name').val().length;
        if (len < 5 || len > 20) {
            $('#user_name').next().html('请输入5-20个字符的用户名')
            $('#user_name').next().show();
            error_name = true;
        } else {
            userN = 1;
            $('#user_name').next().hide();
            error_name = false;
        }
    }

    function check_pwd() {
        var len = $('#pwd').val().length;
        if (len < 8 || len > 20) {
            $('#pwd').next().html('密码最少8位，最长20位')
            $('#pwd').next().show();
            error_password = true;
        } else {
            passW = 1;
            $('#pwd').next().hide();
            error_password = false;
        }
    }


    function check_rpwd() {
        var pass = $('#pwd').val();
        var rpass = $('#rpwd').val();

        if (pass != rpass) {
            $('#rpwd').next().html('两次输入的密码不一致')
            $('#rpwd').next().show();
            error_check_password = true;
        } else {
            passR = 1;
            $('#rpwd').next().hide();
            error_check_password = false;
        }

    }

    function check_email() {
        var re = /^[a-z0-9][\w\.\-]*@[a-z0-9\-]+(\.[a-z]{2,5}){1,2}$/;

        if (re.test($('#email').val())) {
            email = 1;
            $('#email').next().hide();
            error_email = false;
        } else {
            $('#email').next().html('你输入的邮箱格式不正确')
            $('#email').next().show();
            error_check_password = true;
        }

    }


})