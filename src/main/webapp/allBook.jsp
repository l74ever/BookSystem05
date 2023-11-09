<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>书籍列表</title>
    <!-- 引入 Bootstrap -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">

</head>

<body>

<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>书籍列表 —— 显示所有书籍</small>
                </h1>
            </div>
        </div>
    </div>

    <div class="row">
        <%--新增--%>
        <div class="col-md-4 column">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/allBook">&nbsp;全部书籍&nbsp;</a>
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/toAddBook">&nbsp;新增书籍&nbsp;</a>
        </div>
        <div class="col-md-4"></div>
        <%--查询--%>
        <div class="col-md-4 column" style="text-align: right">
            <form action="${pageContext.request.contextPath}/queryBook" method="post" class="form-inline">
                <div class="form-group">
                    <%--                    <span style="color: red">未查询到任何结果</span>--%>
                    <label>
                        <input type="text" class="form-control" name="bookName" placeholder="请输入要查询的书籍名称">
                    </label>
                </div>
                <button type="submit" class="btn btn-primary" style="vertical-align: top">&nbsp;查询&nbsp;</button>
            </form>
        </div>

    </div>

    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>书籍编号</th>
                    <th>书籍名字</th>
                    <th>书籍数量</th>
                    <th>书籍详情</th>
                    <th>操作</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="book" items="${booksList}">
                    <tr>
                        <td>${book.bookID}</td>
                        <td>${book.bookName}</td>
                        <td>${book.bookCounts}</td>
                        <td>${book.detail}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/toUpdateBook/${book.bookID}">更改</a>
                            |
                            <a href="${pageContext.request.contextPath}/deleteBook/${book.bookID}">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

</div>
