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

@WebServlet("/findidok.do")
public class FindIdOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		String phone = req.getParameter("phone");
		System.out.println(phone);
		String name = req.getParameter("name");
		
		UserDAO dao = new UserDAO();
		
		UserDTO result = dao.findId(phone,name);
		
		req.setAttribute("result", result);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/findidok.jsp");
		dispatcher.forward(req, resp);
	}
	
	
//	private String phoneNum(String phone) {
//		String result = "";
//		String regExp = "(\\d{3})-(\\d{3,4})-(\\d{4})";
//		Pattern pattern = Pattern.compile(regExp);
//		Matcher match = pattern.matcher(phone);
//		
//		if(match.matches()) {
//			return phone;
//		} else {
//			result = phone.replaceAll("(\\d{3})(\\d{3,4})(\\d{4})","$1-$2-$3");
//		}
//		return result;
//	}
}
