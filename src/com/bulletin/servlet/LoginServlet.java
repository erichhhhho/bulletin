package com.bulletin.servlet;

import com.bulletin.Bean.User;
import com.bulletin.config.DBConfig;
import com.bulletin.security.Encrypter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

/**
 * @Project：${project_name}
 * @File：${type_name}
 * @Author：何唯 （Erichhhhho）
 * @Date：1:17 2017/7/6
 * @Description：
 */
@WebServlet(name = "LoginServlet",value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
// 用户登录检查/////////////
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        Object o = session.getAttribute("user");

        if(o!=null&&o!=""){
            response.sendRedirect("bulletin.jsp");
            System.out.print(o);
        }
        else
        {
            String nickname = request.getParameter("nickname");
            String password = request.getParameter("passwd");
            String vocode = request.getParameter("vcode");


            // 验证码
            String vocode1 = (String)request.getSession().getAttribute("vcode");
            if (!vocode.equals(vocode1)) {
                request.setAttribute("msg", "wrong vcode！");
                request.getRequestDispatcher("/").forward(request, response);
                return;
            }
            request.getSession().setAttribute("vcode","");

            //
            Connection conn = null;
            conn = DBConfig.getConnection();
            Statement statement = null;
            ResultSet rs = null ;
            try {
                statement = conn.createStatement();
                String sql = "select * from user where nickname='"+nickname+"'";
                rs = statement.executeQuery(sql);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                if (rs!=null && rs.next()) {
                    int id = rs.getInt("id");
                    String password1 = rs.getString("password");

                    password = Encrypter.md5Encrypt(password);

                    User user=new User(id,nickname,password);
                    if (password.equals(password1)) {

                        request.getSession().setAttribute("user", user);
                        request.getSession().setAttribute("userid", user.getId());
                        // 登录成功
                        Cookie cookie = new Cookie("userid", id+"");
                        Cookie cookie2 = new Cookie("name", nickname);
                        response.addCookie(cookie);
                        response.addCookie(cookie2);


                        //session.setAttribute("AppointmentByLocation",AppointmentByLocation);
                        request.getRequestDispatcher("/bulletin.jsp").forward(request, response);
                        return;
                    }else {
                        request.setAttribute("msg", "wrong password！");
                        request.getRequestDispatcher("/").forward(request, response);
                    }
                }else {
                    request.setAttribute("msg", "no such user");
                    request.getRequestDispatcher("/").forward(request, response);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    rs.close();
                    statement.close();
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
    }}

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doPost(request, response);
    }
}
