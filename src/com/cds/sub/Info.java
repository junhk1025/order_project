package com.cds.sub;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/info.do")
public class Info extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String subTitleName = req.getParameter("subTitleName");
		req.setAttribute("subTitleName", subTitleName);
		req.setAttribute("subTitleNum", 2);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/sub/info.jsp");
		dispatcher.forward(req, resp);
	}
}