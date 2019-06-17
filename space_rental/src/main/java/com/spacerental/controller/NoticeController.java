package com.spacerental.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(path = "/noticeview")
public class NoticeController {
	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String Notice() {
		return "noticeview/notice";
	}
}
