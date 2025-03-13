package com.web.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.web.common.CommonFactory;
import com.web.dto.UserDTO;

public class UserRepository {
	
	public List<UserDTO> selectUsers(Map<String,String> param){
		try(SqlSession session = CommonFactory.getSSF().openSession()){
			return session.selectList("UserMapper.selectUsers", param);
		}
	}
	public UserDTO selectUser(int uiNum) {
		try(SqlSession session = CommonFactory.getSSF().openSession()){
			return session.selectOne("UserMapper.selectUser", uiNum);
		}
	}
	public UserDTO selectUserByUiId(String uiId) {
		try(SqlSession session = CommonFactory.getSSF().openSession()){
			return session.selectOne("UserMapper.selectByUiId", uiId);
		}
	}
	public int insertUser(UserDTO user) {
		try(SqlSession session = CommonFactory.getSSF().openSession(true)){
			return session.insert("UserMapper.insertUser", user);
		}
	}
	public int updateUser(UserDTO user) {
		try(SqlSession session = CommonFactory.getSSF().openSession(true)){
			return session.update("UserMapper.updateUser", user);
		}
	}
	public int deleteUser(int uiNum) {
		try(SqlSession session = CommonFactory.getSSF().openSession(true)){
			return session.delete("UserMapper.deleteUser", uiNum);
		}
	}

}