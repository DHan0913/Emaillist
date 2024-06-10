package himedia.vo;

import java.util.Date;

public class EmailVo {
	// 필드
	private Long no;
	private String lastName;
	private String firstName;
	private String email;
	private Date createdAt;

	// 생성자
	public EmailVo() {
	}

	// 전체 필드 생성자
	public EmailVo(Long no, String lastName, String firstName, String email, Date createdAt) {
		this.no = no;
		this.lastName = lastName;
		this.firstName = firstName;
		this.email = email;
		this.createdAt = createdAt;
	}

	// no(PK) -> 시퀸스, createdAt -> default
	public EmailVo(String lastName, String firstName, String email) {
		this.lastName = lastName;
		this.firstName = firstName;
		this.email = email;
	}

	//	getters and setters
	public Long getNo() {
		return no;
	}

	public void setNo(Long no) {
		this.no = no;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	@Override
	public String toString() {
		return "EmailVo [no=" + no + ", lastName=" + lastName + ", firstName=" + firstName + ", email=" + email
				+ ", createdAt=" + createdAt + "]";
	}
	
	

}
