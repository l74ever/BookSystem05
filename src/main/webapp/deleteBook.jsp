<%@ page import="org.whc.service.BookService" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>删除书籍</small>
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
                        <input type="text" class="form-control" id="bookID" name="bookID" value="${book.bookID}" readonly>
                    </div>
                </div>
                <div class="form-group">
                    <label for="bookName" class="col-sm-2 control-label">书籍名称：</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="bookName" name="bookName" value="${book.bookName}" readonly>
                    </div>
                </div>
                <div class="form-group">
                    <label for="bookCounts" class="col-sm-2 control-label">书籍数量：</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="bookCounts" name="bookCounts" value="${book.bookCounts}" readonly>
                    </div>
                </div>
                <div class="form-group">
                    <label for="detail" class="col-sm-2 control-label">书籍详情：</label>
                    <div class="col-sm-10">
                        <textarea class="form-control" id="detail" name="detail" readonly>${book.detail}</textarea>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-danger"> 确认删除 </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>