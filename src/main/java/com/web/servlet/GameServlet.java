package com.web.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.web.dto.GameDTO;
import com.web.service.GameService;

@WebServlet(urlPatterns = "/game/*")
public class GameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private GameService gameService = new GameService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		int idx = uri.lastIndexOf("/") + 1;
		String cmd = uri.substring(idx);
		if ("game-list".equals(cmd)) {
			String search = request.getParameter("search");
			String searchStr = request.getParameter("searchStr");
			Map<String, String> param = new HashMap<>();
			param.put("search", search);
			param.put("searchStr", searchStr);
			List<GameDTO> games = gameService.selectGames(param);
			request.setAttribute("games", games);

		} else if ("game-view".equals(cmd) || "game-update".equals(cmd)) {
			String giNumStr = request.getParameter("giNum");
			int giNum = Integer.parseInt(giNumStr);
			GameDTO game = gameService.selectGame(giNum);
			request.setAttribute("game", game);

		}
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views" + uri + ".jsp"); // /game/game-list
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String uri = request.getRequestURI();
		int idx = uri.lastIndexOf("/") + 1;
		String cmd = uri.substring(idx);
		GameDTO game = new GameDTO();
		try {
			BeanUtils.populate(game, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		String[] genres = request.getParameterValues("giGenres");
		if (genres != null && genres.length > 0) {
		    game.setGiGenre(String.join(",", genres));
		}
		System.out.println(game);

		String msg = "";
		String url = "/game/game-list";
		if ("insert".equals(cmd)) {
			msg = "실패하였습니다.";
			if (gameService.insertGame(game) == 1) {
				msg = "성공하였습니다.";
			}
		} else if ("update".equals(cmd)) {
			msg = "실패하였습니다.";
			if (gameService.updateGame(game) == 1) {
				msg = "성공하였습니다.";
			}
			url = "/game/game-view?giNum=" + game.getGiNum();
		} else if ("delete".equals(cmd)) {
			msg = "실패하였습니다.";
			if (gameService.deleteGame(game.getGiNum()) == 1) {
				msg = "성공하였습니다.";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		rd.forward(request, response);

	}
}