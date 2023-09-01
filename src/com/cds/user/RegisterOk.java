package com.cds.user;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/registerok.do")
public class RegisterOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String name = req.getParameter("name");
		String tel = req.getParameter("phone");
		String lv = req.getParameter("sel");
		String bigo = "";
		
		switch(lv) {
			case "2":
				bigo="발주담당자";
				break;
			case "3":
				bigo="매입담당자";
				break;
			case "4":
				bigo="거래처직원";
				break;
		}
		
		UserDAO dao = new UserDAO();
		UserDTO dto = new UserDTO();
		
		dto.setId(id);
		dto.setPw(pw);
		dto.setName(name);
		dto.setTel(tel);
		dto.setLv(lv);
		dto.setBigo(bigo);
		
		
		int result = dao.register(dto);
		
		req.setAttribute("result", result);
		
		
		System.out.println(id);
		System.out.println(pw);
		System.out.println(name);
		System.out.println(tel);
		System.out.println(lv);
		System.out.println(bigo);
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/registerok.jsp");
		dispatcher.forward(req, resp);
	}
	
}
