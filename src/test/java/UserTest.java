import org.apache.ibatis.session.SqlSession;
import org.whc.mapper.UserMapper;
import org.whc.pojo.User;
import org.whc.utils.MyBatisUtils;

import java.io.IOException;

public class UserTest {
    public static void main(String[] args) throws IOException {
        SqlSession session = MyBatisUtils.getSession();
        UserMapper userMapper = session.getMapper(UserMapper.class);
        User user = userMapper.querUserByName("admin");
        System.out.println(user.toString());
    }
}
