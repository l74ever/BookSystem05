package org.whc.service;

import org.apache.ibatis.session.SqlSession;
import org.whc.mapper.BookMapper;
import org.whc.pojo.Books;
import org.whc.pojo.vo.MessageModel;
import org.whc.utils.MyBatisUtils;
import org.whc.utils.StringUtil;

import java.io.IOException;
import java.util.List;


public class BookService {
    public static MessageModel bookQuery(String bookName) throws IOException {
        MessageModel messageModel = new MessageModel();

        //回显数据
        Books b = new Books();
        b.setBookName(bookName);


        //1.参数的非空判断
        if (StringUtil.isEmpty(bookName)){
            //将状态码、提示信息、回显数据设置到消息模型对象中，返回消息模型对象
            messageModel.setCode(0);
            messageModel.setMsg("查询数据不能为空！");

            return messageModel;
        }
        //2.调用mapper层的查询方法，通过bookName来查询图书对象
        SqlSession session = MyBatisUtils.getSession();
        BookMapper bookMapper = session.getMapper(BookMapper.class);
        List<Books> books = bookMapper.queryBookName(b.getBookName());

        //3.查询成功，将图书信息设置到消息模型中
        messageModel.setCode(1);
        messageModel.setMsg("查询成功");
        messageModel.setObject(books);
        return messageModel;
    }

    public int deleteBook(int bookID) throws IOException {
        //调用mapper层的查询方法，通过bookID来删除图书对象
        SqlSession session = MyBatisUtils.getSession();
        BookMapper bookMapper = session.getMapper(BookMapper.class);
        int success = bookMapper.deleteBook(bookID);
        session.commit();
        session.close();
        return success;
    }

    public int updateBook(Books books) throws IOException {
        //调用mapper层的查询方法，通过books对象来更新图书对象
        SqlSession session = MyBatisUtils.getSession();
        BookMapper bookMapper = session.getMapper(BookMapper.class);
        int success = bookMapper.updateBook(books);
        session.commit();
        session.close();
        return success;
    }

    public List<Books> allBook() throws IOException {
        //调用mapper层的查询方法，通过books对象来更新图书对象
        SqlSession session = MyBatisUtils.getSession();
        BookMapper bookMapper = session.getMapper(BookMapper.class);
        List<Books> booksList = bookMapper.queryAllBook();
        session.close();
        return booksList;
    }

    public int addBook(Books books) throws IOException {
        //调用mapper层的查询方法，通过books对象来更新图书对象
        SqlSession session = MyBatisUtils.getSession();
        BookMapper bookMapper = session.getMapper(BookMapper.class);
        int success = bookMapper.insertBook(books);
        session.commit();
        session.close();
        return success;
    }
}
