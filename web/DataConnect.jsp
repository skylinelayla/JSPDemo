<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: SHIKUN
  Date: 2016/8/5
  Time: 22:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>数据库连接测试</title>
</head>
<body>

<%
    Connection con=null;
    Statement state=null;
    ResultSet rs = null;

    Context ctx = new InitialContext();
    Context envContext = (Context) ctx.lookup("java:/comp/env");
    DataSource ds = (DataSource) envContext.lookup("jdbc/myDataSource");
    con = ds.getConnection();
   // con.close();
   // out.println("<span style='color:red;'>JNDI测试成功<span>");


    String sql = "select * from t_user";
    try {
        state.executeQuery(sql);
        while (rs.next()) {
            out.println("<li>账号：" + rs.getString(1).trim());
            out.println("密码" + rs.getString(2).trim() + "</li>");
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }

    try {
        rs.close();
    } catch (SQLException ex) {
        ex.printStackTrace();
    }
    try {
        state.close();
    } catch (SQLException ex) {
        ex.printStackTrace();
    }
    try {
        con.close();
    } catch (SQLException ex) {
        ex.printStackTrace();
    }
%>
</body>
</html>
