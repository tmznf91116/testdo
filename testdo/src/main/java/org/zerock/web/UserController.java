package org.zerock.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.MamberVO;


@Controller
public class UserController {
	private static final Logger logger =
			LoggerFactory.getLogger(UserController.class);
	
	@RequestMapping("user")
	public String user(Model model) {
		
		MamberVO member = new MamberVO("userid","paw","name","서울시");
		
		logger.info("user");
		
		//model.addAttribute("ProductVO",product);
		model.addAttribute(member); //이름클래스의 첫문자는 소문자로 저장됨
		
		return "user";
	}
		
}
