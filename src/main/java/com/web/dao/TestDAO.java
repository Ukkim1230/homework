package com.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.web.common.DBCon;
import com.web.dto.TestDTO;

public class TestDAO {
	public List<TestDTO> selectTests(TestDTO test) {
		List<TestDTO> tests = new ArrayList<>();
		String sql = "select TI_NUM, TI_NAME from TEST_INFO";
		try (Connection con = DBCon.getCon(); PreparedStatement ps = con.prepareStatement(sql)) {
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				TestDTO t = new TestDTO();
				t.setTiNum(rs.getInt("TI_NUM"));
				t.setTiName(rs.getString("TI_NAME"));
				tests.add(t);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return tests;
	}

	public TestDTO selectTest(int tiNum) {
		String sql = "select TI_NUM, TI_NAME FROM TEST_INFO";
		sql += " WHERE TI_NUM=?";
		try (Connection con = DBCon.getCon();
				PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setInt(1, tiNum);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				TestDTO t = new TestDTO();
				t.setTiNum(rs.getInt("TI_NUM"));
				t.setTiName(rs.getString("TI_NAME"));
				return t;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public int insertTest(TestDTO test) {
		String sql = "insert into TEST_INFO(TI_NAME)";
		sql += " values(?)";

		try (Connection con = DBCon.getCon(); PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setString(1, test.getTiName());
			return ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int updateTest(TestDTO test) {
		String sql = "update TEST_INFO set TI_NAME =?";
		sql += " WHERE TI_NUM=?";
		try (Connection con = DBCon.getCon();
				PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setString(1, test.getTiName());
			ps.setInt(2, test.getTiNum());
			return ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	public int deleteTest(int tiNum) {
		String sql = "DELETE FROM TEST_INFO WHERE TI_NUM=?";
		try(Connection con = DBCon.getCon();
				PreparedStatement ps = con.prepareStatement(sql)){
			ps.setInt(1, tiNum);
			return ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}return 0;
	}
	public static void main(String[] args) {
		
	}
}