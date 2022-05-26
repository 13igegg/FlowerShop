package com.wydw.controller;


import com.wydw.entity.PageBean;
import com.wydw.entity.Product;
import com.wydw.service.ProductService;
import com.wydw.service.impl.ProductServiceImpl;
import com.wydw.utils.Constants;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;

@WebServlet("/product")
public class ProductController extends BaseServlet {

    public String show(HttpServletRequest request, HttpServletResponse response) throws SQLException {


        String tid = request.getParameter("tid");
        int pageSize = 6;
        String currentPage = request.getParameter("currentPage");
        int page = 1;
        if (currentPage != null) {
            page = Integer.parseInt(currentPage);
        }
        ProductService productService = new ProductServiceImpl();
        PageBean<Product> pageBean = productService.findPage(tid, page, pageSize);
        request.setAttribute("pageBean", pageBean);

        return Constants.FORWARD + "/goodsList.jsp";
    }

    public String detail(HttpServletRequest request,HttpServletResponse response) throws SQLException {


        String pid = request.getParameter("pid");
        ProductService productService = new ProductServiceImpl();
        Product product = productService.findProductByPid(pid);
        request.setAttribute("product", product);
        return Constants.FORWARD + "/goodsDetail.jsp";
    }
}