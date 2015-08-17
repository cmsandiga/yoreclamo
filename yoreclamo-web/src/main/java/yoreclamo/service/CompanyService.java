package yoreclamo.service;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Service;

import yoreclamo.domain.Company;
import yoreclamo.repository.CompanyRepository;

@Service
public class CompanyService {

	@Autowired
	private CompanyRepository companyRepository;

	@Autowired
	private MongoTemplate mongoTemplate;

	public List<Company> findAll() {
		List<Company> companies = companyRepository.findAll();

		if (companies == null)
			companies = Collections.emptyList();

		return companies;
	}

	public Company findOne(String id) {
		return companyRepository.findOne(id);
	}

	public Company insert(String name) {
		Company company = new Company();
		String normalizedCompany = name.toLowerCase().replace(" ", "-");

		company.setName(name);
		company.setNameNormalized(normalizedCompany);
		company.setComplainCounter(0);

		return companyRepository.insert(company);
	}

	public Company incrementCompanyComplainCounter(String companyId) {

		return mongoTemplate.findAndModify(new Query(Criteria.where("_id").is(companyId)),
				new Update().inc("complain_counter", 1), Company.class);

	}
}
