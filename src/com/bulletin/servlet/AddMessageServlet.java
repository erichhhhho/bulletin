package com.bulletin.servlet;

import com.bulletin.config.DBConfig;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;

/**
 * @Project：${project_name}
 * @File：${type_name}
 * @Author：何唯 （Erichhhhho）
 * @Date：11:10 2017/7/6
 * @Description：
 */
@WebServlet(name = "AddMessageServlet",value = "/AddMessageServlet")
public class AddMessageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String content = new String(request.getParameter("content").getBytes("ISO-8859-1"),"UTF-8");
        Date time=new Date();
       if(content==null||content.equals(""))
       {
           request.setAttribute("msg", "留言内容不能为空！");
           request.getRequestDispatcher("bulletin.jsp").forward(request, response);
           return;
       }
        int userId = (int) request.getSession().getAttribute("userid");

        Connection conn = DBConfig.getConnection();
        String sql = "insert into message(userid,content,time) values(?,?,?)";
        try {
            PreparedStatement state = conn.prepareStatement(sql);
            state.setInt(1, userId);
            state.setString(2, content);
            state.setTimestamp(3,new java.sql.Timestamp(time.getTime()));
            state.execute();
            request.setAttribute("msg", "留言成功！");
            request.getRequestDispatcher("bulletin.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
