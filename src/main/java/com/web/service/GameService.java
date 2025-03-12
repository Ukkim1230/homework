package com.web.service;

import java.util.List;

import com.web.dto.GameDTO;
import com.web.repository.GameRepository;

public class GameService {
	
	private GameRepository gameRepo = new GameRepository();
	
	public List<GameDTO> selectGames(GameDTO game){
		return gameRepo.selectGames(game);
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
