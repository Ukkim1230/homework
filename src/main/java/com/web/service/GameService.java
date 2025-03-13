package com.web.service;

import java.util.List;
import java.util.Map;

import com.web.dto.GameDTO;
import com.web.repository.GameRepository;

public class GameService {
	
	private GameRepository gameRepo = new GameRepository();
	
	public List<GameDTO> selectGames(Map<String,String> param){
		return gameRepo.selectGames(param);
	}
	public GameDTO selectGame(int giNum) {
		return gameRepo.selectGame(giNum);
	}
	public int insertGame(GameDTO game) {
		return gameRepo.insertGame(game);
	}
	public int updateGame(GameDTO game) {
		return gameRepo.updateGame(game);
	}
	public int deleteGame(int giNum) {
		return gameRepo.deleteGame(giNum);
	}

}