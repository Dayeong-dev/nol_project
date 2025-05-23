package com.example.nol_project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.nol_project.dao.TicketDAO;
import com.example.nol_project.dto.TicketDTO;

@Service
public class TicketService {
    @Autowired
    private TicketDAO dao;

    public List<TicketDTO> getAllTickets() { //티켓 종류 보여주기 
        return dao.getAllTickets();
    }
    
    public TicketDTO getTicketByTno(int tno) { //티켓 예매창 보여주기
        return dao.getTicketByTno(tno);
    }
}
