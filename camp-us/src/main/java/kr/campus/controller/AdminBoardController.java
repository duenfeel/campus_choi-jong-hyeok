package kr.campus.controller;
import java.util.List;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.security.Principal;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.campus.domain.BoardAdminVO;
import kr.campus.domain.BoardVO;
import kr.campus.domain.Criteria;
import kr.campus.service.BoardAdminService;
import kr.campus.service.BoardService;
import kr.campus.service.MemberService;
import lombok.extern.log4j.Log4j;
@Log4j
@RequestMapping("/admin/board/*")
@Controller
public class AdminBoardController {
	private BoardService service;
	private BoardAdminService adminservice;
	private MemberService memberservice;

	@GetMapping("/test")
	public void test() {

	}

	@GetMapping({ "/update", "/get", "/answer", "/declar" })
	public void get(Authentication authentication, Criteria cri,
			Model model) {
		model.addAttribute("code", cri.getCode());
		model.addAttribute("num", cri.getNum());
		model.addAttribute("pageNum", cri.getPageNum());
		model.addAttribute("pageindex", cri.getPageindex());
		BoardVO vo = service.get(cri.getNum());
		model.addAttribute("vo", vo);
		BoardAdminVO v = adminservice.get(cri.getCode());
		model.addAttribute("v", v);
		String userid = ""; 

		try {
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			userid = userDetails.getUsername();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			if (userid != null)
				model.addAttribute("userid", userid);
			model.addAttribute("member", memberservice.read(userid));
		}
	}

	
	@GetMapping("/add")
	public void add(Principal principal, Criteria cri, Model model) {

		//BoardAdminVO v = adminservice.get(cri.getCode());
		model.addAttribute("pageNum", cri.getPageNum());
		model.addAttribute("code", cri.getCode());
		try {
			model.addAttribute("userid", principal.getName());
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	// 입력 or 수정 같이
		@PostMapping({ "/add","/update", "/answer" })

		public ResponseEntity<String> add(BoardVO vo, Model model) {
			InetAddress local = null;
			try {
				local = InetAddress.getLocalHost();
			} catch (UnknownHostException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String ip = local.getHostAddress();
			vo.setIp(ip);
			log.info(ToStringBuilder.reflectionToString(vo)); // 모든 vo 출력 가능 
			//log.info("1209 :"+ vo.getAttachList().size());
			// log.info("건수:"+vo.getAttachList().size());
			if (vo.getNum() == 0)
				service.add(vo);
			else
				service.update(vo);

			return new ResponseEntity<String>("succuess", HttpStatus.OK);
		}

	@GetMapping("/select")
	public void list(Criteria cri, Model model) {
		if( cri.getNum() !=null)
			model.addAttribute("num", cri.getNum());	
		if(cri.getPageindex() !=1)
		{
			model.addAttribute("pageindex", cri.getPageindex());
		}
		else
		{
			model.addAttribute("pageindex", 1);
		}	
		
		model.addAttribute("code", cri.getCode());
	//	BoardAdminVO v = adminservice.get(cri.getCode());
		//model.addAttribute("v", v);

	}

	@PostMapping(value = "/select", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<BoardVO>> select(Criteria cri) {
		log.info("select service:" + cri.getKeyword());
		List<BoardVO> list = service.select(cri);
		// 보여줄 목록
		
		if(list.size() <= 0) {
			log.info("등록된 게시물이 없습니다.");
		}
//		log.info("총건수:" + list.get(0).getCnt());
		return new ResponseEntity<>(list, HttpStatus.OK);
//		return null;

	}

	

	@PostMapping("/delete")
	public ResponseEntity<String> delete(Long num, Model model) {
		int row = service.delete(num);
		if (row > 0) {
			return new ResponseEntity<String>("succuess", HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

	}

	@GetMapping("declarlist")
	public void declarlist() {

	}

	
	
	
	@PostMapping(value = "/myselect", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<BoardVO>> myselect(Criteria cri) {
		log.info("myselect service:" + cri.getKeyword());
		List<BoardVO> list = service.myselect(cri);
		
		if(list.size() <= 0) {
			log.info("등록된 게시물이 없습니다.");
		}
		return new ResponseEntity<>(list, HttpStatus.OK);

	}
}
