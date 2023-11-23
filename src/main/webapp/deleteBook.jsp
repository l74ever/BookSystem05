<%@ page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="org.whc.utils.MyBatisUtils" %>
<%@ page import="org.whc.pojo.Books" %>
<%@ page import="java.util.List" %>
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
    <title>删除书籍</title>
    <!-- 引入 Bootstrap -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>删除书籍--根据编号删除图书</small>
                </h1>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <form action="${pageContext.request.contextPath}/deleteBook" method="post" class="form-horizontal">

                <div class="form-group">
                    <label for="bookID" class="col-sm-2 control-label">书籍编号：</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="bookID" name="bookID" value="${book.bookID}" >
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-danger" onclick="return confirm('确定要删除该书籍吗？')"> 确认 </button>
                        <a href="allBook.jsp" class="btn btn-success">返回</a>
                    </div>
                    <c:if test="${not empty successMessage}">
                        <span style="color: red">${successMessage}</span>
                    </c:if>
                </div>
            </form>
        </div>
    </div>
</div>
<%
    SqlSession session1 = MyBatisUtils.getSession();

    List<Books> books = session1.selectList("org.whc.mapper.BookMapper.queryAllBook");
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
</body>
</html>