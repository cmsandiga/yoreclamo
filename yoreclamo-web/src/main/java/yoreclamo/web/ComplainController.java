package yoreclamo.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import yoreclamo.domain.Complain;
import yoreclamo.service.CompanyService;
import yoreclamo.service.ComplainService;

@Controller
@RequestMapping("/reclamo")
public class ComplainController {

	@Autowired
	private CompanyService companyService;

	@Autowired
	private ComplainService complainService;

	@RequestMapping("/registrar")
	public String goToComplainAddView(Model model) {

		model.addAttribute("companies", companyService.findAll());
		return "complain_add";
	}

	@RequestMapping("/detalle/{id}/{companyname}/{title}")
	public String detail(Model model, @PathVariable("id") String id) {

		Complain complain = complainService.findByIdAndEnabledIsTrue(id);

		model.addAttribute("complain", complain);
		model.addAttribute("relatedComplains", complainService.findRelatedComplains(id, complain.companyId));

		return "complain_detail";
	}
}
