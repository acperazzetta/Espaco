package com.espatial.dao;

import java.util.List;

import com.espatial.model.Service;

public interface ServiceDao {
	Service getService (String id);
	boolean checkService (String id);
	void updateService (Service service);
	void includeService (Service service);
	void deleteService (String id);
	List<Service> getAllServices();

}