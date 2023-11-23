<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2023/11/20
  Time: 21:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- 加isELIgnored 防止jsp页面无法解析EL表达式 --%>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>跳转页面</title>
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
<div class="page login-page">
    <div class="container d-flex align-items-center">
        <div class="form-holder has-shadow">
            <div class="row">
                <!-- Logo & Information Panel-->
                <div class="col-lg-6">
                    <div class="info d-flex align-items-center">
                        <div class="content">
                            <div class="logo">
                                <h2>欢迎${user.userName}，登录成功！</h2>
                            </div>
                            <p>简易图书管理系统</p>
                            <a href="${pageContext.request.contextPath}/allBook.jsp" class="btn btn-light">点击进入系统主页面</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>



