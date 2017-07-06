<%--
  Created by IntelliJ IDEA.
  User: q
  Date: 2017/7/6
  Time: 1:25
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.bulletin.config.DBConfig"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>This is Bulletin Management Page</title>
</head>
<body>
<div class="title">
    <table>
        <tr>
            <td>

                    欢迎 ${user.nickname}
                    <a href="LogoutServlet">退出登录</a>


            </td>
        </tr>
    </table>
</div>

<%
    String nickname = (String)session.getAttribute("nickname");

// 读取留言数据
    Connection conn = DBConfig.getConnection();
    Statement statement = conn.createStatement();
    String sql = "SELECT m.id, u.nickname, m.time,m.content from message m,user u where m.userid=u.id order by id asc limit 0,50";
    ResultSet rs = statement.executeQuery(sql);
%>

<section>
    <div class="login">
        <div class="title">
            留言板
        </div>
        <p class="red">${msg }</p><br>
        <table>
            <tr>
                <th>留言内容</th>
                <th>留言人</th>
                <th>留言时间</th>
                <th>操作</th>
            </tr>
            <%
                while(rs.next()){
                    String a1 = "<a href='DeleteMessageServlet?id="+rs.getInt("id")+"'>删除</a> ";
                    String a2 = "<a href='editmessage.jsp?id="+rs.getInt("id")+"&content="+rs.getString("content")+"'>修改</a>";
                    Timestamp date=rs.getTimestamp("time");
                    out.print("<tr><td><p>"+rs.getString("content")+"</p></td><td>"+rs.getString("nickname")+"</td><td>"+date +"</td><td>"+a1+a2+"</td></tr>");
                }
            %>
        </table>
        <br>
        <form action="AddMessageServlet" method="post">
            <table>
                <tr>
                    <td><textarea name="content" rows="5" cols="40"></textarea></td>
                </tr>
                <tr>
                    <td>
                        <button>确定</button>
                    </td>
                </tr>

            </table>
        </form>
    </div>
</section>
</body>
</html>
