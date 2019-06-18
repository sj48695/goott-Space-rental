package com.spacerental.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spacerental.common.Util;
import com.spacerental.service.LoseService;
import com.spacerental.vo.Lose;
import com.spacerental.vo.LoseFile;

@Controller
@RequestMapping(path="/loseview")
public class LoseController {
	
	@Autowired
	@Qualifier("loseService")
	private LoseService loseService;
	
	@RequestMapping(path = "/lose", method = RequestMethod.GET)
	public String Lose() {
		
		return "loseview/lose";
	}
		
	@RequestMapping(path = "/loselist", method = RequestMethod.GET)
	public String LoseList(Model model) {

		List<Lose> lose = loseService.findList();
		System.out.println(lose);

		model.addAttribute("loses", lose);
		return "loseview/loselist";
	}
	
	@RequestMapping(path = "/losewrite", method = RequestMethod.GET)
	public String Losewrite() {
		return "loseview/losewrite";
	}
	
	@RequestMapping(path = "/losewrite", method = RequestMethod.POST)
	public String loseWrite(MultipartHttpServletRequest req, Lose lose) {
		
		System.out.println(lose);
		
		MultipartFile mf = req.getFile("attach");
		boolean k = mf.isEmpty();
		
		if (k == false) {
			
			ServletContext application = req.getServletContext();
			String path = application.getRealPath("/upload-files");
			
			String userFileName = mf.getOriginalFilename();
			if (userFileName.contains("\\")) { // iexplore 경우
				//C:\AAA\BBB\CCC.png -> CCC.png 
				userFileName = userFileName.substring(userFileName.lastIndexOf("\\") + 1);
			}
			String savedFileName = Util.makeUniqueFileName(userFileName);
			
			try {
				mf.transferTo(new File(path, savedFileName)); //파일 저장
								
				LoseFile loseFile = new LoseFile();
				loseFile.setUserFileName(userFileName);
				loseFile.setSavedFileName(savedFileName);
				ArrayList<LoseFile> files = new ArrayList<LoseFile>();
				files.add(loseFile);
				lose.setFiles(files);
				
				//데이터 저장				
				loseService.registerLose(lose);

			} catch (Exception ex) {
				ex.printStackTrace();
			}
		} else if (k == true) {
			loseService.registerLose2(lose);
			return "redirect:loselist";
		}
		
		return "redirect:loselist";
	}
	
	@RequestMapping(path = "/findlist", method = RequestMethod.GET)
	public String findList() {
		
		return "loseview/findlist";
	}
	
	@RequestMapping(path = "/findwrite", method = RequestMethod.GET)
	public String FindWrite() {
		
		return "loseview/findwrite";
	}
	
//	@RequestMapping(path = "/losedetail", method = RequestMethod.GET)
//	public String losedetail(@RequestParam(name="loseno") int loseNo, Model model) {
//		
//		Lose lose = loseService.findLoseByLoseNo(loseNo);
//		if (lose == null) { 
//			return "redirect:loselist";
//		}		
//		List<LoseFile> files = loseService.findLoseFilesByLoseNo(loseNo);
//		lose.setFiles((ArrayList<LoseFile>)files);
//		
//		model.addAttribute("lose", lose);
//		
//		return "loseview/losedetail"; 
//	}
	
}
