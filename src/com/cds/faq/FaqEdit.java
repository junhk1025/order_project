package com.cds.faq;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/faqedit.do")
public class FaqEdit extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String subTitleName = req.getParameter("subTitleName");
	    req.setAttribute("subTitleName", subTitleName);
	    req.setAttribute("subTitleNum", 4);
	      
		String seq = req.getParameter("seq");
		
		FaqDAO dao = new FaqDAO();
		FaqDTO dto = dao.get(seq);
		
		/* dto.setSeq(seq); */
		 
		req.setAttribute("dto", dto);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/faq/faqedit.jsp");
		dispatcher.forward(req, resp);
		
	}
}
