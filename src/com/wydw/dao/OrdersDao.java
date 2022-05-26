package com.wydw.dao;

import com.wydw.entity.Item;
import com.wydw.entity.Orders;

import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.List;

public interface OrdersDao {
    void insertOrders(Orders orders) throws SQLException;

    void insertItems(List<Item> items) throws SQLException;

    List<Orders> selectOrdersByUid(int uid) throws SQLException, InvocationTargetException, IllegalAccessException;

    Orders selectOrdersByOid(String oid) throws InvocationTargetException, IllegalAccessException, SQLException;

    List<Item> selectItemsByOid(String oid) throws SQLException, InvocationTargetException, IllegalAccessException;

    void updateStateByOid(String oid) throws SQLException;
}
