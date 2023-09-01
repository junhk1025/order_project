package com.cds.qna;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cds.qna.QnaDAO;
import com.cds.qna.QnaDTO;
import com.cds.qna.CommentDTO;

@WebServlet("/qnaview.do")
public class QnaView extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String subTitleName = req.getParameter("subTitleName");
		req.setAttribute("subTitleName", subTitleName);
		req.setAttribute("subTitleNum", 4);
		
		HttpSession session = req.getSession();
		
		
		
		String seq = req.getParameter("seq");

		QnaDAO dao = new QnaDAO();
		
		
		if (session.getAttribute("read") == null //직접 view.do 접근 
				|| ((String)session.getAttribute("read")).equals("n")) { //list.do
			
			//조회수 증가
			dao.addCount(seq);
			session.setAttribute("read", "y");
			
		}
		
		
		QnaDTO result = dao.get(seq);
		
		//JSP에게 돌려주기 전에 데이터 가공
		String content = result.getContent();	
		String regdate = result.getRegdate();
		
		regdate = regdate.substring(0, 10);
		result.setRegdate(regdate);
		
		//<>를 이스케이프하기
		content = content.replace("<", "&lt;").replace(">", "&gt;");
		
		//개행문자를 <br>로 바꾸기
		content = content.replace("\r\n", "<br>");
		result.setContent(content);//수정		
		
		String subject = result.getSubject();		
		subject = subject.replace("<", "&lt;").replace(">", "&gt;");		
		result.setSubject(subject);//***
		
		//댓글 목록 가져오기
		ArrayList<CommentDTO> clist = dao.clist(seq);
		
		for(CommentDTO dto : clist) {
			//JSP에게 돌려주기 전에 데이터 가공
			String contentc = dto.getContent();	
			String regdatec = dto.getRegdate();
			
			regdatec = regdatec.substring(0, 10);
			dto.setRegdate(regdatec);
			
			//<>를 이스케이프하기
			contentc = contentc.replace("<", "&lt;").replace(">", "&gt;");
			
			//개행문자를 <br>로 바꾸기
			contentc = contentc.replace("\r\n", "<br>");
			dto.setContent(contentc);//수정		

		}
		
		

		req.setAttribute("clist", clist);
		req.setAttribute("result", result);
		req.setAttribute("seq", seq);
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/qna/qnaview.jsp");
		dispatcher.forward(req, resp);
	}
}
