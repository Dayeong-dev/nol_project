package com.example.nol_project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.nol_project.dao.INoticeDAO;
import com.example.nol_project.dto.NoticeDTO;

@Service
@Transactional
public class NoticeService {

    @Autowired
    private INoticeDAO noticeDAO;

    public List<NoticeDTO> getAllNotices() {
        return noticeDAO.selectAll();
    }

    public NoticeDTO getNoticeByNno(int nno) {
        return noticeDAO.selectByNno(nno);
    }

    public void insert(NoticeDTO notice) {
        noticeDAO.insert(notice);
    }

    public void NoticeUpdate(NoticeDTO notice) {
        noticeDAO.NoticeUpdate(notice);
    }

    public void delete(int nno) {
        noticeDAO.delete(nno);
    }
}