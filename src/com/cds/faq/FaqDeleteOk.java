package com.cds.faq;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cds.notice.NoticeDAO;
import com.cds.notice.NoticeDTO;

@WebServlet("/faqdeleteok.do")
public class FaqDeleteOk extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		
		FaqDAO dao = new FaqDAO();
		FaqDTO dto = new FaqDTO();
		
		dto.setSeq(seq);
		
		int result = dao.del(dto);
		
		req.setAttribute("result", result);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/faq/faqdeleteok.jsp");
		dispatcher.forward(req, resp);
	}
}
