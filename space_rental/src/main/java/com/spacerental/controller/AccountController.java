package com.spacerental.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

	@RequestMapping(path = "/register", method = RequestMethod.GET)
	public String showRegisterForm() {
		return "account/register";
	}

	@RequestMapping(path = "/register", method = RequestMethod.POST)
	public String register(Member member) {
		memberService.insertMember(member);
		return "redirect:/account/login";
	}

	@RequestMapping(path = "/register_host", method = RequestMethod.GET)
	public String showHostRegisterForm() {
		return "account/register_host";
	}

	@RequestMapping(path = "/register_host", method = RequestMethod.POST)
	public String hostRegister(Host host, String open_start, String open_end, String roadAddr, String detailAddr, String extraAddr) {
		host.setHostId("123");
		host.setOpen(open_start + " ~ " + open_end);
		host.setAddress(roadAddr + " " + detailAddr + " " +extraAddr);
		System.out.println(host);
		memberService.insertHost(host);
		return "redirect:/account/login";

	}

}
