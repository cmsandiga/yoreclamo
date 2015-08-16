package yoreclamo.repository;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;

import yoreclamo.domain.Complain;

public interface ComplainRepository extends MongoRepository<Complain, String>{

	public Complain findByIdAndEnabledIsTrue(String id);
	
	public List<Complain> findAllByEnabledIsTrue();
	
	public List<Complain> findByIdNotAndEnabledIsTrueAndCompanyId(String id, String companyId);
}
