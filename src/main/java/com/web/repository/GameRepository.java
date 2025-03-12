package com.web.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.web.common.CommonFactory;
import com.web.dto.GameDTO;

public class GameRepository {
	public List<GameDTO> selectGames(GameDTO game) {
		try (SqlSession session = CommonFactory.getSSF().openSession()) {
			return session.selectList("GameMapper.selectGames" ,game);
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
	public static void main(String[] args) {
	GameRepository repo = new GameRepository();
	GameDTO game = new GameDTO();
//	int result = repo.deleteGame(1); 딜리트
//	System.out.println("삭제 : " + result);
//	game.setGiNum(1); 업데이트
//	game.setGiName("배그");
//	game.setGiPrice(27000);
//	game.setGiGenre("슈팅");
//	game.setGiDesc("꿀잼");
//	int result = repo.updateGame(game);
//	System.out.println("변경 : " + result);
//	game.setGiName("피파"); 인서트
//	game.setGiPrice(0);
//	game.setGiGenre("스포츠");
//	game.setGiDesc("꿀");
//	int result = repo.insertGame(game);
//	System.out.println("등록 : " + result);
//	GameDTO game = repo.selectGame(1); 셀렉트 원
//	System.out.println(game);
//		List<GameDTO> games = repo.selectGames(); 셀렉트 리스트
//		
//		for(GameDTO game : games) {
//			System.out.println(game); 
//		}
	}

}
