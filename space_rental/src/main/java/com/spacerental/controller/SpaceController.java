package com.spacerental.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spacerental.common.Util;
import com.spacerental.service.SpaceService;
import com.spacerental.vo.Host;
import com.spacerental.vo.Member;
import com.spacerental.vo.Space;
import com.spacerental.vo.SpaceFile;

@Controller
@RequestMapping(value = "/space")
public class SpaceController {
	
	@Autowired
	@Qualifier("spaceService")
	private SpaceService spaceService;
	
	@RequestMapping(value="/spacelist", method = RequestMethod.GET) // {} 여러개의 경로 요청에대해 메서드를 매핑 시킬 수 있다
	public String list(Model model) {
		 
		List<Host> hosts = spaceService.findHostList();
		
		for(Host host : hosts) {
			host.setFile(spaceService.findHostFile(host.getHostNo()));
		}
	
		model.addAttribute("hosts", hosts);

		return "space/spacelist";
	}
	
	@RequestMapping(value="/detail/{hostNo}", method = RequestMethod.GET) // {} 여러개의 경로 요청에대해 메서드를 매핑 시킬 수 있다
	public String detail(@PathVariable int hostNo, Model model) {
		
		 Host host = spaceService.findHostByHostNo(hostNo);
		 
		 if(host == null) { //productno가 유효하지 않은 경우(데이터베이스에 없는 번호인 경우)
				return "redirect:spacelist";
			}
		 
		List<SpaceFile> hostfiles = spaceService.findHostFilesByHostNo(hostNo);
		host.setFiles((ArrayList<SpaceFile>)hostfiles);
		
		host.setFile(spaceService.findHostFile(host.getHostNo()));
		
		 model.addAttribute("host", host);
		 
		return "space/detail";
	}
	
	@RequestMapping(path = "/register_host", method = RequestMethod.GET)
	public String showHostRegisterForm() {
		return "account/register_host";
	}

	@RequestMapping(path = "/register_host", method = RequestMethod.POST)
	public String hostRegister(Host host, HttpSession session
			, String open_start, String open_end
			, String roadAddr, String detailAddr, String extraAddr) {
		Member loginuer = (Member)session.getAttribute("loginuser");
		host.setHostId(loginuer.getId());
		host.setOpen(open_start + " ~ " + open_end);
		host.setAddress(roadAddr + " " + detailAddr + " " +extraAddr);
		int newHostNo = spaceService.registerHost(host);
		return "redirect:/space/write/"+newHostNo;

	}

	@RequestMapping(value = "/write/{hostNo}", method = RequestMethod.GET)
	public String writeForm(HttpSession session, Model model,@PathVariable int hostNo) {
		model.addAttribute("hostNo",hostNo);
		return "space/write";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(Space space, MultipartHttpServletRequest req,HttpSession session,int hostNo) {
		
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

					SpaceFile spaceFile = new SpaceFile();
					spaceFile.setSavedFileName(uniqueFileName);
					spaceFile.setFlag(true);
					space.setFile(spaceFile);
				}
			}

			List<MultipartFile> img = req.getFiles("imgFile");
			
			if (img != null) {
				File file = new File(path);
				ArrayList<SpaceFile> files = new ArrayList<SpaceFile>();
				
				for (int i = 0; i < img.size(); i++) {
					userFileName = img.get(i).getOriginalFilename();
					if (userFileName.contains("\\")) { // iexplore 경우
						// C:\AAA\BBB\CCC.png -> CCC.png
						userFileName = userFileName.substring(userFileName.lastIndexOf("\\") + 1);
					}
					if (userFileName != null && userFileName.length() > 0) { // 내용이 있는 경우
						
						System.out.println(userFileName +" 업로드");
						//파일 업로드 소스 여기에 삽입
						String uniqueFileName = Util.makeUniqueFileName(path, userFileName);// 파일이름_1.jpg
					    file = new File(path, uniqueFileName);
						img.get(i).transferTo(file); 
					
						
						SpaceFile spaceFile = new SpaceFile();
						spaceFile.setSavedFileName(uniqueFileName);
						spaceFile.setFlag(false);
						files.add(spaceFile);
						space.setFiles(files);
					}
				}
			}
			Member loginuser = (Member)session.getAttribute("loginuser");
			space.setHostId(loginuser.getId().toString());
			space.setHostNo(hostNo);
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
