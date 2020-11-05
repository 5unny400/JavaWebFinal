package exercise;

import java.io.Serializable;

/**
 * @author Administrator
 *
 */
public class Person implements Serializable{

	// 姓名
	private String name;
	// 电话号码
	private String phone;
	// 工作单位
	private String workPlace;
	// 邮箱
	private String email;
	// 用户名
	private String userName;
	// 用户密码
	private String passwd;
	// 用户类型
	private String userType;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getWorkPlace() {
		return workPlace;
	}

	public void setWorkPlace(String workPlace) {
		this.workPlace = workPlace;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}
}
