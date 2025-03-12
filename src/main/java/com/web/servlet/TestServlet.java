package com.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.dto.TestDTO;
import com.web.service.TestService;

public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private TestService testService = new TestService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		int idx = uri.lastIndexOf("/");
		String cmd = uri.substring(idx+1);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if("test-list".equals(cmd)) {
			List<TestDTO> tests = testService.selectTests(null);
			request.setAttribute("tests",tests);
		}else if("test-view".equals(cmd) || "test-update".equals(cmd)) {
			String tiNumStr = request.getParameter("tiNum");
			int tiNum = Integer.parseInt(tiNumStr);
			TestDTO test = testService.selectTest(tiNum);
			request.setAttribute("test", test);
		}
		RequestDispatcher rd = request.getRequestDispatcher("/views" +uri);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String uri = request.getRequestURI();
		int idx = uri.lastIndexOf("/") +1;
		String cmd = uri.substring(idx);
		String tiName = request.getParameter("tiName");
		String tiNumStr = request.getParameter("tiNum");
		TestDTO test = new TestDTO();
		test.setTiName(tiName);
		if(tiNumStr!=null) {
			test.setTiNum(Integer.parseInt(tiNumStr));
		}
		if("insert".equals(cmd)) {
			int result = testService.insertTest(test);
			String msg = "실패하였습니다.";
			if (result == 1) {
				msg = "성공하였습니다.";
			}
			String url = "/test/test-list";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			RequestDispatcher rd = request.getRequestDispatcher("/views/common/msg");
			rd.forward(request,response);
		}else if ("delete".equals(cmd)) {
			int result = testService.deleteTest(test.getTiNum());
			String msg = "실패하였습니다.";
			if (result == 1) {
				msg = "성공하였습니다.";
			}
			String url = "/test/test-list";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			RequestDispatcher rd = request.getRequestDispatcher("/views/common/msg");
			rd.forward(request,response);
		}else if ("update".equals(cmd)) {
			int result = testService.updateTest(test);
			String msg = "실패하였습니다.";
			if (result == 1) {
				msg = "성공하였습니다.";
			}
			String url = "/test/test-view?tiNum="+ test.getTiNum();
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			RequestDispatcher rd = request.getRequestDispatcher("/views/common/msg");
			rd.forward(request,response);
	}

	}
}