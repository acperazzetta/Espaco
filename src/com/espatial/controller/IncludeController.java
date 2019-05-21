package com.espatial.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.espatial.model.Service;
import com.espatial.service.ServicesService;


@Controller
@RequestMapping("include")
public class IncludeController {
	
	List<Service> serviceList;

	@Autowired
	public ServicesService servicesService;
	
	@RequestMapping(value = "/includeService", method = RequestMethod.GET)
	public ModelAndView showNewService(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("include/includeService");
		serviceList = servicesService.getAllServices();
		if (serviceList != null && !serviceList.isEmpty())
			mav.addObject("serviceList", serviceList);
		mav.addObject("service", new Service());
		return mav;
	}	

	@RequestMapping(value = "/includeService", method = RequestMethod.POST)
	public ModelAndView processService(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("service") Service service) {
		ModelAndView mav = new ModelAndView("include/includeService");
		switch (service.getAction()) {
		case Service.INSERT:
			if (servicesService.checkService(service.getId())) {
				mav.addObject("messageError", "This ID already exists. Please choose another one.");
				mav.addObject("service", service);
			} else {
				servicesService.includeService(service);
				mav.addObject("message", "Service included Successfully");
				mav.addObject("service", new Service());
			}
			break;

		case Service.UPDATE:
			servicesService.updateService(service);
			mav.addObject("message", "Service updated Successfully");
			mav.addObject("service", new Service());
			break;
			
		case Service.DELETE:
			servicesService.deleteService(service.getId());
			mav.addObject("message", "Service deleted Successfully");
			mav.addObject("service", new Service());
			break;
			
		default:
			mav.addObject("messageError", "An Error occured while attenpting to save the Service. Please try again.");
			mav.addObject("service", service);
			break;
		}
		serviceList = servicesService.getAllServices();
		mav.addObject("serviceList", serviceList);

		return mav;			
	}	
}
