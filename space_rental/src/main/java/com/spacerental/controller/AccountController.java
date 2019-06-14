package com.spacerental.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spacerental.service.MemberService;
import com.spacerental.vo.Member;


@Controller
@RequestMapping
public class AccountController {
	
	@Autowired
	@Qualifier("memberService")
	private MemberService memberService;
	
	@RequestMapping(path = "/account/login", method = RequestMethod.GET)
	public String showLoginForm() {	
		return "account/login";	
	}
	
	
	@RequestMapping(path = "/account/register", method = RequestMethod.GET)
	public String showRegisterForm() {	
		return "account/register";	
	}
	
	@RequestMapping(path = "/account/register", method = RequestMethod.POST)
	public String register(Member member) {

		memberService.insertMember(member);
		
		return "redirect:/account/login";
		
	}

}
