package com.spacerental.controller;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spacerental.common.Util;
import com.spacerental.service.SpaceService;
import com.spacerental.vo.Space;
import com.spacerental.vo.SpaceFile;

@Controller
@RequestMapping(value = "/space")
public class SpaceController {
	
	@Autowired
	@Qualifier("spaceService")
	private SpaceService spaceService;
	
	@RequestMapping(value="/list", method = RequestMethod.GET) // {} 여러개의 경로 요청에대해 메서드를 매핑 시킬 수 있다
	public String list() {
		 
		
		return "/space/spacelist";
	}
	
	@RequestMapping(value="/detail", method = RequestMethod.GET) // {} 여러개의 경로 요청에대해 메서드를 매핑 시킬 수 있다
	public String detail() {
		 
		
		return "/space/detail";
	}

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeForm() {
		return "space/write";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(Space space, MultipartHttpServletRequest req) {
		SpaceFile spaceFile = new SpaceFile();
		ServletContext application = req.getServletContext();
		String path = application.getRealPath("/resources/files/space-files");// 최종 파일 저장 경로
		String userFileName = "";
		try {
			MultipartFile titleImg = req.getFile("titleImgFile");
			if (titleImg != null) {
				userFileName = titleImg.getOriginalFilename();
				if (userFileName.contains("\\")) { // iexplore 경우
					// C:\AAA\BBB\CCC.png -> CCC.png
					userFileName = userFileName.substring(userFileName.lastIndexOf("\\") + 1);
				}
				if (userFileName != null && userFileName.length() > 0) { // 내용이 있는 경우
					if (userFileName.contains("\\")) { // iexplore 경우
						// C:\AAA\BBB\CCC.png -> CCC.png
						userFileName = userFileName.substring(userFileName.lastIndexOf("\\") + 1);
					}
					String uniqueFileName = Util.makeUniqueFileName(path, userFileName);// 파일이름_1.jpg
					// String uniqueFileName=Util.makeUniqueFileName(fileName);//고유한 파일이름.jpg
					titleImg.transferTo(new File(path, uniqueFileName));// 파일 저장

					spaceFile.setSavedFileName(uniqueFileName);
					spaceFile.setFlag(true);
					space.setFile(spaceFile);
				}
			}

			MultipartFile img = req.getFile("imgFile");
			if (img != null) {
				userFileName = img.getOriginalFilename();
				if (userFileName.contains("\\")) { // iexplore 경우
					// C:\AAA\BBB\CCC.png -> CCC.png
					userFileName = userFileName.substring(userFileName.lastIndexOf("\\") + 1);
				}
				if (userFileName != null && userFileName.length() > 0) { // 내용이 있는 경우
					if (userFileName.contains("\\")) { // iexplore 경우
						// C:\AAA\BBB\CCC.png -> CCC.png
						userFileName = userFileName.substring(userFileName.lastIndexOf("\\") + 1);
					}
					String uniqueFileName = Util.makeUniqueFileName(path, userFileName);// 파일이름_1.jpg
					// String uniqueFileName=Util.makeUniqueFileName(fileName);//고유한 파일이름.jpg
					img.transferTo(new File(path, uniqueFileName));// 파일 저장

					ArrayList<SpaceFile> files = new ArrayList<SpaceFile>();
					spaceFile.setSavedFileName(uniqueFileName);
					spaceFile.setFlag(false);
					files.add(spaceFile);
					space.setFiles(files);
				}
			}
			space.setHostid("sj");
			spaceService.registerSpaceTx(space);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/";
	}
	
//	@ResponseBody
//	@RequestMapping(value = "/titleImg"
//					, method = RequestMethod.POST
//					//, produces="text/plain;charset=utf-8"
//	 				, consumes ="multipart/form-data")
//	public String titleImg(MultipartHttpServletRequest req) {
//
//		String uniqueFileName = "";
//		try {
//			System.out.println(req.getContentType());
//			MultipartFile img = req.getFile("titleImgFile");
//			ServletContext application = req.getServletContext();
//			String path = application.getRealPath("/resources/files/space-files");// 최종 파일 저장 경로
//			if (img != null) {
//				String userFileName = img.getOriginalFilename();
//				if (userFileName != null && userFileName.length() > 0) { // 내용이 있는 경우
//					if (userFileName.contains("\\")) { // iexplore 경우
//						// C:\AAA\BBB\CCC.png -> CCC.png
//						userFileName = userFileName.substring(userFileName.lastIndexOf("\\") + 1);
//					}
//					uniqueFileName = Util.makeUniqueFileName(path, userFileName);// 파일이름_1.jpg
//				}
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return uniqueFileName;
//		
//		
////		System.out.println(titleImg);
////		//titleImg.substring(12);
////		return titleImg.replace("C:\\fakepath\\", "");
//	}
	
}
