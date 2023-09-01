package com.cds.notice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/noticedeleteok.do")
public class NoticeDeleteOk extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		
		NoticeDAO dao = new NoticeDAO();
		NoticeDTO dto = new NoticeDTO();
		
		dto.setSeq(seq);
		
		int result = dao.del(dto);
		
		req.setAttribute("result", result);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/notice/noticedeleteok.jsp");
		dispatcher.forward(req, resp);
	}
}
