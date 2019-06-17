package com.spacerental.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(path="/space")
public class SpaceController {
	
	@RequestMapping(value= {"/list"}, method = RequestMethod.GET) // {} 여러개의 경로 요청에대해 메서드를 매핑 시킬 수 있다
	public String list(Locale locale, Model model) {
		 
		
		return "/space/spacelist";
	}
	
	@RequestMapping(value= {"/detail"}, method = RequestMethod.GET) // {} 여러개의 경로 요청에대해 메서드를 매핑 시킬 수 있다
	public String detail(Locale locale, Model model) {
		 
		
		return "/space/detail";
	}
}
