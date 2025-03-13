package com.web.service;

import java.util.List;
import java.util.Map;

import com.web.dto.UserDTO;
import com.web.repository.UserRepository;

public class UserService {
	private UserRepository userRepo = new UserRepository();
	
	public List<UserDTO> selectUsers(Map<String, String> param){
		return userRepo.selectUsers(param);
	}
	public UserDTO selectUser(int uiNum) {
		return userRepo.selectUser(uiNum);
	}
	
	public UserDTO login(String uiId, String uiPwd) {
		UserDTO user = userRepo.selectUserByUiId(uiId);
		if(user!=null && uiPwd.equals(user.getUiPwd())) {
			return user;
		}
		return null;
	}
	public int insertUser(UserDTO user) {
		return userRepo.insertUser(user);
	}
	public int updateUser(UserDTO user) {
		return userRepo.updateUser(user);
	}
	public int deleteUser(int uiNum) {
		return userRepo.deleteUser(uiNum);
	}

}