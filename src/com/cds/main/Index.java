package com.cds.main;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cds.notice.NoticeDAO;
import com.cds.notice.NoticeDTO;

@WebServlet("/index.do")
public class Index extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Index.java	
		//시작
		req.setAttribute("navLv", 1);
		
		
		NoticeDAO dao = new NoticeDAO();
		
		ArrayList<NoticeDTO> list = dao.list();
		
		//등록일 자르기 + 제목 자르기 + 제목 이스케이프
		for (NoticeDTO dto : list) {
			dto.setRegdate(dto.getRegdate().substring(0, 10));
			
			String subject = dto.getSubject();
			if (subject.length() > 15) {
				subject = subject.substring(0, 15) + "...";
				dto.setSubject(subject);
			}
				
			subject = subject.replace("<", "&lt;").replace(">", "&gt;");		
			dto.setSubject(subject);
		}
		
		
		req.setAttribute("list", list);
		
		dao.close();

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/index.jsp");
		dispatcher.forward(req, resp);

	}

}
