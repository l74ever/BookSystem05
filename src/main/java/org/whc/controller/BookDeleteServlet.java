package org.whc.controller;

import org.whc.pojo.vo.MessageModel;
import org.whc.service.BookService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteBook")
public class BookDeleteServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取待删除的书籍编号
        int bookID = Integer.parseInt(request.getParameter("bookID"));

        //调用BookService完成删除操作
        BookService bookService = new BookService();
        int success = bookService.deleteBook(bookID);
        if (success == 1){
            //将消息模型中的用户消息设置到session作用域中
            request.getSession().setAttribute("successMessage", "书籍删除成功");
            response.sendRedirect("allBook.jsp");
        }else {
            // 删除失败，进行页面跳转或返回失败信息
            request.getRequestDispatcher("deleteBook.jsp").forward(request,response);
            request.getSession().setAttribute("successMessage", "书籍删除失败");
        }


    }
}
