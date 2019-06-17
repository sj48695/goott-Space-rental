package com.spacerental.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spacerental.service.MemberService;

@Controller
@RequestMapping(value = "/space")
public class MyPageController {

	@Autowired
	@Qualifier("memberService")
	private MemberService memberService;

	@RequestMapping(path = "/mypage/{id}", method = RequestMethod.GET)
	public String showCustomerMyPageForm(@PathVariable int id) {
		return "/mypage";
	}

}
