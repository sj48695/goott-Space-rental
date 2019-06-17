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

	@RequestMapping(path = "/{type}/{id}", method = RequestMethod.GET)
	public String showCustomerForm(@PathVariable String id, @PathVariable String type, Model model) {
		
		Member member = memberService.selectMemberByMemberId(id);
		if (member == null) {
			return "redirect:list";
		}		

		model.addAttribute("member", member);
		System.out.println(type);
		return "mypage/" + type ;
	}

}
