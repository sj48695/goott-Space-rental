package com.spacerental.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spacerental.service.MemberService;
import com.spacerental.vo.Member;

@Controller
@RequestMapping(value = "/mypage")
public class MyPageController {

	@Autowired
	@Qualifier("memberService")
	private MemberService memberService;

	@RequestMapping(path = "/customer/{id}", method = RequestMethod.GET)
	public String showCustomerForm(@PathVariable int id, int Id, Model model) {
		Member member = memberService.selectMemberByMemberId(Id);
		if (member == null) {
			return "redirect:list";
		}		

		model.addAttribute("member", member);
		
		return "/customer";
	}
	
	@RequestMapping(path = "/manager/{id}", method = RequestMethod.GET)
	public String showmanagerForm(@PathVariable int id) {
		return "/mypage";
	}
	
	@RequestMapping(path = "/host/{id}", method = RequestMethod.GET)
	public String showhostForm(@PathVariable int id) {
		return "/mypage";
	}

}
