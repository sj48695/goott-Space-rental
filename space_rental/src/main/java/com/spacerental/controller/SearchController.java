package com.spacerental.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spacerental.service.SearchService;
import com.spacerental.vo.Notice;


@Controller
@RequestMapping(path="/search")
public class SearchController {
	
	
	 @Autowired
	 @Qualifier("SearchService") private SearchService SearchService;
	

	 @RequestMapping(path = "/room", method = RequestMethod.GET) 
	 public String Roomsearch(@RequestParam(name="value") String value, Model model) {
	 
	 List<Notice> Notice = SearchService.searchroomlist(value);
	 model.addAttribute("Notices", Notice);
	 
	 return "noticeview/notice"; }
	 
	 @RequestMapping(path = "/address", method = RequestMethod.GET) 
	 public String Addresssearch(@RequestParam(name="value") String value, Model model) {
	 
	 List<Notice> Notice = SearchService.searchaddlist(value);
	 model.addAttribute("Notices", Notice);
	 
	 return "noticeview/notice"; }
	 
	 @RequestMapping(path = "/lose", method = RequestMethod.GET) 
	 public String losssearch(@RequestParam(name="value") String value, Model model) {
	 
	 List<Notice> Notice = SearchService.searchlosslist(value);
	 model.addAttribute("Notices", Notice);
	 
	 return "noticeview/notice"; }
	


}
