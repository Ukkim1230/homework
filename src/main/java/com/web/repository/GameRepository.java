package com.web.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.web.common.CommonFactory;
import com.web.dto.GameDTO;

public class GameRepository {
	public List<GameDTO> selectGames(Map<String, String> param) {
		try (SqlSession session = CommonFactory.getSSF().openSession()) {
			return session.selectList("GameMapper.selectGames", param);
		}
	}

	public GameDTO selectGame(int giNum) {
		try (SqlSession session = CommonFactory.getSSF().openSession()) {
			return session.selectOne("GameMapper.selectGame", giNum);
		}
	}

	public int insertGame(GameDTO game) {
		try (SqlSession session = CommonFactory.getSSF().openSession(true)) {
			return session.insert("GameMapper.insertGame", game);
		}
	}

	public int updateGame(GameDTO game) {
		try (SqlSession session = CommonFactory.getSSF().openSession(true)) {
			return session.update("GameMapper.updateGame", game);
		}
	}

	public int deleteGame(int giNum) {
		try (SqlSession session = CommonFactory.getSSF().openSession(true)) {
			return session.delete("GameMapper.deleteGame", giNum);
		}
	}
}