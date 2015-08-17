package yoreclamo.domain;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Field;

public class Company {

	@Id
	private String id;

	private String name;
	
	@Field(value="name_normalized")
	private String nameNormalized;

	@Field(value="complain_counter")
	private Integer complainCounter;

	public Company() {

	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNameNormalized() {
		return nameNormalized;
	}

	public void setNameNormalized(String nameNormalized) {
		this.nameNormalized = nameNormalized;
	}

	public Integer getComplainCounter() {
		return complainCounter;
	}

	public void setComplainCounter(Integer complainCounter) {
		this.complainCounter = complainCounter;
	}
	
	
}
