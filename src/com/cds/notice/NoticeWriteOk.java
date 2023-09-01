package com.cds.notice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/noticewriteok.do")
public class NoticeWriteOk extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		

		NoticeDAO dao = new NoticeDAO();
		NoticeDTO dto = new NoticeDTO();
		
		dto.setSubject(title);
		dto.setContent(content);
		dto.setId((String)session.getAttribute("id")); //로그인 한 ID
		
		int result = dao.write(dto);
		
		req.setAttribute("result", result);	
		
		dao.close();
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/notice/noticewriteok.jsp");
		dispatcher.forward(req, resp);
	}
}
