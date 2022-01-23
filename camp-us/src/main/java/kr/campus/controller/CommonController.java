package kr.campus.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Locale;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.campus.domain.PageDTO;
import kr.campus.service.ItemService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
@Log4j
@Controller
@RequestMapping("/common/*")
@AllArgsConstructor 
public class CommonController {
//	private CommonService service;
	private ItemService itemService;
	@Resource
	private String uploadPath;
	@GetMapping("/main")
	public void main(Model model) {
		log.info("recommended items list");
		model.addAttribute("recommendedItems", itemService.recommendedItems());
	}
	
	@GetMapping("/contact")
	public void contact(Authentication authentication, Locale locale, Model model) {
		GetAuth.getAuth(authentication, model);
	}
	
	@GetMapping("/search")
	public void search() {
	}
	
	@GetMapping("/searchResult")
	public void searchResult() {
	}
	
	
	@RequestMapping(value = "/ckUpload", method = RequestMethod.POST)
	@ResponseBody
	public void ckUpload(HttpServletRequest req, HttpServletResponse res, @RequestParam MultipartFile upload)
			throws Exception {
		log.info("컨트롤 진입");
		// 랜덤 문자 생성
		UUID uid = UUID.randomUUID();
		OutputStream out = null;
		PrintWriter printWriter = null; // 인코딩
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=utf-8");
		try {
			String fileName = upload.getOriginalFilename(); // 파일
			// 이름 가져오기
			byte[] bytes = upload.getBytes();
			// 업로드 경로
			String ckUploadPath = uploadPath + File.separator + "ckUpload" + File.separator + uid + "_" + fileName;
			out = new FileOutputStream(new File(ckUploadPath));
			out.write(bytes);
			out.flush(); // out에 저장된 데이터를 전송하고 초기화
			String callback = req.getParameter("CKEditorFuncNum");
			printWriter = res.getWriter();
			String fileUrl = "/ckUpload/" + uid + "_" + fileName; // 작성화면 //
			// String fileUrl = "/ckUpload/" + uid + "&fileName=" + fileName; // 작성화면
			// 업로드시 메시지 출력
			printWriter.println("{\"filename\" : \"" + fileName + "\", \"uploaded\" : 1, \"url\":\"" + fileUrl + "\"}");
			printWriter.flush();
		} catch (IOException e) {
			log.info("error:"+e.getMessage());
			// e.printStackTrace();
		}
	}
}