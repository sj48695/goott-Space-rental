package com.spacerental.controller;

import javax.servlet.http.HttpSession;

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

	@RequestMapping(path = "/{type}", method = RequestMethod.GET)
	public String showCustomerForm(@PathVariable String type, Model model, HttpSession session) {
		
		Member member = (Member) session.getAttribute("loginuser");
		
		if (member == null) {
			return "redirect:/spacerental/account/login";
		}		 

		model.addAttribute("member", member);
		return "mypage/" + type ;
		
	}
	
	@RequestMapping(path = "/update", method = RequestMethod.POST)
	public String updateForm (HttpSession session) {  
		
		Member loginuser = (Member) session.getAttribute("loginuser");		
		memberService.updateMember(loginuser);	
		
		return "redirect:/mypage/" + loginuser.getType(); 
		
	}
	
	@RequestMapping(path = "/update", method = RequestMethod.GET)
	public String updateForm (Model model, HttpSession session) {   
		
		Member loginuser = (Member) session.getAttribute("loginuser");
		model.addAttribute("loginuser", loginuser);

		return "mypage/update"; 
	}
	
	@RequestMapping(path = "/delete", method = RequestMethod.GET)
	public String delete (HttpSession session) {  

		Member loginuser = (Member) session.getAttribute("loginuser");
		String id = loginuser.getId();

		memberService.deleteMember(id);
		session.removeAttribute("loginuser");

		return "redirect:/";		
	}

}
