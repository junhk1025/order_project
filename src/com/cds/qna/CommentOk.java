package com.cds.qna;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/commentok.do")
public class CommentOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String comment = req.getParameter("comment");
		String pseq = req.getParameter("pseq");
		
		HttpSession session = req.getSession();
		
		QnaDAO dao = new QnaDAO();
		CommentDTO dto = new CommentDTO();
		
		dto.setContent(comment);
		dto.setPseq(pseq);
		dto.setPid((String)session.getAttribute("id"));
		
		int result = dao.writeComment(dto);
		
		if(result == 1) {
			dao.state(pseq);
		}
		
		resp.setCharacterEncoding("UTF-8"); //반환될 데이터 인코딩(한글)
		PrintWriter writer = resp.getWriter();
		
		
		writer.print("<script>");
		
		if (result == 1) {
			writer.printf("location.href='/CDSInfo/qnaview.do?subTitleName=고객센터&seq=%s';", pseq);
		} else {
			writer.print("alert('failed');");
			writer.print("history.back();");
		}
		
		writer.print("</script>");
		writer.close();
	
	}
}
