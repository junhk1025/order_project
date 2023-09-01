package com.cds.faq;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/faqview.do")
public class View extends HttpServlet {

   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

      String subTitleName = req.getParameter("subTitleName");
      req.setAttribute("subTitleName", subTitleName);
      req.setAttribute("subTitleNum", 4);
      
      HttpSession session = req.getSession();
      FaqDAO dao = new FaqDAO();
      String seq = req.getParameter("seq"); //글번호 
      
      if (session.getAttribute("read") == null //직접 view.do 접근 
  			|| ((String)session.getAttribute("read")).equals("n")) { //list.do
  			
  			//조회수 증가
  			dao.addCount(seq);
  			session.setAttribute("read", "y");
  			}
      
      
      
      FaqDTO result = dao.get(seq);

	 String content = result.getContent(); 
	 String regdate = result.getRegdate();

	 regdate = regdate.substring(0, 10); result.setRegdate(regdate);
	 content = content.replace("<", "&lt;").replace(">", "&gt;");
	  
	 content = content.replace("\r\n", "<br>");
	 result.setContent(content);//수정
	  
	 String subject = result.getSubject();
	 
	 subject = subject.replace("<","&lt;").replace(">", "&gt;"); 


	 result.setSubject(subject);//***
	 result.setSeq(seq);//***
	 
	 req.setAttribute("result", result);
	 
	  
	 dao.close();
	 
	 RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/faq/view.jsp");
	 dispatcher.forward(req, resp);
		 
   }
}