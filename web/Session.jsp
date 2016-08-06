<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: SHIKUN
  Date: 2016/8/5
  Time: 14:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>session实例</title>
</head>
<body>
<%
    String[] users = {"admin","liubin","dywdyw"};
    String user = null;
    String logined = null;
    Date createTime,lastAccessTime;

    if (request.getParameter("user")!=null){
        user = request.getParameter("user");
    }else{
        out.println("对不起，请在请求参数中附加用户帐号!");
        return;
    }
    for (int i=0;i<users.length;i++){
        if (users[i].equalsIgnoreCase(user)){
            session.setAttribute("logined","yes");
        }
    }

    out.println(session.getAttribute("logined").toString());
    if (session.getAttribute("logined")!= null){
        logined = session.getAttribute("logined").toString();
        if (logined.equals("yes")){
            createTime = new Date(session.getCreationTime());
            lastAccessTime = new Date(session.getLastAccessedTime());
            out.println("恭喜您登录成功!<br>");
            out.println("您的SessionID为："+session.getId()+"<br>");
            out.println("创建时间为："+createTime+"<br>");
            out.println("最后的访问时间为："+lastAccessTime+"<br>");
            out.println("最大不活动时间间隔为："+session.getMaxInactiveInterval()+"秒<br>");
        }
        else{
            out.println("对不起，您的帐号无效!");
        }
    }else{
        out.println("对不起，您的帐号无效!");
    }
%>

</body>
</html>
