package kr.campus.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ChatController {

	@GetMapping("/chat")
	public void chat(Authentication authentication,Model model) {
		String userid = "";

		try {
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			userid = userDetails.getUsername();
		
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			if (userid != null)
				model.addAttribute("userid", userid);
		}
	}
}