package com.cds.notice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/noticeedit.do")
public class NoticeEdit extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String subTitleName = req.getParameter("subTitleName");
	    req.setAttribute("subTitleName", subTitleName);
	    req.setAttribute("subTitleNum", 4);
	      
		String seq = req.getParameter("seq");
		
		NoticeDAO dao = new NoticeDAO();
		NoticeDTO dto = dao.get(seq);
		
		/* dto.setSeq(seq); */
		 
		req.setAttribute("dto", dto);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/notice/noticeedit.jsp");
		dispatcher.forward(req, resp);
		
	}
}
