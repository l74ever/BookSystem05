package org.whc.service;

import org.apache.ibatis.session.SqlSession;
import org.whc.mapper.UserMapper;
import org.whc.pojo.User;
import org.whc.pojo.vo.MessageModel;
import org.whc.utils.MyBatisUtils;
import org.whc.utils.StringUtil;

import java.io.IOException;

/**
 * 业务逻辑
 */
/**
 * 用户登录
 *  1.参数的非空判断
 *      如果参数为空
 *      将状态码、提示信息、回显数据设置到消息模型对象中，返回消息模型对象
 *  2.调用mapper层的查询方法，通过用户名查询用户对象
 *  3.判断用户对象是否为空
 *      如果为空，将状态码、提示信息、回显数据设置到消息模型对象中，返回消息模型对象
 *  4.判断数据库中查询的用户密码与前台传递过来的密码作比较
 *      如果不相等，将状态码、提示信息、回显数据设置到消息模型对象中，返回消息模型对象
 *  5.登录成功，成功状态、提示信息、用户对象设置消息模型对象 return
 */
public class UserService {

    public static MessageModel userLogin(String uname, String upwd) throws IOException {
        MessageModel messageModel = new MessageModel();

        //回显数据
        User u = new User();
        u.setUserName(uname);
        u.setUserPwd(upwd);


        //1.参数的非空判断
        if (StringUtil.isEmpty(uname)||StringUtil.isEmpty(upwd)){
            //将状态码、提示信息、回显数据设置到消息模型对象中，返回消息模型对象
            messageModel.setCode(0);
            messageModel.setMsg("用户姓名和密码不能为空！");

            return messageModel;

        }
        //2.调用mapper层的查询方法，通过用户名查询用户对象
        SqlSession session = MyBatisUtils.getSession();
        UserMapper userMapper = session.getMapper(UserMapper.class);
        User user = userMapper.querUserByName(uname);

        //3.判断用户对象是否为空
        if (user == null){
            //将状态码、提示信息、回显数据设置到消息模型对象中，返回消息模型对象
            messageModel.setCode(0);
            messageModel.setMsg("用户姓名不能为空！");

            return messageModel;
        }
        //4.判断数据库中查询的用户密码与前台传递过来的密码作比较
        if (!upwd.equals(user.getUserPwd())){
            //如果不相等，将状态码、提示信息、回显数据设置到消息模型对象中，返回消息模型对象

            messageModel.setCode(0);
            messageModel.setMsg("用户密码不正确!");
            return messageModel;
        }
        //登录成功，将用户信息设置到消息模型中
        messageModel.setCode(1);
        messageModel.setMsg("登录成功");
        messageModel.setObject(user);
        return messageModel;
    }
}
