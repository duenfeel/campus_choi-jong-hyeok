package kr.campus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/payment/*")
@AllArgsConstructor
public class PaymentController {

	@GetMapping("/payment")
	public void payment() {}
}
