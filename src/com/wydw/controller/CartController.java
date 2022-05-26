package com.wydw.controller;

import com.wydw.entity.Cart;
import com.wydw.entity.User;
import com.wydw.service.CartService;
import com.wydw.service.impl.CartServiceImpl;
import com.wydw.utils.Constants;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/cart")
public class CartController extends BaseServlet {

    public String create(HttpServletRequest request, HttpServletResponse response) throws IllegalAccessException, SQLException, InvocationTargetException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("loginUser");
        if (user == null) {
            session.setAttribute("msg", "添加购物车必须先登录！");
            return Constants.REDIRECT+"/login.jsp";
        }
        int uid = user.getUid();
        String pid = request.getParameter("pid");

        CartService cartService = new CartServiceImpl();
        cartService.createCart(uid,pid);

        return Constants.FORWARD+ "/cartSuccess.jsp";
    }


    public String show(HttpServletRequest request,HttpServletResponse response) throws IllegalAccessException, SQLException, InvocationTargetException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("loginUser");
        if (user == null) {
            session.setAttribute("msg", "添加购物车必须先登录！");
            return Constants.REDIRECT+"/login.jsp";
        }


        int uid = user.getUid();

        CartService cartService = new CartServiceImpl();
        List<Cart> list = cartService.findAll(uid);

        request.setAttribute("list", list);

        return Constants.FORWARD + "/cart.jsp";
    }

    public String delete(HttpServletRequest request,HttpServletResponse response) throws SQLException {

        String cid = request.getParameter("cid");
        CartService cartService = new CartServiceImpl();
        cartService.deleteCartByCid(cid);
        return Constants.FORWARD + "/cart?method=show";
    }

    public String update(HttpServletRequest request,HttpServletResponse response) throws SQLException {

        String cid = request.getParameter("cid");
        String price = request.getParameter("price"); //商品的单价
        String cnum = request.getParameter("cnum"); //修改后的数量
        CartService cartService = new CartServiceImpl();
        cartService.updateCartByCid(cid,price,cnum);
        return Constants.FORWARD + "/cart?method=show";
    }

    public String clear(HttpServletRequest request,HttpServletResponse response) throws SQLException {

        String uid = request.getParameter("uid");
        String price = request.getParameter("price"); //商品的单价
        String cnum = request.getParameter("cnum"); //修改后的数量
        CartService cartService = new CartServiceImpl();
        cartService.clearCart(uid);
        return Constants.FORWARD + "/cart?method=show";
    }
}
