<%@ page import="java.sql.Connection" %>
<%@ page import="com.bulletin.config.DBConfig" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Date" %>
<%@page language="java" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/jquery-labelauty.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js"></script>

    <title>登录</title>
    <style type="text/css">

        <!--

        A{TEXT-DECORATION: none;}
        A:link {COLOR: #333333; text-decoration: none}
        A:visited {COLOR: #333333; text-decoration: none}
        A:active {COLOR: #800080; text-decoration: none}
        A:hover {COLOR: #F57E20; text-decoration: none; position: relative; right: 0px; top: 1px }
        body {
            margin-left: 0px;
            margin-top: 0px;
            margin-right: 0px;
            margin-bottom: 0px;
            background-color: #d1edf9;

            background-repeat: no-repeat;
            background-position:50% 20%;
        }
        .tt{
            font-family: "宋体", "新宋体";
            font-size: 14px;
        }
        .mid_bg {
            background-repeat: no-repeat;
            background-position: center bottom;
            height: 570px;
        }
        .td_mid {
            background-repeat: no-repeat;
            background-position: center bottom;
            height: 550px;
            width: 970px;
        }
        .textarea {
            height: 82px;
            width: 637px;
            SCROLLBAR-FACE-COLOR: #83c9f0;
            SCROLLBAR-HIGHLIGHT-COLOR: #edf9ff;
            SCROLLBAR-SHADOW-COLOR: #5fbdf1;
            SCROLLBAR-3DLIGHT-COLOR: #dddddd;
            SCROLLBAR-ARROW-COLOR: #8107acc;
            SCROLLBAR-TRACK-COLOR: #ffffff;
            SCROLLBAR-DARKSHADOW-COLOR: #399dd4;
            SCROLLBAR-BASE-COLOR: #83c9f0;
            background-color: #b5e3fa;
            font-family: "宋体", "新宋体";
            font-size: 14px;
            color: #000000;
            border: 1px solid #7f9db9;
        }



        .text01 {
            font-family: "宋体", "新宋体";
            font-size: 14px;
            color: #5890F0;
        }
        .z1 {
            font-size: 14px;
            color: #000000;
            filter: DropShadow(Color=#000000, OffX=1, OffY=1, Positive=true);
        }

        -->

    </style>

    <script language="javascript">
        function openwin() {
            <!--window.open("register.jsp", "_blank", "height=450px, width=400px,top=150px,left=450px,status=no,scrollbars=no");-->
            window.open("register.jsp", "_self");
        }

        function SetFocus()
        {
            if (document.Login.UserName.value == "")
                document.Login.UserName.focus();
            else
                document.Login.UserName.select();
        }

        function CheckForm()
        {
            if (document.Login.UserName.value == "")
            {
                alert("请输入用户名！");
                document.Login.UserName.focus();
                return false;
            }
            if (document.Login.Password.value == "")
            {
                alert("请输入密码！");
                document.Login.Password.focus();
                return false;
            }
            if (document.Login.verifycode.value == "")
            {
                alert("请输入验证码！");
                document.Login.verifycode.focus();
                return false;
            }
        }

    </script>
</head>
<body  background="images/bg1.jpg">
${msg}
<table width="100%" cellspacing="0" cellpadding="0" border="0" height="100%">
    <tbody><tr valign="middle">
        <td>
            <table name="table1"width="100%" cellspacing="0" cellpadding="0" border="0">
                <!--<tr>
                  <td height="100" bgcolor="#f8f8f8">&nbsp;</td>
                </tr>-->
                <tbody><tr valign="middle">
                    <td class="mid_bg" valign="middle"><table class="td_mid" cellspacing="0" cellpadding="0" border="0" align="center">
                        <tbody><tr>
                            <td width="330">
                                <table name="table2" width="100%" cellspacing="0" cellpadding="0" border="0" height="534">
                                    <tbody><tr>
                                        <td valign="top" align="left">
                                            <table name="table3" width="180" cellspacing="0" cellpadding="0" border="0">
                                                <tbody><tr><td valign="middle">
                                                </td></tr>
                                                </tbody></table>
                                        </td>
                                    </tr>
                                    </tbody></table>
                            </td>
                            <td width="675">
                                <table width="100%" cellspacing="0" cellpadding="0" border="0" height="534">
                                <tbody><tr>
                                    <td valign="top" align="right" height="160"><table width="220" cellspacing="0" cellpadding="0" border="0">
                                        <tbody>

                                        <tr>
                                            <td width="30%">
                                                <button type="button" class="btn btn-primary btn-sm" onclick="window.location.href='intro.html'">
                                                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp;使用指南
                                                </button>
                                            </td>

                                            <td width="5%">
                                                &nbsp;
                                            </td>

                                            <td width="30%">
                                                <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal">
                                                    <span class="glyphicon glyphicon-cloud" aria-hidden="true"></span>&nbsp;关于本站
                                                </button>

                                                <!-- Modal -->
                                                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                                    <div class="modal-dialog" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                                <h4 class="modal-title" id="myModalLabel">联系方式</h4>
                                                            </div>

                                                            <div class="modal-body">
                                                                <table align="center">

                                                                    <tr align="center">
                                                                        <th>联系人名字</th>
                                                                        <th>&nbsp;</th>
                                                                        <th>Email地址</th>
                                                                    </tr>
                                                                    <tr align="center">
                                                                        <td>
                                                                            XXX
                                                                        </td>
                                                                        <td>
                                                                            &nbsp;
                                                                        </td>
                                                                        <td>
                                                                            xxx@scau.edu.cn
                                                                        </td>
                                                                    </tr>
                                                                </table>

                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                            </td>

                                            <td width="5%">
                                                &nbsp;
                                            </td>

                                            <td width="30%">
                                                <!-- Button trigger modal -->
                                            <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal3">
                                            <span class="glyphicon glyphicon-phone-alt"  aria-hidden="true"></span>&nbsp;联系我们
                                             </button>

                                                <!-- Modal -->
                                             <div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                                 <div class="modal-dialog" role="document">
                                                  <div class="modal-content">
                                                     <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                             <h4 class="modal-title" id="myModalLabel1">联系方式</h4>
                                                     </div>

                                                    <div class="modal-body">
                                                    <table align="center">

                                                        <tr align="center">
                                                            <th>联系人名字</th>
                                                            <th>&nbsp;</th>
                                                            <th>Email地址</th>
                                                        </tr>
                                                        <tr align="center">
                                                            <td>
                                                                XXX
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                                xxx@scau.edu.cn
                                                            </td>
                                                        </tr>
                                                    </table>

                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                </div>

                                        </div>
                                    </div>
                                </div></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right"><table width="415" cellspacing="0" cellpadding="0" border="0" height="140">
                                        <tbody>
                                        <tr>
                                            <td>
                                                <iframe name="checkframe" id="checkframe" marginheight="0" marginwidth="0" scrolling="auto" width="0" height="0" frameborder="0">
                                                </iframe>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                <form  name="Login" action="LoginServlet" method="post" onsubmit="return CheckForm();" >
                                                    <table   class="p9" width="100%" cellspacing="4" cellpadding="0" border="0">
                                                        <tbody>
                                                        <tr>
                                                            <td width="77"  height="40" align="center" valign="center"> <label for="cx">身&nbsp;&nbsp;份</label><span class="glyphicon glyphicon-tower" aria-hidden="true"></span></td>
                                                            <td width="149" height="40" align="center" valign="center">
                                                                <select name="cx" class="form-control input-sm" id="cx">
                                                                    <option value="student">学生</option>
                                                                    <option value="teacher">教师</option>
                                                                    <option value="superuser">管理员</option>
                                                                </select>
                                                            </td>
                                                            <td width="209" height="40">&nbsp;</td>
                                                        </tr>

                                                        <tr>
                                                            <td width="77" height="40" align="center" valign="center"><label for="nickname">账&nbsp;&nbsp;号</label><span class="glyphicon glyphicon-user" aria-hidden="true"></span></td>
                                                            <td width="149" height="40" align="center" valign="center"><input name="nickname" id="nickname" class="form-control input-sm" type="text" placeholder="填写工号"></td>
                                                            <td width="209">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td width="77" height="40" align="center" valign="center"><label for="passwd">密&nbsp;&nbsp;码</label><span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span></td>
                                                            <td align="left" height="40" align="center" valign="center"><input name="passwd" id="passwd" class="form-control input-sm" type="password" placeholder="填写密码"></td>
                                                            <td align="left"></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="77" height="40" align="center" valign="center"><label for="vcode">验证码</label><span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span></td>
                                                            <td align="left" height="40" align="center" valign="center"><input name="vcode" id="vcode" maxlength="6" size="6" type="text" class="form-control input-sm" placeholder="输入验证码">


                                                            <td align="left">&nbsp;&nbsp; <span class="text01">
                                                                                                    <!-- <img style="cursor:hand;" src="file/login_img/verifycode.bmp" onclick="this.src = this.src;" align="absmiddle"></span>&nbsp;</td>   -->
                                                                    <img alt="点击图片刷新" id="checkImg" src="GetCaptcha" onClick="document.getElementById('checkImg').src='GetCaptcha?temp='+ (new Date().getTime().toString(36)); return false">
                                                                </span>&nbsp;</td></td>
                                                        </tr>

                                                        <tr>
                                                            <td></td>
                                                            <td align="center" valign="bottom"><input name="Submit" class="btn btn-default" value="登 录" style="cursor:hand" type="submit">&nbsp;
                                                                <input name="reset" class="btn btn-default" value="重 置" style="cursor:hand" type="reset"></td>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </form>
                                            </td>
                                        </tr>
                                        <tr>
                                        </tr>
                                        </tbody></table></td>
                                </tr>
                                <tr>
                                    <td align="left" height="114">
                                        <!--            <iframe class="textarea" frameborder=1 src="description.htm"></iframe>  -->

                                        <%

                                            Connection conn = DBConfig.getConnection();
                                            Statement statement = conn.createStatement();
                                            String sql = "SELECT time,content from message";
                                            ResultSet rs = statement.executeQuery(sql);
                                        %>


                                        <marquee class="tt" direction="up" onmouseover="this.stop()" onmouseout="this.start()" scrolldelay="68" scrollamount="1" height="100">

                                            <table bgcolor="" class="set1" >
                                                <caption><h3 style="color: black">系统公告</h3></caption>
                                                <tbody>

                                                <%
                                                    while(rs.next()){
                                                        String str=rs.getString("content");
                                                        Date time=rs.getDate("time");
                                                        out.print("<tr><td><div class=\"tt\"><span class=\"glyphicon glyphicon-exclamation-sign\" style=\"color: black\" aria-hidden=\"true\"></span>&nbsp;"+time+"&nbsp;</div></td><td><div class=\"tt\"></div>"+str+"</td></tr>");
                                                    }
                                                %>

                                                </tbody></table>
                                        </marquee></td>
                                </tr>
                                </tbody></table></td>
                        </tr>
                        </tbody></table></td>
                </tr>
                <tr>
                    <td class="text01" align="center"><h4>成绩管理系统&nbsp;&nbsp;华南农业大学&nbsp;&nbsp;</h4>
                        <script language="javascript" type="text/javascript" src="14973137.js"></script><br>
                        <%--<%@ include file="copyright.jsp"%>--%>
                        <noscript><a href="http://www.scaut.edu.cn" target="_blank"><img
                                alt="&#x6211;&#x8981;&#x5566;&#x514D;&#x8D39;&#x7EDF;&#x8BA1;"src="www.scau.edu.cn"
                                style="border:none" /></a></noscript>
                    </td>
                </tr>
                </tbody></table>
        </td>
    </tr>
    </tbody></table>
</body>
</html>
