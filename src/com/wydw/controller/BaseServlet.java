package com.wydw.controller;

import com.wydw.utils.Constants;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Method;

/**
 * BaseServlet用于集中处理方法的调用！
 * 以及返回值处理！
 * 以及默认页对应方法！
 */
public class BaseServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        String methodStr = req.getParameter(Constants.TAG);
        if (methodStr == null && methodStr.equals("")) {
            methodStr = Constants.INDEX;
        }
        Class  clazz = this.getClass();

        try {
            Method method = clazz.getMethod(methodStr, HttpServletRequest.class, HttpServletResponse.class);

            Object result = method.invoke(this,req,resp);
            if (result != null) {
                String str = (String) result;
                if (str.startsWith(Constants.FORWARD)) {
                    String path = str.substring(str.indexOf(Constants.FLAG) + 1);
                    req.getRequestDispatcher(path).forward(req,resp);
                }else if (str.startsWith(Constants.REDIRECT)){
                    String path = str.substring(str.indexOf(Constants.FLAG) + 1);
                    resp.sendRedirect(path);
                }else{
                    resp.getWriter().println(str);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            req.getSession().setAttribute("msg", "程序异常!请稍后再试！");
            resp.sendRedirect("/message.jsp");

        }
    }

    /**
     * @param req
     * @param resp
     * @return
     * @throws IOException
     * @throws ServletException
     */
    public String index(HttpServletRequest req,HttpServletResponse resp) throws IOException, ServletException {

        return Constants.FORWARD+"/index.jsp";
    }
}
