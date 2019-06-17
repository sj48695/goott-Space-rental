package com.spacerental.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(path="/loseview")
public class LoseController {
	
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = {"/lose"}, method = RequestMethod.GET)
	public String Lose() {
		
		
		return "loseview/lose";
	}
		
	@RequestMapping(value = {"/loselistA"}, method = RequestMethod.GET)
	public String LoseListA() {
		
		
		return "loseview/loselistA";
	}
	
	@RequestMapping(value = {"/losewriteA"}, method = RequestMethod.GET)
	public String LoseWriteA() {
		
		
		return "loseview/losewriteA";
	}
	
	@RequestMapping(value = {"/loselistB"}, method = RequestMethod.GET)
	public String LoseListB() {
		
		
		return "loseview/loselistB";
	}
	
	@RequestMapping(value = {"/losewriteB"}, method = RequestMethod.GET)
	public String LoseWriteB() {
		
		
		return "loseview/losewriteB";
	}
	
}
