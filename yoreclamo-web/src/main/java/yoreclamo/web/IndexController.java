package yoreclamo.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import yoreclamo.service.ComplainService;

@Controller
public class IndexController {

	@Autowired
	private ComplainService complainService;

	@RequestMapping("/")
	public String index(Model model) {

		model.addAttribute("complains", complainService.findAllByEnabledIsTrue());

		return "index";
	}

}
