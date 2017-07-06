<%--
  Created by IntelliJ IDEA.
  User: q
  Date: 2017/7/6
  Time: 11:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>修改留言</title>
    <link rel="stylesheet" href="style.css">
    <style type="text/css">
        .login{
            width: 320px;;
        }
    </style>
</head>
<body>
<%
    int id = Integer.valueOf(request.getParameter("id"));
//String content = request.getParameter("content");

    String content =  new String(request.getParameter("content").getBytes("ISO-8859-1"),"UTF-8");

%>
<section>
    <div class="login">
        <div class="title">
            修改留言
        </div>
        <form action="EditMessageServlet" method="post">
            <input name="id" type="hidden" value='<%=id %>'>
            <table>
                <tr>
                    <td><textarea name="content" rows="5" cols="40"><%=content %></textarea></td>
                </tr>
                <tr>
                    <td>
                        <button>修改</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</section>
</body>
</html>
