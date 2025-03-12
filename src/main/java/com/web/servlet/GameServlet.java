package com.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if ("game-list".equals(cmd)) {
			List<GameDTO> games = gameService.selectGames(null);
			request.setAttribute("games", games);
		} else if ("game-view".equals(cmd) || "game-update".equals(cmd)){
			String giNumStr = request.getParameter("giNum");
			int giNum = Integer.parseInt(giNumStr);
			GameDTO game = gameService.selectGame(giNum);
			request.setAttribute("game", game);
			
		}
		RequestDispatcher rd =request.getRequestDispatcher("/WEB-INF/views" + uri + ".jsp"); // /game/game-list
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String uri = request.getRequestURI();
		int idx = uri.lastIndexOf("/") + 1;
		String cmd = uri.substring(idx);
		String giName = request.getParameter("giName");
		String giPrice = request.getParameter("giPrice");
		String giGenre = request.getParameter("giGenre");
		String giDesc = request.getParameter("giDesc");
		String giNumStr = request.getParameter("giNum");
		GameDTO game = new GameDTO();
		game.setGiName(giName);
		game.setGiPrice(Integer.parseInt(request.getParameter("giPrice")));
		game.setGiGenre(request.getParameter("giGenre"));
		game.setGiDesc(request.getParameter("giDesc"));
		if(giNumStr !=null) {
			game.setGiNum(Integer.parseInt(giNumStr));
		}
		if("insert".equals(cmd)) {	
			int result = gameService.insertGame(game);
			String msg = "실패하였습니다.";
			if (result == 1) {
				msg = "성공하였습니다.";
			}
			String url = "/game/game-list";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			RequestDispatcher rd = request.getRequestDispatcher("/views/common/msg");
			rd.forward(request, response);
		}else if("update".equals(cmd)) {
			int result = gameService.updateGame(game);
			String msg = "실패하였습니다.";
			if (result == 1) {
				msg = "성공하였습니다.";
			}
			String url = "/game/game-view?giNum=" + game.getGiNum();
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			RequestDispatcher rd = request.getRequestDispatcher("/views/common/msg");
			rd.forward(request, response);
		}else if("delete".equals(cmd)) {
			int result = gameService.deleteGame(game.getGiNum());
			String msg = "실패하였습니다.";
			if (result == 1) {
				msg = "성공하였습니다.";
			}
			String url = "/game/game-list";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			RequestDispatcher rd = request.getRequestDispatcher("/views/common/msg");
			rd.forward(request, response);
		}
	}

}