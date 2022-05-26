package com.wydw.service.impl;

import com.wydw.dao.AddressDao;
import com.wydw.dao.impl.AddressDaoImpl;
import com.wydw.entity.Address;
import com.wydw.service.AddressService;

import java.sql.SQLException;
import java.util.List;

public class AddressServiceImpl implements AddressService {
    @Override
    public List<Address> findAddressByUid(int uid) throws SQLException {

        AddressDao addressDao = new AddressDaoImpl();
        List<Address> list = addressDao.selectAddressByUid(uid);

        return list;
    }

    @Override
    public void saveAddress(Address address) throws SQLException {

        AddressDao addressDao = new AddressDaoImpl();
        addressDao.insertAddress(address);

    }

    @Override
    public void deleteAddressByAid(String aid) throws SQLException {
        AddressDao addressDao = new AddressDaoImpl();
        addressDao.deleteAddressByAid(aid);
    }

    @Override
    public void setAddressToDefault(String aid, int uid) throws SQLException {

        AddressDao addressDao = new AddressDaoImpl();

        //1.将aid状态改为1 默认地址
        addressDao.updateAddressToDefault(aid);

        //2.将非aid状态改为0 非默认地址
        addressDao.updateAddressToCommons(aid,uid);
    }

    @Override
    public void updateByAid(Address address) throws SQLException {
        AddressDao addressDao = new AddressDaoImpl();
        addressDao.updateAddressByAid(address);
    }


}
