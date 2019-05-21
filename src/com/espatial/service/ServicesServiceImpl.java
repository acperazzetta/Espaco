package com.espatial.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.espatial.dao.ServiceDao;
import com.espatial.model.Service;

@Component
public class ServicesServiceImpl implements ServicesService {

	@Autowired
	public ServiceDao serviceDao;
	
	
	public Service getService(String id) {
		return serviceDao.getService(id);
	}
	
	public boolean checkService (String id) {
		return serviceDao.checkService(id);
	}

	public void updateService(Service service) {
		serviceDao.updateService(service);
	}

	public void includeService(Service service) {
		serviceDao.includeService(service);
	}

	public void deleteService(String id) {
		serviceDao.deleteService(id);
	}
	
	public List<Service> getAllServices() {
		return serviceDao.getAllServices();
	}
}
