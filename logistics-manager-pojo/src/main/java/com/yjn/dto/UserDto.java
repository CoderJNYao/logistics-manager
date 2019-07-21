package com.yjn.dto;

import java.util.List;
import com.yjn.pojo.User;

public class UserDto extends BasePage{
	
	//用户信息
	public User user;
	
	//关联分配的角色信息
	public List<Integer> roles;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<Integer> getRoles() {
		return roles;
	}

	public void setRoles(List<Integer> roles) {
		this.roles = roles;
	}
	
	
}
