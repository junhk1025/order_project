package com.cds.qna;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/qnadelcomment.do")
public class QnaDelComment extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String seq = req.getParameter("seq"); //댓글을 삭제하기 위해 댓글 번호
		String pseq = req.getParameter("pseq"); //삭제 후 돌아갈 부모 글번호(view.do)
		
		QnaDAO dao = new QnaDAO();
		int result = dao.delComment(seq); //댓글 삭제
		//System.out.println("result" + result);
		
		
		resp.setCharacterEncoding("UTF-8"); //반환될 데이터 인코딩(한글)
		
		PrintWriter writer = resp.getWriter(); //JSP 없이 서블릿으로 직접 HTML 생성
		
		
		writer.print("<script>");
		
		if (result == 1) { //댓글 삭제 결과
			dao.stateDel(pseq);
			//성공
			writer.printf("location.href='/CDSInfo/qnaview.do?subTitleName=고객센터&seq=%s';", pseq);
		} else {
			//실패
			writer.print("alert('failed');");
			writer.print("history.back();");
		}
		
		writer.print("</script>");
		writer.close();
		
	}
}
