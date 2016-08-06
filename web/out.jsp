<%--
  Created by IntelliJ IDEA.
  User: SHIKUN
  Date: 2016/8/5
  Time: 14:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>out对象实例</title>

</head>
<body>

<%
    int buffsize = out.getBufferSize();
    int restsize = out.getRemaining();
    int usedsize = buffsize - restsize;
    out.println("缓存区大小" + buffsize);
    out.println("剩余大小" + restsize);
    out.println("使用大小" + usedsize);

    request.getSession()


%>

</body>
</html>
