<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%-- 加isELIgnored 防止jsp页面无法解析EL表达式 --%>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>跳转页面</title>
    <style>
        a {
            text-decoration: none;
            color: black;
            font-size: 18px;
        }

        h3 {
            width: 180px;
            height: 38px;
            margin: 100px auto;
            text-align: center;
            line-height: 38px;
            background: deepskyblue;
            border-radius: 4px;
        }
    </style>
</head>
<body>
<h2>欢迎${user.userName}登录成功！</h2>
<h3>
    <%--<%=request.getContextPath()%>--%>
    <a href="${pageContext.request.contextPath}/allBook.jsp">点击进入列表页</a>
</h3>
</body>
</html>

