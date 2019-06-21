package com.spacerental.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spacerental.service.AboutUsService;
import com.spacerental.vo.Member;
import com.spacerental.vo.Space;


@Controller
@RequestMapping(path="/aboutusview")
public class AboutUsController {
	
	@Autowired
	@Qualifier("AboutUsService")
	private AboutUsService aboutUsService;
	

	@RequestMapping(path = "/aboutus", method = RequestMethod.GET)
	public String showInfo(Model model) {
		
		int customerCount=aboutUsService.countCustomer();
		int hostCount=aboutUsService.countHost();
		int computerCount=aboutUsService.countComputer();
		int beamCount=aboutUsService.countBeam();
		int wifiCount=aboutUsService.countWifi();
		int userTotal=customerCount+hostCount;
		int spaceTotal=aboutUsService.countTotalSpace();
		
		
		model.addAttribute("csC", customerCount);
		model.addAttribute("hC",hostCount);
		model.addAttribute("cC",computerCount);
		model.addAttribute("bC",beamCount);
		model.addAttribute("wC",wifiCount);
		model.addAttribute("uT",userTotal);
		model.addAttribute("sT",spaceTotal);
		return "aboutusview/aboutus";
	}
	
	
	
	
}
