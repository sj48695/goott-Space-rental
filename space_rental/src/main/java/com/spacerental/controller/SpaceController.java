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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spacerental.common.Pagination;
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
	public String list(Model model, String type
						, @RequestParam(required = false, defaultValue = "1") int page
						, @RequestParam(required = false, defaultValue = "1") int range){
		try {
			if (type == null) {
				type = "all";
			}
		
			// 전체 게시글 개수
			int listCnt = spaceService.findHostListCnt(type);

			// Pagination 객체생성
			Pagination pagination = new Pagination();
			pagination.pageInfo(page, range, listCnt);

			model.addAttribute("pagination", pagination);

			
	        // 전체리스트
			List<Host> hosts = spaceService.findHostList(pagination,type);
			if(hosts ==null) {
				return "redirect:/";
			}
			
			for (Host host : hosts) {
				host.setFile(spaceService.findHostFile(host.getHostNo()));
			}
			
			model.addAttribute("hosts", hosts);
			model.addAttribute("listCnt", listCnt);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "space/spacelist";
	}
	
	@RequestMapping(value = "/detail/{hostNo}", method = RequestMethod.GET) // {} 여러개의 경로 요청에대해 메서드를 매핑 시킬 수 있다
	public String detail(@PathVariable int hostNo, Model model) {

		Host host = spaceService.findHostByHostNo(hostNo);
		List<Space> spaces = spaceService.findSpacesByHostNo(hostNo);

		if (host == null) { // hostno가 유효하지 않은 경우(데이터베이스에 없는 번호인 경우)
			return "redirect:spacelist";
		}

		List<SpaceFile> hostfiles = spaceService.findHostFilesByHostNo(hostNo);

		host.setFiles((ArrayList<SpaceFile>) hostfiles);
		host.setFile(spaceService.findHostFile(host.getHostNo()));

		model.addAttribute("host", host);
		model.addAttribute("spaces", spaces);

		return "space/detail";
	}
	
	@RequestMapping(value = "/rent", method = RequestMethod.GET) // {} 여러개의 경로 요청에대해 메서드를 매핑 시킬 수 있다
	public String rentForm(int spaceNo, Model model, HttpSession session) {

		Member loginuser = (Member) session.getAttribute("loginuser");
		int nowYear = 0, nowMonth = 0, nowDay = 0;
		Date date = new Date();
		SimpleDateFormat yearSdf = new SimpleDateFormat("yyyy");
		SimpleDateFormat monthSdf = new SimpleDateFormat("MM");
		SimpleDateFormat daySdf = new SimpleDateFormat("dd");
		nowYear = Integer.parseInt(yearSdf.format(date));
		nowMonth = Integer.parseInt(monthSdf.format(date));
		nowDay = Integer.parseInt(daySdf.format(date));

		String[] strWeek = { "일", "월", "화", "수", "목", "금", "토" };
		int[] lastDay = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };

		int total = (nowYear - 1) * 365 + (nowYear - 1) / 4 - (nowYear - 1) / 100 + (nowYear - 1) / 400;
		if ((nowYear % 4 == 0 && nowYear % 100 != 0) || (nowYear % 400 == 0)) {//2월 lastDay
			lastDay[1] = 29;
		} else {
			lastDay[1] = 28;
		}
		for (int i = 0; i < nowMonth - 1; i++) {
			total += lastDay[i];
		}
		total++;
		int week = total % 7;

//		/* 캘린더 change	*/
//		model.addAttribute("year", year);
//		model.addAttribute("month", month);
//		model.addAttribute("day", day);
		
		/* 현재 날짜	*/
		model.addAttribute("nowYear", nowYear);
		model.addAttribute("nowMonth", nowMonth);
		model.addAttribute("nowDay", nowDay);
		
		model.addAttribute("strWeek", strWeek);
		model.addAttribute("lastDay", lastDay[nowMonth - 1]);
		model.addAttribute("week", week);

		/*--------------------------------------------------*/

		Space space = spaceService.findSpaceBySpaceNo(spaceNo);
		if (space == null) { // productno가 유효하지 않은 경우(데이터베이스에 없는 번호인 경우)
			return "redirect:spacelist";
		}
		Host host = spaceService.findHostByHostNo(space.getHostNo());
		
		host.setFile(spaceService.findHostFile(space.getHostNo()));
		space.setFiles((ArrayList<SpaceFile>) spaceService.findSpaceFilesBySpaceNo(space.getSpaceNo()));
		space.setFile(spaceService.findSpcaeFile(space.getSpaceNo()));

		//List<Rent> rents = spaceService.findRentsBySpaceNo(spaceNo);
		
		//model.addAttribute("rents", rents);
		model.addAttribute("host", host);
		model.addAttribute("space", space);
		model.addAttribute("loginuser",loginuser);

		return "space/rent";
	}
	

	@RequestMapping(value = "/rent"
			, method = RequestMethod.POST
			, produces = "text/plain;charset=utf-8") // {} 여러개의 경로 요청에대해 메서드를 매핑 시킬 수 있다
	@ResponseBody
	public String rent(Model model, Rent rent
			, int year, int month, int day
			, int startTime, int endTime
			, HttpSession session) {
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
		System.out.println(startTime);
		System.out.println(endTime);
		System.out.println(rent);
		rentService.registerRent(rent);
		
//		return "redirect:rent?spaceNo="+rent.getSpaceNo();
		return "success";
	}
	
	@RequestMapping(path = "/register_host", method = RequestMethod.GET)
	public String showHostRegisterForm() {
		return "account/register_host";
	}

	@RequestMapping(path = "/register_host", method = RequestMethod.POST)
	public String hostRegister(Host host, HttpSession session
			, String roadAddr, String detailAddr, String extraAddr) {
		Member loginuer = (Member)session.getAttribute("loginuser");
		host.setHostId(loginuer.getId());
		host.setAddress(roadAddr + " " + detailAddr + " " +extraAddr);
		int newHostNo = spaceService.registerHostTx(host);
		return "redirect:/space/write/"+newHostNo;

	}
	
	@RequestMapping(path="/update_host/{hostNo}", method = RequestMethod.GET)
	public String updateHost(@PathVariable int hostNo, Model model) {
		Host host = spaceService.findHostByHostNo(hostNo);
		
		model.addAttribute(host);
		
		return "account/update_host";
	}

	@RequestMapping(value = "/write/{hostNo}", method = RequestMethod.GET)
	public String writeForm(HttpSession session, Model model, @PathVariable int hostNo) {
		model.addAttribute("hostNo", hostNo);
		return "space/write";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(Space space, MultipartHttpServletRequest req, HttpSession session, int hostNo) {
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

						System.out.println(userFileName + " 업로드");
						// 파일 업로드 소스 여기에 삽입
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
			Member loginuser = (Member) session.getAttribute("loginuser");
			space.setHostId(loginuser.getId().toString());
			space.setHostNo(hostNo);
			spaceService.registerSpaceTx(space);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/";
	}

	@RequestMapping(path = "/spacesearch", method = RequestMethod.GET)
	public String spacesearch(@RequestParam(name = "value1") String value, Model model) {

		List<Host> space = spaceService.searchspacelist(value);
		
		for (Host host : space) {
			host.setFile(spaceService.findHostFile(host.getHostNo()));
		}
		
		model.addAttribute("hosts", space);

		return "space/spacelist";
	}

	@RequestMapping(path = "/addsearch", method = RequestMethod.GET)
	public String addsearch(@RequestParam(name = "value2") String value, Model model) {

		List<Host> add = spaceService.searchaddlist(value);
		
		for (Host host : add) {
			host.setFile(spaceService.findHostFile(host.getHostNo()));
		}
		
		model.addAttribute("hosts", add);

		return "space/spacelist";
	}

	@RequestMapping(path = "/computer", method = RequestMethod.GET)
	public String computer(Model model) {

		List<Host> computerSpace = spaceService.computerlist();
		
		for (Host host : computerSpace) {
			host.setFile(spaceService.findHostFile(host.getHostNo()));
		}
		
		model.addAttribute("hosts", computerSpace);
		return "space/spacelist";
	}

	@RequestMapping(path = "/beamproject", method = RequestMethod.GET)
	public String beamProject(Model model) {

		List<Host> beamSpace = spaceService.beamprojectlist();
		
		for (Host host : beamSpace) {
			host.setFile(spaceService.findHostFile(host.getHostNo()));
		}
		
		model.addAttribute("hosts", beamSpace);
		return "space/spacelist";
	}

	@RequestMapping(path = "/wifi", method = RequestMethod.GET)
	public String wifi(Model model) {

		List<Host> wifiSpace = spaceService.wifilist();
		
		for (Host host : wifiSpace) {
			host.setFile(spaceService.findHostFile(host.getHostNo()));
		}
		
		model.addAttribute("hosts", wifiSpace);
		return "space/spacelist";
	}

	@RequestMapping(path = "/10less", method = RequestMethod.GET)
	public String tenless(Model model) {

		List<Host> tenlessSpace = spaceService.tenlesslist();
		
		for (Host host : tenlessSpace) {
			host.setFile(spaceService.findHostFile(host.getHostNo()));
		}
		
		model.addAttribute("hosts", tenlessSpace);
		return "space/spacelist";
	}

	@RequestMapping(path = "/10more", method = RequestMethod.GET)
	public String tenmore(Model model) {

		List<Host> tenmoreSpace = spaceService.tenmore();
		
		for (Host host : tenmoreSpace) {
			host.setFile(spaceService.findHostFile(host.getHostNo()));
		}
		
		model.addAttribute("hosts", tenmoreSpace);
		return "space/spacelist";
	}

	@RequestMapping(value = "/calendar", method = RequestMethod.POST) // {} 여러개의 경로 요청에대해 메서드를 매핑 시킬 수 있다
	public String calendar(int spaceNo, Model model, 
			@RequestParam(defaultValue = "0") int year, 
			@RequestParam(defaultValue = "0") int month, 
			@RequestParam(defaultValue = "0") int day) {

		int nowYear = 0, nowMonth = 0, nowDay = 0;
		Date date = new Date();
		SimpleDateFormat yearSdf = new SimpleDateFormat("yyyy");
		SimpleDateFormat monthSdf = new SimpleDateFormat("MM");
		SimpleDateFormat daySdf = new SimpleDateFormat("dd");
		nowYear = Integer.parseInt(yearSdf.format(date));
		nowMonth = Integer.parseInt(monthSdf.format(date));
		nowDay = Integer.parseInt(daySdf.format(date));


		//StringTokenizer st = new StringTokenizer(sdf.format(date), "-");

		if (year == 0) {
			year = Integer.parseInt(yearSdf.format(date));
		}
		if (month == 0) {
			month = Integer.parseInt(monthSdf.format(date));
		}
		if (day == 0) {
			day = Integer.parseInt(daySdf.format(date));
		}
		
		String[] strWeek = { "일", "월", "화", "수", "목", "금", "토" };
		int[] lastDay = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };

		int total = (year - 1) * 365 + (year - 1) / 4 - (year - 1) / 100 + (year - 1) / 400;
		if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) {//2월 lastDay
			lastDay[1] = 29;
		} else {
			lastDay[1] = 28;
		}
		for (int i = 0; i < month - 1; i++) {
			total += lastDay[i];
		}
		total++;
		int week = total % 7;

		/* 캘린더 change	*/
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("day", day);
		
		/* 현재 날짜	*/
		model.addAttribute("nowYear", nowYear);
		model.addAttribute("nowMonth", nowMonth);
		model.addAttribute("nowDay", nowDay);
		
		model.addAttribute("strWeek", strWeek);
		model.addAttribute("lastDay", lastDay[month - 1]);
		model.addAttribute("week", week);

		/*--------------------------------------------------*/

		Space space = spaceService.findSpaceBySpaceNo(spaceNo);
		if (space == null) { // productno가 유효하지 않은 경우(데이터베이스에 없는 번호인 경우)
			return "redirect:spacelist";
		}
		Host host = spaceService.findHostByHostNo(space.getHostNo());
		
		host.setFile(spaceService.findHostFile(space.getHostNo()));
		space.setFiles((ArrayList<SpaceFile>) spaceService.findSpaceFilesBySpaceNo(space.getSpaceNo()));
		space.setFile(spaceService.findSpcaeFile(space.getSpaceNo()));

		model.addAttribute("host", host);
		model.addAttribute("space", space);

		return "space/calendar";
	}

}
