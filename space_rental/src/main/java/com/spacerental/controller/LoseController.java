package com.spacerental.controller;

import java.io.File;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spacerental.common.Util;
import com.spacerental.service.LoseService;
import com.spacerental.service.MemberService;
import com.spacerental.vo.Host;
import com.spacerental.vo.Lose;
import com.spacerental.vo.LoseFile;
import com.spacerental.vo.Member;
import com.spacerental.vo.Rent;

@Controller
@RequestMapping(path = "/loseview")
public class LoseController {

	@Autowired
	@Qualifier("loseService")
	private LoseService loseService;
	
	@Autowired
	@Qualifier("memberService")
	private MemberService memberService;

	@RequestMapping(path = "/lose", method = RequestMethod.GET)
	public String Lose(Model model, HttpSession session) {
		Member loginuser = (Member) session.getAttribute("loginuser");
		if (loginuser != null) {
			model.addAttribute("id", loginuser.getId());
		}
		return "loseview/lose";
	}

	@RequestMapping(path = "/loselist/{type}", method = RequestMethod.GET)
	public String LoseList( Model model, @PathVariable String type, HttpSession session) {
		
		
		Member loginuser = (Member) session.getAttribute("loginuser");
		
		List<Lose> loses = loseService.loseList(type);
		
		model.addAttribute("loginuser", loginuser);
		model.addAttribute("type", type);
		model.addAttribute("loses", loses);
		return "loseview/loselist";
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, false));
	}
	
	@RequestMapping(path = "/losewrite/{type}", method = RequestMethod.GET)
	public String writeForm(@PathVariable String type, Model model,HttpSession session) {
		Member loginuser = (Member) session.getAttribute("loginuser");
		
		if(loginuser == null) {
			return "redirect:/loseview/lose";
		}
		List<Rent> rents = memberService.selectrentList(loginuser.getId());
		
		try {
			ArrayList<Host> hosts = loseService.findHostNoById(loginuser.getId());
			model.addAttribute("hosts",hosts);
			System.out.println(hosts);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("rents", rents);
		model.addAttribute("loginuser",loginuser);
		model.addAttribute("type", type);
		return "loseview/losewrite";
	}

	@RequestMapping(path = "/losewrite", method = RequestMethod.POST)
	public String loseWrite(MultipartHttpServletRequest req, Lose lose, HttpSession session) {
		
		Member loginuser = (Member) session.getAttribute("loginuser");

		MultipartFile mf = req.getFile("attach");
		//boolean k = mf.isEmpty();
		
		ServletContext application = req.getServletContext();
		String path = application.getRealPath("/resources/files/lose-files");
		
		String userFileName = mf.getOriginalFilename();
		if (userFileName.contains("\\")) { // iexplore 경우
			// C:\AAA\BBB\CCC.png -> CCC.png
			userFileName = userFileName.substring(userFileName.lastIndexOf("\\") + 1);
		}
		String savedFileName = Util.makeUniqueFileName(userFileName);
		
		try {
			mf.transferTo(new File(path, savedFileName)); // 파일 저장

			LoseFile loseFile = new LoseFile();
			loseFile.setUserFileName(userFileName);
			loseFile.setSavedFileName(savedFileName);
			ArrayList<LoseFile> files = new ArrayList<LoseFile>();
			files.add(loseFile);
			lose.setFiles(files);
			lose.setUploader(loginuser.getId());

			// 데이터 저장
			loseService.registerLoseTx(lose);
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} 
		
		String encodedUrl = "";
		try {
			encodedUrl = URLEncoder.encode(lose.getType(), "utf-8");
		} catch (Exception ex) {}
		
		return "redirect:loselist/" + encodedUrl;
	}

	@RequestMapping(path = "/losedetail/{loseNo}", method = RequestMethod.GET)
	public String losedetail(@PathVariable int loseNo, Model model, HttpSession session) {

		Member loginuser = (Member) session.getAttribute("loginuser");
		Lose lose = loseService.findLoseByLoseNo(loseNo);
		if (lose == null) {
			return "redirect:loselist";
		}

		List<LoseFile> files = loseService.findLoseFilesByLoseNo(loseNo);
		
		Date date = lose.getLoseDate();
		String d = date.toString();
	
		
		lose.setFiles((ArrayList<LoseFile>)files);
		model.addAttribute("lose", lose);
		model.addAttribute("d",d);
		model.addAttribute("loginuser",loginuser);
		return "loseview/losedetail";
	}

	// update text불러오기
	@RequestMapping(path = "/loseupdate/{loseNo}", method = RequestMethod.GET)
	public String loseUpdateForm(@PathVariable int loseNo, Model model) {

		Lose lose = loseService.findLoseByLoseNo(loseNo);
		model.addAttribute("lose", lose);

		return "loseview/loseupdate";
	}

	// update 실행
	@RequestMapping(path = "/loseupdate", method = RequestMethod.POST)
	public String loseUpdate(Lose lose, Model model) {
		System.out.println(lose);
		loseService.updateLoseUpdate(lose);
		
		String encodedUrl = "";
		try {
			encodedUrl = URLEncoder.encode(lose.getType(), "utf-8");
		} catch (Exception ex) {}

		return "redirect:loselist/" + encodedUrl;
	}

	// delete 실행
	@RequestMapping(path = "/losedelete/{loseNo}", method = RequestMethod.GET)
	public String loseDeleteFirm(@PathVariable int loseNo, Model model) {

		loseService.loseDelete(loseNo);

		return "redirect:/loseview/lose";
	}

	 @RequestMapping(path = "/losesearch", method = RequestMethod.GET)
	 public String losssearch(@RequestParam(name="value3") String value, Model model) {
		 
	 List<Lose> Losee = loseService.searchlosslist(value);
	 model.addAttribute("loses", Losee);
	 
	 return "loseview/loselist";
	 }

	 
}
