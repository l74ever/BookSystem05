<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2023/11/20
  Time: 21:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- 加isELIgnored 防止jsp页面无法解析EL表达式 --%>
<%@page isELIgnored="false" %><html>
<head>
    <title>注册页面</title>
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    <!--font-awesome    -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/font-awesome-4.7.0\css\font-awesome.min.css">
    <%--引入Jquery的js文件--%>
    <script type="text/javascript" src="js/jquery-3.4.1.js"></script>
    <!-- 引入 Bootstrap -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
</head>
<body>
<%--<h1>注册页面！！</h1>--%>
<%--<form action="${pageContext.request.contextPath}/register" method="post" id="registerForm">--%>
<%--    <label for="uName">Username:</label>--%>
<%--    <input type="text" name="uName" id="uName" value="${messageModel.object.userName}"><br><br>--%>

<%--    <label for="uPwd">Password:</label>--%>
<%--    <input type="text" name="uPwd" id="uPwd" value="${messageModel.object.userPwd}"><br><br>--%>
<%--    <span id="msg" style="font-size: 12px;color: red">${messageModel.msg}</span><br>--%>
<%--    <input type="submit"  name="rbtn" id="rbtn" value="register">--%>
<%--</form>--%>
<div class="page login-page">
    <div class="container d-flex align-items-center">
        <div class="form-holder has-shadow">
            <div class="row">
                <!-- Logo & Information Panel-->
                <div class="col-lg-6">
                    <div class="info d-flex align-items-center">
                        <div class="content">
                            <div class="logo">
                                <h1>欢迎注册</h1>
                            </div>
                            <p>简易图书管理系统</p>
                        </div>
                    </div>
                </div>
                <!-- Form Panel    -->
                <div class="col-lg-6 bg-white">
                    <div class="form d-flex align-items-center">
                        <div class="content">
                            <form method="post" action="${pageContext.request.contextPath}/register" class="form-validate" id="registerForm">
                                <div class="form-group">
                                    <i class="fa fa-user" aria-hidden="true"></i>
                                    用户名：<input id="uName" type="text" name="uName" required data-msg="请输入用户名" placeholder="用户名" value="${messageModel.object.userName}" class="input-material">
                                </div>
                                <div class="form-group">
                                    <i class="fa fa-key" aria-hidden="true"></i>
                                    密码：<input id="uPwd" type="password" name="uPwd" required data-msg="请输入密码" placeholder="密码" value="${messageModel.object.userPwd}" class="input-material">
                                    <span id="msg" style="font-size: 12px;color: red">${messageModel.msg}</span><br>
                                </div>
                                <button id="register" name="rbtn" type="submit" class="btn btn-primary">注册</button>
                            </form>
                            <small>已有账号?</small><a href="login.jsp" class="signup">&nbsp;登录</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    $(document).ready(function(){
        $("#rbtn").click(function () {
            var uname = $("#uName").val();
            var upwd = $("#uPwd").val();
            if (isEmpty(uname)){
                $("#msg").html("用户姓名不能为空！");
                return;
            }
            if (isEmpty(upwd)){
                $("#msg").html("用户密码不能为空！");
                return;
            }
            $("#registerForm").submit();
        });
    });

    /**
     * 判断字符串是否为空
     * 空返true 不空返false
     * @param str
     * @returns {boolean}
     */
    function isEmpty(str) {
        if (str == null || str.trim() == "") {
            return true;
        } else {
            return false;
        }
    }


</script>
</html>
