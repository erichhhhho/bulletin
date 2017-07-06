package com.bulletin.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @Project：${project_name}
 * @File：${type_name}
 * @Author：何唯 （Erichhhhho）
 * @Date：11:50 2017/7/6
 * @Description：
 */
@WebServlet(name = "LogoutServlet",value = "/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        HttpSession session=request.getSession(false);
        if(session!=null){
            session.removeAttribute("user");
            session.removeAttribute("userid");
            session.removeAttribute("vcode");
        }


        response.sendRedirect("index.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doPost(request, response);
    }
}
