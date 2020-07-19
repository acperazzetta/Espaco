package com.espatial.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.espatial.model.Service;
import com.espatial.service.ServicesService;


@RestController
@RequestMapping("rest")
public class ContentController {

	@Autowired
	public ServicesService servicesService;

	@RequestMapping(value = "/loadAllServices.ajax", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<Service> getAllServices (HttpServletRequest request, HttpServletResponse response) {

		List<Service> service = servicesService.getAllServices();
		return service;
	}
	
	@RequestMapping(value = "/loadService.ajax", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Service getService (@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) {

		Service service = servicesService.getService(id);
		return service;
	}
	
	@RequestMapping(value = "/includeService", method = RequestMethod.GET)
	public ModelAndView showNewService(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("includeService");
		mav.addObject("service", new Service());
		return mav;
	}	
}
