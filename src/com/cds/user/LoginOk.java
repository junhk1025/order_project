package com.cds.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/loginok.do")
public class LoginOk extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id = req.getParameter("id");
		String pw = req.getParameter("pwd");
		
		UserDAO dao = new UserDAO();
		UserDTO dto = new UserDTO();
		
		dto.setId(id);
		dto.setPw(pw);
		
		UserDTO result = dao.signin(dto);
		
		if (result != null) {
			//인증 성공 > 인증 티켓 발급 > session
			HttpSession session = req.getSession(); //서블릿에서 세션 참조
			session.setAttribute("id", result.getId()); //인증 티켓
			session.setAttribute("pw", result.getPw()); //인증 티켓
			session.setAttribute("name", result.getName()); //인증 티켓
			session.setAttribute("tel", result.getTel()); //인증 티켓
			session.setAttribute("lv", result.getLv()); //인증 티켓
			session.setAttribute("bigo", result.getBigo()); //인증 티켓
			
		} else {
			//인증 실패
			
		}		
		
		req.setAttribute("result", result);
		dao.close();
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/loginok.jsp");
		dispatcher.forward(req, resp);
	}
}
