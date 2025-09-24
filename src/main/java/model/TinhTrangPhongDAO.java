package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TinhTrangPhongDAO {

    // ✅ Cập nhật: JOIN để lấy tên phòng
    public List<TinhTrangPhong> getAll() {
        List<TinhTrangPhong> list = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT ttp.*, p.ten_phong " +
                         "FROM tinh_trang_phong ttp " +
                         "JOIN phong p ON ttp.phong_id = p.id";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                TinhTrangPhong ttp = new TinhTrangPhong(
                    rs.getInt("id"),
                    rs.getInt("phong_id"),
                    rs.getDate("ngay"),
                    rs.getInt("so_luong_con")
                );
                ttp.setTenPhong(rs.getString("ten_phong")); // ✅ Gán tên phòng
                list.add(ttp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public TinhTrangPhong getByPhongIdAndNgay(int phongId, Date ngay) {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM tinh_trang_phong WHERE phong_id = ? AND ngay = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, phongId);
            stmt.setDate(2, ngay);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new TinhTrangPhong(
                    rs.getInt("id"),
                    rs.getInt("phong_id"),
                    rs.getDate("ngay"),
                    rs.getInt("so_luong_con")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void insertOrUpdate(TinhTrangPhong ttp) {
        try (Connection conn = DBConnection.getConnection()) {
            String checkSql = "SELECT id FROM tinh_trang_phong WHERE phong_id = ? AND ngay = ?";
            PreparedStatement checkStmt = conn.prepareStatement(checkSql);
            checkStmt.setInt(1, ttp.getPhongId());
            checkStmt.setDate(2, ttp.getNgay());
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                // Update
                String updateSql = "UPDATE tinh_trang_phong SET so_luong_con = ? WHERE phong_id = ? AND ngay = ?";
                PreparedStatement updateStmt = conn.prepareStatement(updateSql);
                updateStmt.setInt(1, ttp.getSoLuongCon());
                updateStmt.setInt(2, ttp.getPhongId());
                updateStmt.setDate(3, ttp.getNgay());
                updateStmt.executeUpdate();
            } else {
                // Insert
                String insertSql = "INSERT INTO tinh_trang_phong (phong_id, ngay, so_luong_con) VALUES (?, ?, ?)";
                PreparedStatement insertStmt = conn.prepareStatement(insertSql);
                insertStmt.setInt(1, ttp.getPhongId());
                insertStmt.setDate(2, ttp.getNgay());
                insertStmt.setInt(3, ttp.getSoLuongCon());
                insertStmt.executeUpdate();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void delete(int id) {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "DELETE FROM tinh_trang_phong WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
