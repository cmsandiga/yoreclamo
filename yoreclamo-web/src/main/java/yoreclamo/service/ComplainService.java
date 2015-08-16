package yoreclamo.service;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yoreclamo.domain.Complain;
import yoreclamo.repository.ComplainRepository;

@Service
public class ComplainService {

	@Autowired
	private ComplainRepository complainRepository;

	@Autowired
	private CompanyService companyService;

	public List<Complain> findAllByEnabledIsTrue() {

		List<Complain> complains = complainRepository.findAllByEnabledIsTrue();
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
}
