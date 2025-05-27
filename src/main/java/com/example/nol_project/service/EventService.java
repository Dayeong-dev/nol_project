package com.example.nol_project.service;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.example.nol_project.dao.EventDAO;
import com.example.nol_project.dao.UserCouponDAO;
import com.example.nol_project.dto.EventCouponDTO;
import com.example.nol_project.dto.EventDTO;

@Service
public class EventService {
	private final EventDAO eventDao;
	private final UserCouponDAO userCouponDao;
	
	public EventService(EventDAO eventDao, UserCouponDAO userCouponDao) {
		this.eventDao = eventDao;
		this.userCouponDao = userCouponDao;
	}

	public List<EventDTO> getEventList() {
		List<EventDTO> elist = eventDao.selectAllEvents();
		
		for(EventDTO event : elist) {
			Date now = new Date();
			event.setPast(now.after(event.getEndDate()));
		}
		
		return elist;
	}
	
	public EventCouponDTO getEventDetail(int eno) {
		EventCouponDTO eventCoupon = eventDao.selectEventWithCno(eno);
		
		Date now = new Date();
		eventCoupon.setPast(now.after(eventCoupon.getEndDate()));
		
		return eventCoupon;
	}
	
    public List<EventDTO> getAllEvents() {
        return eventDao.getAllEvents(); // mapper 연동
    }
    
    public boolean hasCoupon(int cno, String id) { //쿠폰 유무 확인(발급시)
    	int result = userCouponDao.countByCnoAndId(cno, id);
    	
    	if(result >= 1) {
    		return true;
    	}
    	
        return false;
    }

	public EventDTO getEventByEno(int eno) {
		EventDTO event = eventDao.getEventByEno(eno);
		return event;
	}

	public boolean regEvent(EventDTO event) {
		int result = eventDao.insertEvent(event);
		
		if(result == 1) {
			return true;
		}
		
		return false;
	}
	
	public boolean updateEvent(EventDTO event, int eno) {
		int result = eventDao.updateEvent(event, eno);
		
		if(result == 1) {
			return true;
		}
		
		return false;
	}

	public boolean deleteEvent(int eno) {
		int result = eventDao.deleteEvent(eno);
		
		if(result == 1) {
			return true;
		}
		
		return false;
	}
}
