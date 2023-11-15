<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2023/11/14
  Time: 0:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- 加isELIgnored 防止jsp页面无法解析EL表达式 --%>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>用户登录</title>
</head>
<body>
<div style="text-align: center">
    <form action="login" method="post" id="loginForm">
        姓名：<input type="text" name="uname" id="uname" value="${messageModel.object.userName}"><br>
        密码：<input type="password" name="upwd" id="upwd" value="${messageModel.object.userPwd}">
        <span id="msg" style="font-size: 12px;color: red">${messageModel.msg}</span><br>
        <button type="button" id="loginBtn">登录</button>
        <button type="button">注册</button>
    </form>
</div>
</body>
<%--引入Jquery的js文件--%>
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $("#loginBtn").click(function () {
            var uname = $("#uname").val();
            var upwd = $("#upwd").val();
            if (isEmpty(uname)){
                $("#msg").html("用户姓名不能为空！");
                return;
            }
            if (isEmpty(upwd)){
                $("#msg").html("用户密码不能为空！");
                return;
            }
            $("#loginForm").submit();
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
