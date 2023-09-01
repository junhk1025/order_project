package com.cds.qna;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/qnalist.do")
public class QnaList extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String subTitleName = req.getParameter("subTitleName");
		req.setAttribute("subTitleName", subTitleName);
		req.setAttribute("subTitleNum", 4);
		
		HttpSession session = req.getSession();
		
		//조회수 증가 방지 티켓
		session.setAttribute("read", "n");
		
		QnaDAO dao = new QnaDAO();
		

		//페이징 관련 변수
		int nowPage = 0;		//현재 페이지 번호
		int totalCount = 0;		//총 게시물 수
		int pageSize = 10;		//한 페이지당 보일 게시물 수
		int totalPage = 0;		//총 페이지 수
		int begin = 0;			//where절 시작 위치
		int end = 0;			//where절 끝 위치
		int n = 0;				//페이지 바
		int loop = 0;			//페이지 바
		int blockSize = 10;		//페이지 바
		
		
		//list.do > list.do?page=1 간주
		//list.do?page=3
		String page = req.getParameter("page");
		if (page == null || page == "") nowPage = 1;
		else nowPage = Integer.parseInt(page);
		
		//nowPage : 현재 보려는 페이지 번호가 들어있다. > 연산
		//1page > where rnum between 1 and 10
		//2page > where rnum between 11 and 20
		//3page > where rnum between 21 and 30
		begin = ((nowPage - 1) * pageSize) + 1;
		end = begin + pageSize - 1;
		
		
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("begin", begin + "");
		map.put("end", end + "");
		
		
		//list.do : 보통 목록 보기
		//list.do?word=게시판&column=subject : 검색 결과 목록 보기
		
		boolean isSearch = false;
		String word = req.getParameter("word");
		String column = req.getParameter("column");
		
		if (!((word == null || word == "") 
				&& (column == null || column == ""))) {
			isSearch = true;
		}

		if (isSearch) {
			map.put("word", word);
			map.put("column", column);
		}
		
		
		
		//총 게시물 수 알아내기
		totalCount = dao.getTotalCount(map); //135
		
		//총 페이지 수 알아내기
		//135 / 10 = 13.5 -> 14
		totalPage = (int)Math.ceil((double)totalCount / pageSize);
		
		
		
		ArrayList<QnaDTO> list = dao.list(isSearch,map);
		
		
		for (QnaDTO dto : list) {
			//등록일 시간 자르기
			dto.setRegdate(dto.getRegdate().substring(0, 10));
			
			//제목이 길면 (...)처리
			String subject = dto.getSubject();
			if (subject.length() > 30) {
				subject = subject.substring(0, 30) + " ...";
				dto.setSubject(subject);
			}
				
			//제목 이스케이프
			subject = subject.replace("<", "&lt;").replace(">", "&gt;");		
			dto.setSubject(subject);
			
			//검색 중이면.. 검색어를 강조하기
			if (isSearch && column.equals("subject")) {
				//안녕하세요. 저는 홍길동입니다.
				//안녕하세요. 저는 <span style='강조'>홍길동</span>입니다.
				subject = subject.replace(word, "<span style='font-weight:bold;color:#4285f4;'>" + word + "</span>");
				dto.setSubject(subject);
			}
		}
		
		
		
		//페이지바 제작
		String pagebar = "";
		

		
		loop = 1; //루프 변수(while)
		n = ((nowPage - 1) / blockSize) * blockSize + 1; //출력되는 페이지 번호 사용
		
		
		pagebar += "<div id=\"paging-wrap\">\r\n" + 
				"		<div id=\"paging\">";
		
		
		//이전 10페이지
		if (n == 1) {
			pagebar += String.format("<a href='#!'> <img src=\"images/ico_prev.png\"></a>");
		} else {
			pagebar += String.format("<a href='/CDSInfo/qnalist.do?subTitleName=고객센터&page=%d'> <img src=\"images/ico_prev.png\"></a>", n-1);
		}
			
		
		
		while (!(loop > blockSize || n > totalPage)) {
		
			if (n == nowPage) {
				pagebar += String.format(" <span><a href='#!' style='color:#4285F4;'>%d</a></span> ", n);
			} else {
				pagebar += String.format(" <span><a href='/CDSInfo/qnalist.do?subTitleName=고객센터&page=%d'>%d</a></span> ", n, n);
			}
			
			loop++;
			n++;
			
		} //while
		
		
		
		//다음 10페이지
		if (n > totalPage) {		
			pagebar += String.format("<a href='#!'> <img src=\"images/ico_next.png\"></a>");
		} else {
			pagebar += String.format("<a href='/CDSInfo/qnalist.do?subTitleName=고객센터&page=%d'> <img src=\"images/ico_next.png\"></a>", n);
		}
		
		
		pagebar += "</div>\r\n" + 
					"	</div> ";


		req.setAttribute("list", list);
		req.setAttribute("isSearch", isSearch);
		req.setAttribute("map", map); //검색 데이터
		req.setAttribute("nowPage", nowPage); //현재 페이지 번호
		req.setAttribute("totalPage", totalPage); //총 페이지 수
		req.setAttribute("pagebar", pagebar); //페이지바

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/qna/qnalist.jsp");
		dispatcher.forward(req, resp);
	}
}
