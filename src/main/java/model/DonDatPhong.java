package model;

import java.sql.Date;
import java.sql.Timestamp;

public class DonDatPhong {
    private int id;
    private int phongId;
    private int khachHangId;
    private Date ngayNhan;
    private Date ngayTra;
    private Timestamp thoiGianDat;
    private String maDon;
    private String tenPhong;
    private String tenKhachHang;

    public DonDatPhong() {}

    public DonDatPhong(int id, int phongId, int khachHangId,
                       Date ngayNhan, Date ngayTra,
                       Timestamp thoiGianDat, String maDon) {
        this.id = id;
        this.phongId = phongId;
        this.khachHangId = khachHangId;
        this.ngayNhan = ngayNhan;
        this.ngayTra = ngayTra;
        this.thoiGianDat = thoiGianDat;
        this.maDon = maDon;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getPhongId() { return phongId; }
    public void setPhongId(int phongId) { this.phongId = phongId; }

    public int getKhachHangId() { return khachHangId; }
    public void setKhachHangId(int khachHangId) { this.khachHangId = khachHangId; }

    public Date getNgayNhan() { return ngayNhan; }
    public void setNgayNhan(Date ngayNhan) { this.ngayNhan = ngayNhan; }

    public Date getNgayTra() { return ngayTra; }
    public void setNgayTra(Date ngayTra) { this.ngayTra = ngayTra; }

    public Timestamp getThoiGianDat() { return thoiGianDat; }
    public void setThoiGianDat(Timestamp thoiGianDat) { this.thoiGianDat = thoiGianDat; }

    public String getMaDon() { return maDon; }
    public void setMaDon(String maDon) { this.maDon = maDon; }

    public String getTenPhong() {
        return tenPhong;
    }

    public void setTenPhong(String tenPhong) {
        this.tenPhong = tenPhong;
    }

    public String getTenKhachHang() {
        return tenKhachHang;
    }

    public void setTenKhachHang(String tenKhachHang) {
        this.tenKhachHang = tenKhachHang;
    }
}
