package com.cds.qna;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/qnadeleteok.do")
public class QnaDeleteOk extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String seq = req.getParameter("seq");

		
		QnaDAO dao = new QnaDAO();
		QnaDTO dto = new QnaDTO();
		
		dto.setSeq(seq);

		
		int result = dao.del(dto);
		
		
		req.setAttribute("result", result);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/qna/qnadeleteok.jsp");
		dispatcher.forward(req, resp);
	}
}