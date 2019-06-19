package com.spacerental.controller;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spacerental.common.Util;
import com.spacerental.service.RentService;
import com.spacerental.service.SpaceService;
import com.spacerental.vo.Host;
import com.spacerental.vo.Member;
import com.spacerental.vo.Rent;
import com.spacerental.vo.Space;
import com.spacerental.vo.SpaceFile;

@Controller
@RequestMapping(value = "/space")
public class SpaceController {
	
	@Autowired
	@Qualifier("spaceService")
	private SpaceService spaceService;
	
	@Autowired
	@Qualifier("rentService")
	private RentService rentService;
	
	@RequestMapping(value = "/spacelist", method = RequestMethod.GET) // {} 여러개의 경로 요청에대해 메서드를 매핑 시킬 수 있다
	public String list(Model model) {

		List<Host> hosts = spaceService.findHostList();

		for (Host host : hosts) {
			host.setFile(spaceService.findHostFile(host.getHostNo()));
		}

		model.addAttribute("hosts", hosts);

		return "space/spacelist";
	}
	
	@RequestMapping(value = "/detail/{hostNo}", method = RequestMethod.GET) // {} 여러개의 경로 요청에대해 메서드를 매핑 시킬 수 있다
	public String detail(@PathVariable int hostNo, Model model) {

		Host host = spaceService.findHostByHostNo(hostNo);
		List<Space> spaces = spaceService.findSpacesByHostNo(hostNo);

		if (host == null) { // productno가 유효하지 않은 경우(데이터베이스에 없는 번호인 경우)
			return "redirect:spacelist";
		}

		List<SpaceFile> hostfiles = spaceService.findHostFilesByHostNo(hostNo);
		host.setFiles((ArrayList<SpaceFile>) hostfiles);

		model.addAttribute("host", host);
		model.addAttribute("spaces",spaces);

		return "space/detail";
	}
	
	@RequestMapping(value = "/rent", method = RequestMethod.GET) // {} 여러개의 경로 요청에대해 메서드를 매핑 시킬 수 있다
	public String rentForm(int spaceNo, Model model, int year, int month) {

		int day = 0;
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		StringTokenizer st = new StringTokenizer(sdf.format(date), "-");

		if (year == 0) {
			year = Integer.parseInt(st.nextToken());
		}
		if (month == 0) {
			month = Integer.parseInt(st.nextToken());
		}
		if (day == 0) {
			day = Integer.parseInt(st.nextToken());
		}
		String[] strWeek = { "일", "월", "화", "수", "목", "금", "토" };
		int[] lastDay = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
		
		model.addAttribute("nowYear", year);
		model.addAttribute("nowMonth", month);
		model.addAttribute("nowDay", day);
		model.addAttribute("strWeek", strWeek);
		model.addAttribute("strMonth", month);
		model.addAttribute("strYear", year);

		// 요일 출력 end
		// 달력 출력 start
		int total = (year - 1) * 365 + (year - 1) / 4 - (year - 1) / 100 + (year - 1) / 400;

		if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) {
			lastDay[1] = 29;
		} else {
			lastDay[1] = 28;
		}

		for (int i = 0; i < month - 1; i++) {
			total += lastDay[i];
		}

		total++;

		int week = total % 7;

		model.addAttribute("lastDay", lastDay[month-1]);
		model.addAttribute("week", week);

		
		
		
		
		/*--------------------------------------------------*/	
		
		Space space = spaceService.findSpaceBySpaceNo(spaceNo);
		if (space == null) { // productno가 유효하지 않은 경우(데이터베이스에 없는 번호인 경우)
			return "redirect:spacelist";
		}
		Host host = spaceService.findHostByHostNo(space.getHostNo());
		
		model.addAttribute("host", host);
		model.addAttribute("space", space);

		return "space/rent";
	}
	

	@RequestMapping(value = "/rent", method = RequestMethod.POST) // {} 여러개의 경로 요청에대해 메서드를 매핑 시킬 수 있다
	public String rent(Model model, Rent rent,int year, int month, int day, HttpSession session) {
		Member loginuser = (Member) session.getAttribute("loginuser");
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");

		System.out.println(rent);
		rent.setId(loginuser.getId());
		String strDate = year+"-"+month+"-"+day;
		Date date = null;
		try {
			date = sdf.parse(strDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		rent.setRentDate(date);
		System.out.println(rent);
		rentService.registerRent(rent);
		
		return "redirect:rent?spaceNo="+rent.getSpaceNo();
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
	public String writeForm(HttpSession session, Model model, @PathVariable int hostNo) {
		model.addAttribute("hostNo", hostNo);
		return "space/write";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(Space space, MultipartHttpServletRequest req, HttpSession session, int hostNo) {
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
			Member loginuser = (Member) session.getAttribute("loginuser");
			space.setHostId(loginuser.getId().toString());
			space.setHostNo(hostNo);
			spaceService.registerSpaceTx(space);
			System.out.println(space);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/";
	}
	
//	@ResponseBody
//	@RequestMapping(value = "/calender",method = RequestMethod.POST)
//	public String calender(int year, int month) {
//		System.out.println(year + " / " + month);
//		return "redirect:rent";
//	}
}
