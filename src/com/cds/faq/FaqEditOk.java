package com.cds.faq;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cds.notice.NoticeDAO;
import com.cds.notice.NoticeDTO;

@WebServlet("/faqeditok.do")
public class FaqEditOk extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String seq = req.getParameter("seq");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		FaqDAO dao = new FaqDAO();
		FaqDTO dto = new FaqDTO();
		
		dto.setSeq(seq);
		dto.setSubject(title);
		dto.setContent(content);

		int result = dao.edit(dto);
		
		req.setAttribute("result", result);	
		req.setAttribute("seq", seq);
		
		dao.close();
	}
}
