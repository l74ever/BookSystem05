package org.whc.controller;

import org.whc.pojo.vo.MessageModel;
import org.whc.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/register")
public class UserRegisterServlet extends HttpServlet {
    //实例化UserService对象
    private  UserService userService = new UserService();
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 从注册页面获取用户输入的注册信息
        String uName = request.getParameter("uName");
        String uPwd = request.getParameter("uPwd");
        // 调用 UserService 的注册方法
        MessageModel messageModel = userService.registerUser(uName, uPwd);

        if (messageModel.getCode()==1) {
            // 注册成功，跳转到注册成功页面
            response.sendRedirect("registerSuccess.jsp");
        } else {
            // 注册失败，跳转到注册失败页面
            response.sendRedirect("registerFail.jsp");
        }
    }
}
