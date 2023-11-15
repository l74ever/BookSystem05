package org.whc.controller;

import org.whc.pojo.vo.MessageModel;
import org.whc.service.BookService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/queryBook")
public class BookqueryServlet extends HttpServlet {
    //实例化BookService对象
    private BookService bookService = new BookService();

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.接收客户端的请求（接收参数：图书名称）
        String bookName = request.getParameter("bookName");
        //2.调用service层的方法，返回消息模型对象
        MessageModel messageModel = bookService.bookQuery(bookName);
        //3.判断消息模型的状态码
        if (messageModel.getCode() == 1){
            //将消息模型中的用户消息设置到session作用域中
            request.getSession().setAttribute("booksList",messageModel.getObject());
            response.sendRedirect("queryBook.jsp");
        }else {
            //失败，将消息模型中的用户消息设置到request作用域中
            request.setAttribute("messageModel",messageModel);
            request.getRequestDispatcher("queryBook.jsp").forward(request,response);
        }
    }
}
