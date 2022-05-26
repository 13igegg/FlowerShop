package com.wydw.controller;


import cn.dsna.util.images.ValidateCode;

import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 生成验证码的controller
 */
@WebServlet("/code")
public class CodeController extends BaseServlet {

    public void createCode(HttpServletRequest request, HttpServletResponse response) throws IOException {

        ValidateCode validateCode = new ValidateCode(100,35,5,20);
        String code = validateCode.getCode();
        request.getSession().setAttribute("code",code);
        ServletOutputStream outputStream = response.getOutputStream();
        validateCode.write(outputStream);
    }
}
