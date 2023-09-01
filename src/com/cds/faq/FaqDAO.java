package com.cds.faq;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.cds.main.DBUtil;
import com.cds.notice.NoticeDTO;

public class FaqDAO {
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	
	public FaqDAO() {
		this.conn = DBUtil.open();
	}
	
	public void close() {
		
		try {
			this.conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	/**
	 * FAQ 게시판 총 게시물 수 가져오기
	 * @author 지수빈
	 * @param HashMap<String, String> map
	 * @return rs.getInt("cnt")
	 */
	public int getTotalCount(HashMap<String, String> map) {
		try {
			
			String where = "";
			 
			 if (map.get("column") != null && map.get("word") != null) { 
				 where = String.format("where %s like '%%%s%%'", map.get("column"), map.get("word")); 
			}
			 
			
			//총 게시물 수 반환
			String sql = "select count(*) as cnt from vfaq " + where;
			pstat = conn.prepareStatement(sql);
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			System.out.println("FaqDAO.getTotalCount() : " + e.toString());
		}
		
		return 0;
	}

	/**
	 * FAQ 게시판 글 리스트 가져오기
	 * @author 지수빈
	 * @param boolean isSearch
	 * @param HashMap<String, String> map
	 * @return list = seq, rnum, subject, regdate, readcount, isnew
	 */
	public ArrayList<FaqDTO> list(boolean isSearch, HashMap<String, String> map) {
		try {
			 String where = "";
	         
	         if (isSearch) {
	            where = String.format("where %s like '%%%s%%'"
	                              , map.get("column")
	                              , map.get("word"));
	         } 

	         
			String sql = String.format("select * from (select f.* from vfaq f %s) where rnum between %s and %s order by seq desc" 
					, where
                   , map.get("begin")
                   , map.get("end"));

			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<FaqDTO> list = new ArrayList<FaqDTO>();
			
			while(rs.next()) {
				FaqDTO dto = new FaqDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setRnum(rs.getString("rnum"));
				dto.setSubject(rs.getString("subject"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setReadcount(rs.getString("readcount"));
				dto.setIsnew(rs.getString("isnew"));
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return null;
	}

	/**
	 * FAQ 게시판 조회수 증가
	 * @author 지수빈
	 * @param seq
	 */
	public void addCount(String seq) {
		try {
			
			String sql = "update tblfaq set readcount = readcount + 1 where seq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}

	/**
	 * FAQ 게시판 글 정보 가져오기
	 * @author 지수빈
	 * @param seq
	 * @return dto = seq, subject, regdate, readcount, content
	 */
	public FaqDTO get(String seq) {
		try {
			String sql = "select * from vfaq where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				FaqDTO dto = new FaqDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setSubject(rs.getString("subject"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setReadcount(rs.getString("readcount"));
				dto.setContent(rs.getString("content"));
				
				return dto;
			}
			
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return null;
	}

	/**
	 * FAQ 게시판 글 쓰기
	 * @author 지수빈
	 * @param dto = subject, content, id
	 * @return pstat.executeUpdate() 성공 1 실패 0
	 */
	public int write(FaqDTO dto) {
		try {
			String sql = "insert into tblfaq(seq, subject, content, pid) values(tblfaq_seq.nextVal, ?, ?, ?)";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getSubject());
			pstat.setString(2, dto.getContent());
			pstat.setString(3, dto.getId());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("FaqDTO.write() : " + e.toString());
		}
		return 0;
	}

	/**
	 * FAQ 게시판 글 수정
	 * @author 지수빈
	 * @param dto = subject, content, seq
	 * @return pstat.executeUpdate() 성공 1 실패 0
	 */
	public int edit(FaqDTO dto) {
		try {
			String sql = "update tblfaq set subject = ?, content = ? where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getSubject());
			pstat.setString(2, dto.getContent());
			pstat.setString(3, dto.getSeq());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("FaqDTO.edit() : " + e.toString());
		}
		return 0;
	}

	/**
	 * FAQ 게시판 글 삭제
	 * @author 지수빈
	 * @param dto = seq
	 * @return pstat.executeUpdate() 성공 1 실패 0
	 */
	public int del(FaqDTO dto) {
		try {
			String sql = "delete from tblfaq where seq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getSeq());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("FaqDTO.del() : " + e.toString());
		}
		return 0;
	}
	
	
	
}

