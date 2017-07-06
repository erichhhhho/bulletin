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
 * @Date：11:13 2017/7/6
 * @Description：
 */
@WebServlet(name = "DeleteMessageServlet",value = "/DeleteMessageServlet")
public class DeleteMessageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.valueOf(request.getParameter("id"));
        Connection conn = DBConfig.getConnection();
        String sql = "delete from message where id=?";
        try {
            PreparedStatement state = conn.prepareStatement(sql);
            state.setInt(1, id);
            if (state.executeUpdate()>=1) {
                request.setAttribute("msg", "删除成功!");
            } else {
                request.setAttribute("msg", "删除失败!");
            }
            request.getRequestDispatcher("bulletin.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
