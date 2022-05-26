package com.wydw.controller;


import com.wydw.entity.Address;
import com.wydw.entity.Cart;
import com.wydw.entity.Orders;
import com.wydw.entity.User;
import com.wydw.service.AddressService;
import com.wydw.service.CartService;
import com.wydw.service.OrdersService;
import com.wydw.service.impl.AddressServiceImpl;
import com.wydw.service.impl.CartServiceImpl;
import com.wydw.service.impl.OrdersServiceImpl;
import com.wydw.utils.Constants;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/order")
public class OrdersController extends BaseServlet {

    public String preView(HttpServletRequest request, HttpServletResponse response) throws SQLException, InvocationTargetException, IllegalAccessException {


        String uid = request.getParameter("uid");
        AddressService addressService = new AddressServiceImpl();
        List<Address> addressList = addressService.findAddressByUid(Integer.parseInt(uid));

        CartService cartService = new CartServiceImpl();
        List<Cart> cartList = cartService.findAll(Integer.parseInt(uid));
        request.setAttribute("addressList", addressList);
        request.setAttribute("cartList", cartList);

        return Constants.FORWARD + "/order.jsp";
    }

    public String create(HttpServletRequest request,HttpServletResponse response) throws IllegalAccessException, SQLException, InvocationTargetException {

        String aid = request.getParameter("aid");
        String uid = request.getParameter("uid");
        String sum = request.getParameter("sum");
        OrdersService ordersService = new OrdersServiceImpl();
        ordersService.createOrder(aid,uid,sum);

        return Constants.FORWARD +"order?method=show";
    }


    public String show(HttpServletRequest request,HttpServletResponse response) throws IllegalAccessException, SQLException, InvocationTargetException {
        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("loginUser");

        if (user == null) {
            session.setAttribute("msg", "登录后可以查看订单！");
            return Constants.REDIRECT + "/login.jsp";
        }

        OrdersService ordersService = new OrdersServiceImpl();
        List<Orders> ordersList = ordersService.findOrdersByUid(user.getUid());
        request.setAttribute("ordersList", ordersList);
        return Constants.FORWARD  + "/orderList.jsp";
    }

    public String detail(HttpServletRequest request,HttpServletResponse response) throws IllegalAccessException, SQLException, InvocationTargetException {

        String oid = request.getParameter("oid");

        OrdersService ordersService = new OrdersServiceImpl();
        Orders order = ordersService.findOrderByOid(oid);
        request.setAttribute("order", order);
        return Constants.FORWARD  + "/orderDetail.jsp";
    }


    public String success(HttpServletRequest request,HttpServletResponse response) throws SQLException {

        String oid = request.getParameter("oid");
        OrdersService ordersService = new OrdersServiceImpl();
        ordersService.updateStateByOid(oid);
        return Constants.FORWARD + "/order?method=show";

    }
}
