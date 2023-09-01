package com.cds.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.cds.main.DBUtil;

public class UserDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public UserDAO() {
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
	 * 로그인
	 * @author 이연수
	 * @param dto [id, pw]
	 * @return 1(성공), 0(실패)
	 */
	public UserDTO signin(UserDTO dto) {
		try {
			
			String sql = "select * from tblEmp where id = ? and pw = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPw());
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				//회원O > 로그인 처리 인증 티켓 발급(DAO X)
				UserDTO result = new UserDTO();
				
				result.setId(rs.getString("id"));
				result.setPw(rs.getString("pw"));
				result.setName(rs.getString("name"));
				result.setTel(rs.getString("lv"));
				result.setLv(rs.getString("lv"));
				result.setBigo(rs.getString("bigo"));
				
				return result;
			}
		} catch (Exception e) {
			System.out.println("UserDAO.signin() : " + e.toString());
		}
		return null;
	}

	/**
	 * 아이디 찾기
	 * @author 이연수
	 * @param phone 전화 번호
	 * @param name 이름
	 * @return dto [id, name]
	 */
	public UserDTO findId(String phone, String name) {
		try {
			String sql = "select id,name from tblemp where tel = ? and name = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, phone);
			pstat.setString(2, name);
			
			rs = pstat.executeQuery();
			
			if(rs.next()) {

				UserDTO dto = new UserDTO();
				
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				
				
				return dto;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 비밀번호 찾기
	 * @author 이연수
	 * @param phone 전화 번호
	 * @param name 이름
	 * @param id 아이디
	 * @return dto [pw, name]
	 */
	public UserDTO findPw(String phone, String name, String id) {
		
		try {
			String sql = "select name,pw from tblemp where tel = ? and name = ? and id = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, phone);
			pstat.setString(2, name);
			pstat.setString(3, id);
			
			rs = pstat.executeQuery();
			
			if(rs.next()) {

				UserDTO dto = new UserDTO();
				
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				
				
				return dto;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 회원가입
	 * @author 이연수
	 * @param dto [id, pw, name, tel, lv, bigo]
	 * @return 1(성공), 0(실패)
	 */
	public int register(UserDTO dto) {
		try {
			
			String sql = "insert into tblEmp (id, pw, name, tel, lv, bigo) values (?, ?, ?, ?, ?, ?)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPw());
			pstat.setString(3, dto.getName());
			pstat.setString(4, dto.getTel());
			pstat.setString(5, dto.getLv());
			pstat.setString(6, dto.getBigo());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return 0;
	}

}
