package yoreclamo.service;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yoreclamo.domain.Company;
import yoreclamo.repository.CompanyRepository;

@Service
public class CompanyService {

	@Autowired
	private CompanyRepository companyRepository;

	public List<Company> findAll() {
		List<Company> companies = companyRepository.findAll();

		if (companies == null)
			companies = Collections.emptyList();

		return companies;
	}

	public Company findOne(String id) {
		return companyRepository.findOne(id);
	}
}
