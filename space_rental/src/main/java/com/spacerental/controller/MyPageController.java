package com.spacerental.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spacerental.service.MemberService;
import com.spacerental.vo.Host;
import com.spacerental.vo.Member;
import com.spacerental.vo.Rent;
import com.spacerental.vo.SpaceFile;

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
			return "redirect:/account/login";
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
		
		if (loginuser == null) {
			return "redirect:/";
		}		

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
	
	@RequestMapping(path = "/rentList", method = RequestMethod.GET)
	public String rentList(Model model, HttpSession session) {
		
		Member loginuser = (Member) session.getAttribute("loginuser");
		String id = loginuser.getId();
		
		List<Rent> rent = memberService.selectrentList(id);
		model.addAttribute("rent", rent);
		model.addAttribute("loginuser", loginuser);
		
		return "mypage/myrentlist";
	}
	
	@RequestMapping(path = "/hostList", method = RequestMethod.GET)
	public String hostList(Model model, HttpSession session) {
		
		Member loginuser = (Member) session.getAttribute("loginuser");
		String id = loginuser.getId();
		
		List<Host> hosts = memberService.selectHostList(id);
		
		for (Host host : hosts) {
			host.setFile(memberService.selectHostFile(id));
		}
				
		model.addAttribute("hosts", hosts);
		model.addAttribute("loginuser", loginuser);
		
		return "mypage/hostlist";
	}
	
	@RequestMapping(path = "/hostRentList/{hostNo}", method = RequestMethod.GET)
	public String hostRentList(Model model, HttpSession session, @PathVariable int hostNo) {
		
		Member loginuser = (Member) session.getAttribute("loginuser");
		
		List<Rent> rentlist = memberService.selectHostRentList(hostNo);
		
		model.addAttribute("rentlist",rentlist);
		model.addAttribute("loginuser", loginuser);
		
		return "mypage/hostrentlist";
	}

}
