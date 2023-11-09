import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.whc.mapper.BookMapper;
import org.whc.pojo.Books;
import org.whc.pojo.Category;
import org.whc.utils.MyBatisUtils;

import java.io.IOException;
import java.util.List;

public class MyBatisTest {
    @Test
    public void queryAllBookTest() throws IOException {
        SqlSession session = MyBatisUtils.getSession();
        List<Books> books = session.selectList("org.whc.mapper.BookMapper.queryAllBook");
        for (Books book: books) {
            System.out.println(book.toString());
        }
        session.close();
    }
    @Test
    public void findBookTest() throws IOException {
        SqlSession session = MyBatisUtils.getSession();
        Books books = session.selectOne("org.whc.mapper.BookMapper.queryBookById",1);

        System.out.println(books.toString());
        session.close();
    }
    @Test
    public void insertBookTest() throws IOException {
        SqlSession session = MyBatisUtils.getSession();
        Books books = new Books();
        books.setBookID(4);
        books.setBookName("Python");
        books.setBookCounts(200);
        books.setDetail("从入门到入牢");
        BookMapper mapper = session.getMapper(BookMapper.class);
        int result = mapper.insertBook(books);

        if (result > 0){
            System.out.println("成功插入" + result + "条数据");
        }else {
            System.out.println("更新数据失败");
        }
        System.out.println(books.toString());
        session.commit();
        session.close();
    }
}
