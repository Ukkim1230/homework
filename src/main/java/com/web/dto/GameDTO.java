package com.web.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class GameDTO {
	private int giNum;
	private String giName;
	private int giPrice;
	private String giGenre;
	private String[] giGenres;
	private String giDesc;

	public void SetGiGenres(String[] giGenres) {
		if (giGenres != null) {
			this.giGenres = giGenres;
			giGenre = String.join(",", giGenres);
		}
	}

	public String giGenre() {
		if (giGenre == null) {
			if (giGenres != null) {
				giGenre = String.join(",", giGenres);

			}
		}
		return giGenre;
	}
}