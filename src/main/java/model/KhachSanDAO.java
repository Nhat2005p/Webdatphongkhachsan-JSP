package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class KhachSanDAO {

    public List<KhachSan> getAll() {
        List<KhachSan> list = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM khach_san";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                KhachSan ks = new KhachSan(
                    rs.getInt("id"),
                    rs.getString("ten"),
                    rs.getString("dia_chi"),
                    rs.getString("so_dien_thoai"),
                    rs.getString("mo_ta")
                );
                list.add(ks);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public KhachSan getById(int id) {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM khach_san WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new KhachSan(
                    rs.getInt("id"),
                    rs.getString("ten"),
                    rs.getString("dia_chi"),
                    rs.getString("so_dien_thoai"),
                    rs.getString("mo_ta")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void insert(KhachSan ks) {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO khach_san (ten, dia_chi, so_dien_thoai, mo_ta) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, ks.getTen());
            stmt.setString(2, ks.getDiaChi());
            stmt.setString(3, ks.getSoDienThoai());
            stmt.setString(4, ks.getMoTa());
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void update(KhachSan ks) {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "UPDATE khach_san SET ten=?, dia_chi=?, so_dien_thoai=?, mo_ta=? WHERE id=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, ks.getTen());
            stmt.setString(2, ks.getDiaChi());
            stmt.setString(3, ks.getSoDienThoai());
            stmt.setString(4, ks.getMoTa());
            stmt.setInt(5, ks.getId());
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void delete(int id) {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "DELETE FROM khach_san WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
