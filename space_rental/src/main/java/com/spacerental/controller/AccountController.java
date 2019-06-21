package com.spacerental.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spacerental.service.MemberService;
import com.spacerental.vo.Host;
import com.spacerental.vo.Member;

@Controller
@RequestMapping(value = "/account")
public class AccountController {

	@Autowired
	@Qualifier("memberService")
	private MemberService memberService;

	@RequestMapping(path = "/login", method = RequestMethod.GET)
	public String showLoginForm() {
		return "account/login";
	}
	
	@RequestMapping(path = "/login", method = RequestMethod.POST)
	public String login(String id, String passwd, HttpSession session) {

		Member member = memberService.selectMemberByIdAndPasswd(id, passwd);

		if (member != null) {
			session.setAttribute("loginuser", member);
			return "redirect:/"; 			
		} else {
			return "account/login";			
		}
		
	}
	
	@RequestMapping(path = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		
		session.removeAttribute("loginuser");
		return "redirect:/";
		
	}

	@RequestMapping(path = "/register", method = RequestMethod.GET)
	public String showRegisterForm() {
		return "account/register";
	}

	@RequestMapping(path = "/register", method = RequestMethod.POST)
	public String register(Member member) {
		memberService.insertMember(member);
		return "redirect:/account/login";
	}
	
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(path = "/idCheck", method = RequestMethod.POST) public int
	 * idCheck(@RequestParam("id") String id) { return
	 * memberService.userIdCheck(id); }
	 */

}
