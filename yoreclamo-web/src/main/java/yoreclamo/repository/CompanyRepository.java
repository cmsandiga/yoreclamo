package yoreclamo.repository;

import org.springframework.data.mongodb.repository.MongoRepository;

import yoreclamo.domain.Company;

public interface CompanyRepository extends MongoRepository<Company, String>{

}
