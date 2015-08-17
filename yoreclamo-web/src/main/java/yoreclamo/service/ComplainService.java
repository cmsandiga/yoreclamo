package yoreclamo.service;

import java.util.Collections;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yoreclamo.domain.Company;
import yoreclamo.domain.Complain;
import yoreclamo.repository.ComplainRepository;

@Service
public class ComplainService {

	@Autowired
	private ComplainRepository complainRepository;

	@Autowired
	private CompanyService companyService;

	public List<Complain> findAll() {

		List<Complain> complains = complainRepository.findAllByEnabledIsTrueOrderByCreationDesc();
		if (complains == null)
			return Collections.emptyList();

		complains.stream().forEach(complain -> {
			complain.company = companyService.findOne(complain.companyId);
		});

		return complains;
	}

	public Complain findByIdAndEnabledIsTrue(String id) {
		Complain complain = complainRepository.findByIdAndEnabledIsTrue(id);

		if (complain == null)
			return null;

		complain.company = companyService.findOne(complain.companyId);

		return complain;
	}

	public List<Complain> findRelatedComplains(String id, String companyId) {

		List<Complain> complains = complainRepository.findByIdNotAndEnabledIsTrueAndCompanyId(id, companyId);

		if (complains == null)
			complains = Collections.emptyList();

		complains.stream().forEach(complain -> {
			complain.company = companyService.findOne(complain.companyId);
		});

		return complains;
	}

	public Complain insert(Complain complain) {

		Company company = companyService.findOne(complain.getCompany().getId());

		if (company == null)
			companyService.insert(complain.getCompany().getName());

		complain.creation = new Date();
		complain.enabled = false;
		complain.titleNormalized = complain.getTitle().toLowerCase().replace(" ", "-");
		complain.company = company;
		
		complain = complainRepository.insert(complain);

		company = companyService.incrementCompanyComplainCounter(company.getId());
		
		complain.url = generateIndexURL(complain.getId(), company.getId(), complain.titleNormalized);

		return complainRepository.save(complain);
	}

	private String generateIndexURL(String complainId, String companyId, String titleNormaized) {
		return complainId + "/" + companyId + "/" + titleNormaized;
	}

}
