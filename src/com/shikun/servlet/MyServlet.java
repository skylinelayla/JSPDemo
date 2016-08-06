package com.shikun.servlet;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**设置访问次数servlet
 * Created by SHIKUN on 2016/8/5.
 */
public class MyServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        //resp.setCharacterEncoding("gbk2312");
        String name = req.getParameter("name");
        PrintWriter out = resp.getWriter();
        ServletContext context = getServletContext();
        int count=1;
        if (context.getAttribute("count") == null) {
            context.setAttribute("count", new Integer(count));
        }else{
            count = Integer.parseInt(context.getAttribute("count").toString());
            count++;
            context.setAttribute("count", new Integer(count));
        }

        out.println("<HTML>");
        out.println("<HEAD><TITLE>问好</TITLE></HEAD>");
        out.println("<BODY>");
        out.println(name + "你好，你是第" + count + "位访客");
        out.println("</BODY>");
        out.println("</HTML>");



    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
