package com.cds.qna;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.cds.main.DBUtil;

public class QnaDAO {
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public QnaDAO() {
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
	 * 1:1 문의 게시판 리스트
	 * @author 이연수
	 * @param isSearch 검색유무
	 * @param map column="컬럼명", word="검색내용", begin="where절 시작", end="where절 끝"
	 * @return list [seq, subject, content, regdate, readcount, name, pw, state]
	 */
	public ArrayList<QnaDTO> list(boolean isSearch, HashMap<String, String> map) {
		try {
			
			String where = "";
			
			if (isSearch) {
				where = String.format("where %s like '%%%s%%'"
										, map.get("column")
										, map.get("word"));
			} 
			
			String sql = String.format("select * from (select row_number() over(order by cl.seq desc) as rnum,cl.* from tblClientQ cl %s) where rnum between %s and %s"
												, where
												, map.get("begin")
												, map.get("end"));
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<QnaDTO> list = new ArrayList<QnaDTO>();
			
			while(rs.next()) {
				QnaDTO dto = new QnaDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setReadcount(rs.getString("readcount"));
				dto.setName(rs.getString("name"));
				dto.setPw(rs.getString("pw"));
				dto.setState(rs.getString("state"));
				
				
				
				list.add(dto);
			}
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	/**
	 * 선택한 글 번호의 내용
	 * @author 이연수
	 * @param seq 선택한 글 번호
	 * @return dto [seq, subject, content, regdate, readcount, name, pw, state]
	 */
	public QnaDTO get(String seq) {
		try {
			 String sql ="select * from tblClientQ where seq =?";
			 pstat = conn.prepareStatement(sql);
			 pstat.setString(1, seq);
			 
			 rs = pstat.executeQuery();
			 
			 if(rs.next()) {
					QnaDTO dto = new QnaDTO();
					
					dto.setSeq(rs.getString("seq"));
					dto.setSubject(rs.getString("subject"));
					dto.setContent(rs.getString("content"));
					dto.setRegdate(rs.getString("regdate"));
					dto.setReadcount(rs.getString("readcount"));
					dto.setName(rs.getString("name"));
					dto.setPw(rs.getString("pw"));
					dto.setState(rs.getString("state"));
					
					return dto;
				}
	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return null;
	}

	/**
	 * 문의글 작성
	 * @author 이연수
	 * @param dto [subject, content, name, pw]
	 * @return 1(성공), 0(실패)
	 */
	public int write(QnaDTO dto) {

		try {
			String sql = "insert into tblClientQ(seq,subject,content,name,pw) values(tblClientQ_seq.nextVal,?,?,?,?)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getSubject());
			pstat.setString(2, dto.getContent());
			pstat.setString(3, dto.getName());
			pstat.setString(4, dto.getPw());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return 0;
	}

	/**
	 * 문의글 삭제
	 * @author 이연수
	 * @param dto [seq]
	 * @return 1(성공), 0(실패)
	 */
	public int del(QnaDTO dto) {

		try {
			String sql = "";
			
			sql = "select * from tblClientQ where seq = ? ";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getSeq());
			 
			rs = pstat.executeQuery();
			 
			if(rs.next()) {
				String state = rs.getString("state");
				System.out.println(state);
				
				if(state.equals("y")) {
					//댓글이 있다면 댓글 삭제
					sql = "delete from tblcomment2 where pseq = ?";
					pstat = conn.prepareStatement(sql);
					pstat.setString(1, dto.getSeq());
					
					pstat.executeUpdate(); //성공하면 1
					
				}
				
				sql ="delete from tblClientQ where seq =?";
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, dto.getSeq());

				return pstat.executeUpdate();
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
	/**
	 * 총 1:1문의 게시글 수
	 * @author 이연수
	 * @param map column="컬럼명", word="검색내용"
	 * @return rs.getInt("cnt") 총 게시물 수
	 */
	public int getTotalCount(HashMap<String, String> map) {
		
		try {
			
			String where = "";
			
			if (map.get("column") != null && map.get("word") != null) {
				where = String.format("where %s like '%%%s%%'"
										, map.get("column")
										, map.get("word"));
			}
			
			//총 게시물 수 반환
			String sql = "select count(*) as cnt from tblClientQ " + where;
			pstat = conn.prepareStatement(sql);
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return 0;
	}

	/**
	 * 문의내용 확인시 비밀번호 체크
	 * @author 이연수
	 * @param seq 글 번호
	 * @param pw 글 비밀번호
	 * @return Integer.parseInt(rs.getString("cnt")) 1(성공), 0(실패)
	 */
	public int check(String seq, String pw) {
		try {
			 String sql ="select count(*) as cnt from tblClientQ where seq =? and pw = ?";
			 
			 pstat = conn.prepareStatement(sql);
			 pstat.setString(1, seq);
			 pstat.setString(2, pw);
			 
			 rs = pstat.executeQuery();
			 
			 
			 
			 if(rs.next()) {
					return Integer.parseInt(rs.getString("cnt"));
				}
			 
			 
			
	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return 0;
	}


	/**
	 * 문의글 수정
	 * @author 이연수
	 * @param dto [subject, content, name, pw, seq]
	 * @return 1(성공), 0(실패)
	 */
	public int edit(QnaDTO dto) {

		try {
			String sql = "update tblClientQ set subject = ?,content = ?, name = ?, pw = ? where seq = ?";
			
			pstat= conn.prepareStatement(sql);
			pstat.setString(1, dto.getSubject());
			pstat.setString(2, dto.getContent());
			pstat.setString(3, dto.getName());
			pstat.setString(4, dto.getPw());
			pstat.setString(5, dto.getSeq());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
	/**
	 * 문의글 조회수 증가
	 * @author 이연수
	 * @param seq 글 번호
	 */
	public void addCount(String seq) {

		try {
			
			String sql = "update tblClientQ set readcount = readcount + 1 where seq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}

	/**
	 * 답변 리스트
	 * @author 이연수
	 * @param pseq 글 번호
	 * @return clist [seq, content, regdate, pseq, pid, name]
	 */
	public ArrayList<CommentDTO> clist(String pseq) {
		
		try {
			
			String sql = "select c.*, (select name from tblEmp where id = c.pid) as name from tblComment2 c where pseq = ? order by seq desc";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, pseq);
			
			rs = pstat.executeQuery();
			
			ArrayList<CommentDTO> clist = new ArrayList<CommentDTO>();
			
			while (rs.next()) {

				CommentDTO dto = new CommentDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setPseq(rs.getString("pseq"));
				dto.setPid(rs.getString("pid"));
				
				dto.setName(rs.getString("name"));
				
				clist.add(dto);
			}
			
			return clist;
			
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
	}

	/**
	 * 답변 작성
	 * @author 이연수
	 * @param dto [content, id, pseq]
	 * @return 1(성공),0(실패)
	 */
	public int writeComment(CommentDTO dto) {

		try {
			
			String sql = "insert into tblComment2 (seq, content, pid, pseq) values (tblComment_seq.nextval, ?, ?, ?)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getContent());
			pstat.setString(2, dto.getPid());
			pstat.setString(3, dto.getPseq());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return 0;
	}

	/**
	 * 답변작성 여부(작성 O)
	 * @author 이연수
	 * @param pseq 글 번호
	 * @return 1(성공), 0(실패)
	 */
	public int state(String pseq) {

		try {
			
			String sql = "update tblClientQ set state = 'y' where seq = ?";
			
			pstat= conn.prepareStatement(sql);
			pstat.setString(1, pseq);
			
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	/**
	 * 답변 삭제
	 * @author 이연수
	 * @param seq 글 번호
	 * @return 1(성공), 0(실패)
	 */
	public int delComment(String seq) {
		
		try {
			
			//댓글 삭제
			String sql = "delete from tblComment2 where seq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return 0;
	}

	/**
	 * 답변작성 여부(작성 X)
	 * @author 이연수
	 * @param pseq 글 번호
	 * @return 1(성공), 0(실패)
	 */
	public int stateDel(String pseq) {
		try {
			
			String sql = "update tblClientQ set state = 'n' where seq = ?";
			
			pstat= conn.prepareStatement(sql);
			pstat.setString(1, pseq);
			
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
		
	}

	
}
