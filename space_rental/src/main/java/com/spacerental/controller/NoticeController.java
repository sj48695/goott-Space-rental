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

import com.spacerental.service.NoticeService;
import com.spacerental.vo.Member;
import com.spacerental.vo.Notice;


@Controller
@RequestMapping(path="/noticeview")
public class NoticeController {
	
	@Autowired
	@Qualifier("NoticeService")
	private NoticeService NoticeService;
	

	@RequestMapping(path = "/notice", method = RequestMethod.GET)
	public String noticelist(Model model,HttpSession session) {
		Member loginuser = (Member) session.getAttribute("loginuser");
		List<Notice> Notice = NoticeService.selectNoticelist();
		model.addAttribute("Notices", Notice);
		if(loginuser!=null) {
			model.addAttribute("id", loginuser.getId());
		}
		return "noticeview/notice";
	}
	
	@RequestMapping(path = "/noticewrite", method = RequestMethod.GET)
	public String noticewrite() {
		return "noticeview/noticewrite";
	}
	
	@RequestMapping(path = "/noticeupload", method = RequestMethod.GET)
	public String noticeUpload(Notice notice) {
		
		NoticeService.noticeUpload(notice);
		return "redirect:notice";
	}
	
	@RequestMapping(path = "/noticedetail/{noticeNo}", method = RequestMethod.GET)
	public String noticeDetail(@PathVariable int noticeNo, Model model,HttpSession session) {
		Member loginuser = (Member) session.getAttribute("loginuser");
		Notice notice = NoticeService.noticeDetail(noticeNo);

		model.addAttribute("notices", notice);
		if(loginuser!=null) {
			model.addAttribute("id", loginuser.getId());
		}
		return "noticeview/noticedetail";
	}
	
	@RequestMapping(path = "/noticedelete/{noticeNo}", method = RequestMethod.GET)
	public String noticeDelete(@PathVariable int noticeNo, Model model) {

		NoticeService.noticeDelete(noticeNo);
		
		return "redirect:/noticeview/notice";
	}
	
	@RequestMapping(path = "/noticeupdate/{noticeNo}", method = RequestMethod.GET)
	public String noticeUpdate(@PathVariable int noticeNo, Model model) {

		List<Notice> notice = NoticeService.findNoticeByNoticeNo(noticeNo);
		model.addAttribute("noticess", notice);
		
		return "noticeview/noticeupdate";
	}
	
	@RequestMapping(path = "/noticeupdatefirm", method = RequestMethod.GET)
	public String noticeUpdateFirm(Notice notice, Model model) {

		NoticeService.updateNoticeUpdate(notice);
		
		return "redirect:notice";
	}
	
	
	
}
