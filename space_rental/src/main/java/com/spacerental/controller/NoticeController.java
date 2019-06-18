
package com.spacerental.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spacerental.service.NoticeService;
import com.spacerental.vo.Notice;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(path = "/noticeview")
public class NoticeController {

	@Autowired
	@Qualifier("NoticeService")
	private NoticeService NoticeService;

	@RequestMapping(path = "/notice" , method = RequestMethod.GET)
	public String Noticelist(Model model) {
		List<Notice> Notice = NoticeService.selectNoticelist();
		model.addAttribute("notices", Notice);

		return "noticeview/notice";
	}

	@RequestMapping(value = { "/noticewrite" }, method = RequestMethod.GET)
	public String NoticeWrite() {
		return "noticeview/noticewrite";
	}

	@RequestMapping(value = { "/noticeupload" }, method = RequestMethod.GET)
	public String NoticeUpload(Notice notice) {

		System.out.println(notice);
		NoticeService.noticeUpload(notice);
		return "redirect:notice";

	}
	/*
	 * @RequestMapping(value = {"/noticedetail"}, method = RequestMethod.GET) public
	 * String NoticeDetail() { return "noticeview/noticedetail"; }
	 */

}
