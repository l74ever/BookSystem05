package org.whc.controller;

import org.whc.pojo.Books;
import org.whc.service.BookService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addBook")
public class BookAddServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        //获取前端传输的书籍名称，书籍数量，书籍详情
        String bookName = request.getParameter("bookName");
        String bookCountsStr = request.getParameter("bookCounts");
        String detail = request.getParameter("detail");
        if (bookName == null ||bookName.equals("") ||bookCountsStr == null || bookCountsStr.equals("")|| detail.equals("")||detail == null){
            request.getRequestDispatcher("addBook.jsp").forward(request,response);
            request.getSession().setAttribute("Message", "字段不能为空");
        }
        Books books = new Books();
        books.setBookName(bookName);
        books.setBookCounts(Integer.parseInt(bookCountsStr));
        books.setDetail(detail);
        //调用BookService完成删除操作
        BookService bookService = new BookService();
        int success = bookService.addBook(books);
//      List<Books> booksList = bookService.allBook();
        if (success == 1){
            //将消息模型中的用户消息设置到session作用域中
            request.getSession().setAttribute("successMessage", "书籍添加成功");
            response.sendRedirect("allBook.jsp");
        }else {
            // 添加失败，进行页面跳转或返回失败信息
            request.getSession().setAttribute("successMessage", "书籍添加失败");
            request.getRequestDispatcher("addBook.jsp").forward(request,response);
        }


    }
}
