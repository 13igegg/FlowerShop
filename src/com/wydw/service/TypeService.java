package com.wydw.service;

import com.wydw.entity.Type;

import java.sql.SQLException;
import java.util.List;

public interface TypeService {

    List<Type> findAll() throws SQLException;

}
