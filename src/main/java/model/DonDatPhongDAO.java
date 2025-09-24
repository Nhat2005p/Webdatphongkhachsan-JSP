package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DonDatPhongDAO {
    public List<DonDatPhong> getAll() {
        List<DonDatPhong> list = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT ddp.*, p.ten_phong, kh.ten AS ten_khach_hang " +
                         "FROM don_dat_phong ddp " +
                         "JOIN phong p ON ddp.phong_id = p.id " +
                         "JOIN khach_hang kh ON ddp.khach_hang_id = kh.id";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                DonDatPhong d = new DonDatPhong(
                    rs.getInt("id"),
                    rs.getInt("phong_id"),
                    rs.getInt("khach_hang_id"),
                    rs.getDate("ngay_nhan"),
                    rs.getDate("ngay_tra"),
                    rs.getTimestamp("thoi_gian_dat"),
                    rs.getString("ma_don")
                );
                d.setTenPhong(rs.getString("ten_phong"));
                d.setTenKhachHang(rs.getString("ten_khach_hang"));
                list.add(d);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public DonDatPhong getById(int id) {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM don_dat_phong WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new DonDatPhong(
                    rs.getInt("id"),
                    rs.getInt("phong_id"),
                    rs.getInt("khach_hang_id"),
                    rs.getDate("ngay_nhan"),
                    rs.getDate("ngay_tra"),
                    rs.getTimestamp("thoi_gian_dat"),
                    rs.getString("ma_don")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void insert(DonDatPhong d) {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO don_dat_phong (phong_id, khach_hang_id, ngay_nhan, ngay_tra, thoi_gian_dat, ma_don) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, d.getPhongId());
            stmt.setInt(2, d.getKhachHangId());
            stmt.setDate(3, d.getNgayNhan());
            stmt.setDate(4, d.getNgayTra());
            stmt.setTimestamp(5, d.getThoiGianDat());
            stmt.setString(6, d.getMaDon());
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // ✅ Có thể cập nhật để JOIN nếu muốn hiển thị tên trong lịch sử
    public List<DonDatPhong> getByKhachHangId(int khachHangId) {
        List<DonDatPhong> list = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT ddp.*, p.ten_phong " +
                         "FROM don_dat_phong ddp " +
                         "JOIN phong p ON ddp.phong_id = p.id " +
                         "WHERE ddp.khach_hang_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, khachHangId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                DonDatPhong d = new DonDatPhong(
                    rs.getInt("id"),
                    rs.getInt("phong_id"),
                    khachHangId,
                    rs.getDate("ngay_nhan"),
                    rs.getDate("ngay_tra"),
                    rs.getTimestamp("thoi_gian_dat"),
                    rs.getString("ma_don")
                );
                d.setTenPhong(rs.getString("ten_phong"));
                list.add(d);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void delete(int id) {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "DELETE FROM don_dat_phong WHERE id=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
