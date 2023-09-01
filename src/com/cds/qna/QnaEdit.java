package com.cds.qna;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/qnaedit.do")
public class QnaEdit extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String subTitleName = req.getParameter("subTitleName");
		req.setAttribute("subTitleName", subTitleName);
		req.setAttribute("subTitleNum", 4);

		String seq = req.getParameter("seq");
		
		QnaDAO dao = new QnaDAO();
		QnaDTO dto = dao.get(seq);
		
		//JSP에게 돌려주기 전에 데이터 가공
		String content = dto.getContent();	
		String regdate = dto.getRegdate();
		
		regdate = regdate.substring(0, 10);
		dto.setRegdate(regdate);
		
		//<>를 이스케이프하기
		content = content.replace("&lt;", "<").replace("&gt;", ">");
		
		//개행문자를 <br>로 바꾸기
		content = content.replace("<br>", "\r\n");
		dto.setContent(content);//수정		
		
		String subject = dto.getSubject();		
		subject = subject.replace("&lt;", "<").replace("&gt;", ">");		
		dto.setSubject(subject);//***
		
		req.setAttribute("dto", dto);
		req.setAttribute("seq", seq);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/qna/qnaedit.jsp");
		dispatcher.forward(req, resp);
	}
}