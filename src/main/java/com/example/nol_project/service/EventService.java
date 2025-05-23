package com.example.nol_project.service;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.example.nol_project.dao.EventDAO;
import com.example.nol_project.dto.EventDTO;

@Service
public class EventService {
	private final EventDAO eventDao;
	
	public EventService(EventDAO eventDao) {
		this.eventDao = eventDao;
	}

	public List<EventDTO> getEventList() {
		List<EventDTO> elist = eventDao.selectAllEvents();
		
		for(EventDTO event : elist) {
			Date now = new Date();
			event.setPast(now.after(event.getEndDate()));
		}
		
		return elist;
	}
	
	public EventDTO getEventDetail(int eno) {
		EventDTO event = eventDao.selectEvent(eno);
		
		Date now = new Date();
		event.setPast(now.after(event.getEndDate()));
		
		return event;
	}
	
    public List<EventDTO> getAllEvents() {
        return eventDao.getAllEvents(); // mapper 연동
    }
}
