package com.spacerental.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(path="/noticeview")
public class NoticeController {
	
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = {"/notice"}, method = RequestMethod.GET)
	public String Notice() {
		
		
		return "noticeview/notice";
	}
		
	
}
