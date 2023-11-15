<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%-- 加isELIgnored 防止jsp页面无法解析EL表达式 --%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>查询书籍</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>查询书籍 —— 根据书名查询</small>
                </h1>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <form action="${pageContext.request.contextPath}/queryBook" method="post" class="form-inline">
                <div class="form-group">
                    <label for="bookName">请输入要查询的书籍名称：</label>
                    <input type="text" class="form-control" id="bookName" name="bookName" placeholder="请输入书籍名称">
                    <span id="msg" style="font-size: 12px;color: red">${messageModel.msg}</span><br>
                </div>
                <button type="submit" class="btn btn-primary" id="querybutton"> 查询 </button>
            </form>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>书籍编号</th>
                    <th>书籍名称</th>
                    <th>书籍数量</th>
                    <th>书籍详情</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="book" items="${booksList}">
                    <tr>
                        <td>${book.bookID}</td>
                        <td>${book.bookName}</td>
                        <td>${book.bookCounts}</td>
                        <td>${book.detail}</td>
                    </tr>
                </c:forEach>
                <a href="allBook.jsp">返回</a>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>