<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%-- 加isELIgnored 防止jsp页面无法解析EL表达式 --%>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>新增书籍</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
</head>

<body>
<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>新增书籍</small>
                </h1>
            </div>
        </div>
    </div>
    <form action="${pageContext.request.contextPath}/addBook" method="post">
        <div class="form-group">
            <label for="bookName">书籍名称:</label>
            <input type="text" class="form-control" id="bookName" name="bookName" >
        </div>
        <div class="form-group">
            <label for="bookCounts">书籍数量:</label>
            <input type="text" class="form-control" id="bookCounts" name="bookCounts" >
        </div>
        <div class="form-group">
            <label for="detail">书籍描述:</label>
            <input type="text" class="form-control" id="detail" name="detail" >
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-danger" onclick="return confirm('确定要添加该书籍吗？')"> 确认 </button>
            <a href="allBook.jsp" class="btn btn-success">返回</a>
        </div>
    </form>

    <%
        String errorMessage = (String) session.getAttribute("Message");
        if (errorMessage != null && !errorMessage.isEmpty()) {
    %>
    <script>
        // 使用JavaScript弹出提示框显示错误信息
        alert("<%= errorMessage %>");
    </script>
    <%
            // 清除错误信息，避免重复弹窗
            session.removeAttribute("Message");
        }
    %>


</div>
</body>
</html>
