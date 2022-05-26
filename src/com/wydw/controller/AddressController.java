package com.wydw.controller;


import com.wydw.entity.Address;
import com.wydw.entity.User;
import com.wydw.service.AddressService;
import com.wydw.service.impl.AddressServiceImpl;
import com.wydw.utils.Constants;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@WebServlet("/address")
public class AddressController extends BaseServlet {


    public String show(HttpServletRequest request, HttpServletResponse response) throws SQLException {

        HttpSession session = request.getSession();
        User user  = (User) session.getAttribute("loginUser");
        if (user == null)
        {
            session.setAttribute("msg", "需要先登录！");
            return Constants.REDIRECT + "/login.jsp";
        }

        int uid = user.getUid();

        AddressService addressService = new AddressServiceImpl();
        List<Address> addresses = addressService.findAddressByUid(uid);

        request.setAttribute("list", addresses);

        return Constants.FORWARD + "/self_info.jsp";
    }


    public String add(HttpServletRequest request,HttpServletResponse response) throws InvocationTargetException, IllegalAccessException, SQLException {

        Map<String, String[]> map = request.getParameterMap();
        Address address = new Address();
        BeanUtils.populate(address,map);
        AddressService addressService = new AddressServiceImpl();
        addressService.saveAddress(address);
        return Constants.FORWARD + "/address?method=show";
    }

    public String delete(HttpServletRequest request,HttpServletResponse response) throws InvocationTargetException, IllegalAccessException, SQLException {


        String aid = request.getParameter("aid");
        AddressService addressService = new AddressServiceImpl();
        addressService.deleteAddressByAid(aid);
        return Constants.FORWARD + "/address?method=show";
    }

    public String setDefault(HttpServletRequest request,HttpServletResponse response) throws InvocationTargetException, IllegalAccessException, SQLException {


        String aid = request.getParameter("aid");
        HttpSession session = request.getSession();
        User user  = (User) session.getAttribute("loginUser");
        if (user == null)
        {
            session.setAttribute("msg", "需要先登录！");
            return Constants.REDIRECT + "/login.jsp";
        }
        AddressService addressService = new AddressServiceImpl();
        addressService.setAddressToDefault(aid,user.getUid());
        return Constants.FORWARD + "/address?method=show";
    }

    public String update(HttpServletRequest request,HttpServletResponse response) throws InvocationTargetException, IllegalAccessException, SQLException {


        Map<String, String[]> map = request.getParameterMap();
        Address address = new Address();
        BeanUtils.populate(address,map);
        AddressService addressService = new AddressServiceImpl();
        addressService.updateByAid(address);
        return Constants.FORWARD + "/address?method=show";
    }
}
