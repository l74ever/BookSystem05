package org.whc.controller;

import org.whc.pojo.Books;
import org.whc.service.BookService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/updateBook")
public class BookUpdateServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取前端传输的书籍编号，书籍名称，书籍数量，书籍详情
        int bookID = Integer.parseInt(request.getParameter("bookID"));
        String bookName = request.getParameter("bookName");
        int bookCounts = Integer.parseInt(request.getParameter("bookCounts"));
        String detail = request.getParameter("detail");
        if (bookID == 0||bookName == null ||bookName.equals("") ||bookCounts == 0 || detail.equals("")||detail == null){
            request.getRequestDispatcher("addBook.jsp").forward(request,response);
            request.getSession().setAttribute("Message", "字段不能为空");
        }
        Books books = new Books();
        books.setBookID(bookID);
        books.setBookName(bookName);
        books.setBookCounts(bookCounts);
        books.setDetail(detail);
        //调用BookService完成删除操作
        BookService bookService = new BookService();
        int success = bookService.updateBook(books);
        List<Books> booksList = bookService.allBook();
        if (success == 1){
            //将消息模型中的用户消息设置到session作用域中
            request.getSession().setAttribute("successMessage", "书籍更新成功");
            request.getSession().setAttribute("booksList",booksList);
            response.sendRedirect("allBook.jsp");
        }else {
            // 删除失败，进行页面跳转或返回失败信息
            request.getRequestDispatcher("updateBook.jsp").forward(request,response);
            request.getSession().setAttribute("successMessage", "书籍更新失败");
        }


    }
}
