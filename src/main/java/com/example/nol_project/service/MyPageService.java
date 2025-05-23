package com.example.nol_project.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.nol_project.dao.MyPageDAO;

@Service
public class MyPageService {

    @Autowired
    private MyPageDAO dao;

    public List<Map<String, Object>> getMyReserveList(String id) {
        return dao.getMyReserveList(id);
    }
}
