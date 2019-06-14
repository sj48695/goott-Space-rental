package com.spacerental.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spacerental.service.SpaceService;
import com.spacerental.vo.Space;

@Controller
@RequestMapping(value = "/space")
public class SpaceController {
	
	private SpaceService spaceService;

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeForm() {
		return "space/write";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(Space space) {
		
		spaceService.registerSpaceTx(space);
		return "redirect:/";
	}
}
