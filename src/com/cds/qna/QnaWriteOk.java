package com.cds.qna;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/qnawriteok.do")
public class QnaWriteOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String subject = req.getParameter("subject");
		String content = req.getParameter("content");
		String name = req.getParameter("name");
		String pw = req.getParameter("pw");
		
//		System.out.println(subject);
//		System.out.println(content);
//		System.out.println(name);
//		System.out.println(pw);
		
		
		QnaDAO dao = new QnaDAO();
		QnaDTO dto = new QnaDTO();
		
		dto.setSubject(subject);
		dto.setContent(content);
		dto.setName(name);
		dto.setPw(pw);
		
		int result = dao.write(dto);
		
		
		System.out.println(result);
		
		req.setAttribute("result", result);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/qna/qnawriteok.jsp");
		dispatcher.forward(req, resp);
	}
}
