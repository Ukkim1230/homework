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
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import com.web.dto.UserDTO;
import com.web.service.UserService;


@WebServlet(urlPatterns = "/user/*")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserService userService = new UserService();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		int idx = uri.lastIndexOf("/") + 1;
		String cmd = uri.substring(idx);
		if("user-list".equals(cmd)) {
			String search = request.getParameter("search");
			String searchStr = request.getParameter("searchStr");
			Map<String, String> param = new HashMap<>();
			param.put("search", search);
			param.put("searchStr", searchStr);
			List<UserDTO> users = userService.selectUsers(param);
			request.setAttribute("users", users);
			
		}else if("user-view".equals(cmd) || "user-update".equals(cmd)) {
			String uiNumStr = request.getParameter("uiNum");
			int uiNum = Integer.parseInt(uiNumStr);
			UserDTO user = userService.selectUser(uiNum);
			request.setAttribute("user", user);
		}
		String viewPath = "/WEB-INF/views/user/" + cmd + ".jsp";
		RequestDispatcher rd = request.getRequestDispatcher(viewPath);
		rd.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String uri = request.getRequestURI();
		int idx = uri.lastIndexOf("/")+1;
		String cmd = uri.substring(idx);
		UserDTO user = new UserDTO();
		try {
			BeanUtils.populate(user, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		String msg = "";
		String url = "";
		if("login".equals(cmd)) {
			UserDTO loginUser = userService.login(user.getUiId(),user.getUiPwd());
			HttpSession session = request.getSession();
			session.setAttribute("user", loginUser);
			msg = "아이디나 비밀번호가 잘못되었습니다.";
			url = "/views/user/login";
			if(loginUser!=null) {
				msg = loginUser.getUiName()	+ "님 반갑습니다,";
				url = "/";
			}
		}else if("insert".equals(cmd)) {
			msg = "실패";
			if(userService.insertUser(user) == 1) {
				msg = "성공";
			}
			url = "/user/user-list";
		}else if ("update".equals(cmd)) {
			msg = "실패";
			if(userService.updateUser(user) == 1) {
				msg = "성공";
			}
			url = "/user/user-view?uiNum=" + user.getUiNum();
		}else if ("delete".equals(cmd)) {
			msg = "실패";
			if(userService.deleteUser(user.getUiNum()) == 1) {
				msg = "성공";
			}
			url = "/user/user-list";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		rd.forward(request, response);
	}

}