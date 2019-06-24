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
import com.spacerental.service.SpaceService;
import com.spacerental.vo.Host;
import com.spacerental.vo.Lose;
import com.spacerental.vo.Member;
import com.spacerental.vo.Rent;

@Controller
@RequestMapping(value = "/mypage")
public class MyPageController {

	@Autowired
	@Qualifier("memberService")
	private MemberService memberService;
	
	@Autowired
	@Qualifier("spaceService")
	private SpaceService spaceService;

	@RequestMapping(path = "/{type}", method = RequestMethod.GET)
	public String showMypageForm(@PathVariable String type, Model model, HttpSession session) {

		Member member = (Member) session.getAttribute("loginuser");

		if (member == null) {
			return "redirect:/account/login";
		}

		String id = member.getId();

		if (type.equals("manager") && !id.equals("manager")) {
			return "redirect:/spacerental/account/login";
		}

		model.addAttribute("member", member);
		return "mypage/" + type;

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
		
		List<Rent> rents = memberService.selectrentList(id);
		
		model.addAttribute("rents", rents);
		model.addAttribute("loginuser", loginuser);
		
		return "mypage/myrentlist";
	}
	
	@RequestMapping(path = "/hostlist", method = RequestMethod.GET)
	public String hostList(Model model, HttpSession session) {
		
		Member loginuser = (Member) session.getAttribute("loginuser");
		String id = loginuser.getId();
		
		List<Host> hosts = memberService.selectHostList(id);
		
		for (Host host : hosts) {
			host.setFile(memberService.selectHostFile(host.getHostNo()));
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
	
	@RequestMapping(path = "/loselist", method = RequestMethod.GET)
	public String lostlist(Model model, HttpSession session) {
		
		Member loginuser = (Member) session.getAttribute("loginuser");
		String uploader = loginuser.getId();
		
		List<Lose> lose = memberService.selectLoseList(uploader);
		
		model.addAttribute("lose", lose);
		model.addAttribute("loginuser", loginuser);
		
		return "mypage/loselist";
	}
	
	@ResponseBody
	@RequestMapping(path = "/okCheck", method = RequestMethod.POST)
	public String ok(Model model, int okCheck, int hostNo) {
		boolean ok = false;
		Host host = new Host();

		if (okCheck == 1) ok = true;
		else ok = false;

		host.setOk(ok);
		host.setHostNo(hostNo);
		memberService.updateOk(host);

		if (host.isOk() == true) return "ok";
		else return "okCancel";
	}
	
	@RequestMapping(path = "/beforeOk", method = RequestMethod.GET)
	public String beforeOk(Model model, HttpSession session) {

		Member loginuser = (Member) session.getAttribute("loginuser");
		String id = loginuser.getId();

		if (!id.equals("manager")) {
			return "redirect:/spacerental/account/login";
		}

		List<Host> hosts = memberService.selectOkHostList(0);

		for (Host host : hosts) {
			host.setFile(memberService.selectHostFile(host.getHostNo()));
		}

		model.addAttribute("hosts", hosts);
		model.addAttribute("loginuser", loginuser);

		return "mypage/hostlist";
	}

	@RequestMapping(path = "/afterOk", method = RequestMethod.GET)
	public String afterOk(Model model, HttpSession session) {

		Member loginuser = (Member) session.getAttribute("loginuser");
		String id = loginuser.getId();

		if (!id.equals("manager")) {
			return "redirect:/spacerental/account/login";
		}

		List<Host> hosts = memberService.selectOkHostList(1);

		for (Host host : hosts) {
			host.setFile(memberService.selectHostFile(host.getHostNo()));
		}

		model.addAttribute("hosts", hosts);
		model.addAttribute("loginuser", loginuser);

		return "mypage/hostlist";
	}
	
	@RequestMapping(path = "/host_list/{hostNo}", method = RequestMethod.GET)
	public String host_list(Model model, HttpSession session, @PathVariable int hostNo) {
		
		Member loginuser = (Member) session.getAttribute("loginuser");
		
		List<Host> host = memberService.selectAllHostList(hostNo);
		
		model.addAttribute("host", host);
		model.addAttribute("loginuser", loginuser); 
		
		return "mypage/host_list";
	}
	
	@RequestMapping(path = "/rent_cancel", method = RequestMethod.GET)
	public String rent_cancel(Model model, HttpSession session, Rent rent) {
		
		Member loginuser = (Member) session.getAttribute("loginuser");
		
		memberService.cancelRent(rent);
		model.addAttribute("loginuser", loginuser);
	
		return "redirect:/mypage/rentList";
	}

}
