package com.wydw.service.impl;

import com.wydw.dao.TypeDao;
import com.wydw.dao.impl.TypeDaoImpl;
import com.wydw.entity.Type;
import com.wydw.service.TypeService;

import java.sql.SQLException;
import java.util.List;

public class TypeServiceImpl  implements TypeService {

    @Override
    public List<Type> findAll() throws SQLException {
        TypeDao typeDao = new TypeDaoImpl();

        List<Type> types = typeDao.selectAll();

        return types;
    }
}
