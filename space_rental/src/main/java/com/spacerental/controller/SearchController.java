package com.spacerental.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spacerental.service.SearchService;
import com.spacerental.vo.Notice;
import com.spacerental.vo.Space;


@Controller
@RequestMapping(path="/search")
public class SearchController {
	
	
	 @Autowired
	 @Qualifier("SearchService") private SearchService SearchService;
	

	 @RequestMapping(path = "/room", method = RequestMethod.GET) 
	 public String roomsearch(@RequestParam(name="value") String value, Model model) {
	 
	 List<Notice> Notice = SearchService.searchroomlist(value);
	 model.addAttribute("Notices", Notice);
	 
	 return "noticeview/notice"; }
	 
	 @RequestMapping(path = "/address", method = RequestMethod.GET) 
	 public String addresssearch(@RequestParam(name="value") String value, Model model) {
	 
	 List<Notice> Notice = SearchService.searchaddlist(value);
	 model.addAttribute("Notices", Notice);
	 
	 return "noticeview/notice"; }
	 
	 @RequestMapping(path = "/lose", method = RequestMethod.GET) 
	 public String losssearch(@RequestParam(name="value") String value, Model model) {
	 
	 List<Notice> Notice = SearchService.searchlosslist(value);
	 model.addAttribute("Notices", Notice);
	 
	 return "noticeview/notice"; }
	 
	 @RequestMapping(path = "/computer", method = RequestMethod.GET) 
	 public String computer(Model model) {
	 
	 List<Space> Space = SearchService.computerlist();
	 model.addAttribute("Spaces", Space);
	 return "noticeview/notice"; 
 }
	 
	 @RequestMapping(path = "/beamproject", method = RequestMethod.GET) 
	 public String beamProject(Model model) {
	 
	 List<Space> Space = SearchService.beamprojectlist();
	 model.addAttribute("Spaces", Space);
	 return "noticeview/notice"; 
 }
	 @RequestMapping(path = "/wifi", method = RequestMethod.GET) 
	 public String wifi(Model model) {
	 
	 List<Space> Space = SearchService.wifilist();
	 model.addAttribute("Spaces", Space);
	 return "noticeview/notice"; 
 }
	 @RequestMapping(path = "/10less", method = RequestMethod.GET) 
	 public String tenless(Model model) {
	 
	 List<Space> Space = SearchService.tenlesslist();
	 model.addAttribute("Spaces", Space);
	 return "noticeview/notice"; 
 }
	 @RequestMapping(path = "/10more", method = RequestMethod.GET) 
	 public String tenmore(Model model) {
	 
	 List<Space> Space = SearchService.tenmore();
	 model.addAttribute("Spaces", Space);
	 return "noticeview/notice"; 
 }



	


}
