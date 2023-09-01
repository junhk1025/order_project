package com.cds.qna;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/qnaviewsecretok.do")
public class QnaViewSecretOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String seq = req.getParameter("seq");
		String pw = req.getParameter("pw");
		
		QnaDAO dao = new QnaDAO();
		
		int flag = dao.check(seq,pw);
		System.out.println(flag);

		
		resp.setContentType("plain/text"); //브라우저에게 돌려받을 데이터가 순수 Text이다.
		
		PrintWriter writer = resp.getWriter();
		
		writer.print(flag); //유일한 브라우저 반환값
		
		writer.close();

	}
}
