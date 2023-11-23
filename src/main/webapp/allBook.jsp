<%@ page import="java.util.List" %>
<%@ page import="org.whc.pojo.Books" %>
<%@ page import="org.whc.utils.MyBatisUtils" %>
<%@ page import="org.apache.ibatis.session.SqlSession" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%-- 加isELIgnored 防止jsp页面无法解析EL表达式 --%>
<%@page isELIgnored="false" %>
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
        <div class="col-md-3 column">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/allBook.jsp">&nbsp;刷新全部书籍&nbsp;</a>
        </div>
        <div class="col-md-2 column">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/addBook.jsp">&nbsp;新增书籍&nbsp;</a>
        </div>
            <div class="col-md-2 column">
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/deleteBook.jsp">&nbsp;删除书籍&nbsp;</a>
            </div>
            <div class="col-md-2 column">
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/updateBook.jsp">&nbsp;更新书籍&nbsp;</a>
            </div>
        <%--查询--%>
        <div class="col-md-3 column">
            <form action="${pageContext.request.contextPath}/queryBook.jsp" method="post" class="form-inline">
                <button type="submit" class="btn btn-primary" style="vertical-align: top">&nbsp;查询图书点此处&nbsp;</button>
            </form>
        </div>

    </div>
    <%
        SqlSession session1 = MyBatisUtils.getSession();


        List<Books> books = session1.selectList("org.whc.mapper.BookMapper.queryAllBook");
        for(Books book : books){
            System.out.println(book.toString());
        }
        request.setAttribute("booksList",books);
        session1.close();
    %>

    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>书籍编号</th>
                    <th>书籍名字</th>
                    <th>书籍数量</th>
                    <th>书籍详情</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="books" items="${booksList}">

                    <tr>
                        <td>${books.bookID}</td>
                        <td>${books.bookName}</td>
                        <td>${books.bookCounts}</td>
                        <td>${books.detail}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

</div>
