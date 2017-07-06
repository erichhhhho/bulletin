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

/**
 * @Project：${project_name}
 * @File：${type_name}
 * @Author：何唯 （Erichhhhho）
 * @Date：11:15 2017/7/6
 * @Description：
 */
@WebServlet(name = "EditMessageServlet",value = "/EditMessageServlet")
public class EditMessageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.valueOf(request.getParameter("id"));
        String content = new String(request.getParameter("content").getBytes("ISO-8859-1"),"UTF-8");
        Connection conn = DBConfig.getConnection();
        String sql = "update message set content=? where id=?";
        try {
            PreparedStatement state = conn.prepareStatement(sql);
            state.setString(1, content);
            state.setInt(2, id);
            if (state.executeUpdate()>=1) {
                request.setAttribute("msg", "修改成功！");
            } else {
                request.setAttribute("msg", "修改失败！");
            }
            request.getRequestDispatcher("bulletin.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
