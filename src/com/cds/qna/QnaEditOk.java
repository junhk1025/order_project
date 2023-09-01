package com.cds.qna;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/qnaeditok.do")
public class QnaEditOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String seq = req.getParameter("seq");
		String subject = req.getParameter("subject");
		String content = req.getParameter("content");
		String name = req.getParameter("name");
		String pw = req.getParameter("pw");
		
		QnaDAO dao = new QnaDAO();
		QnaDTO dto = new QnaDTO();
		
		dto.setSeq(seq);
		dto.setSubject(subject);
		dto.setContent(content);
		dto.setName(name);
		dto.setPw(pw);
		
		int result = dao.edit(dto);
		
		
		System.out.println(result);
		
		req.setAttribute("result", result);
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/qna/qnaeditok.jsp");
		dispatcher.forward(req, resp);
	}
}
