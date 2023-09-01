package com.cds.qna;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/qnaviewsecret.do")
public class QnaViewSecret extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String subTitleName = req.getParameter("subTitleName");
		req.setAttribute("subTitleName", subTitleName);
		req.setAttribute("subTitleNum", 4);
	
		String seq = req.getParameter("seq");
	
		req.setAttribute("seq", seq);
	
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/qna/qnaviewsecret.jsp");
		dispatcher.forward(req, resp);
		
	}
}