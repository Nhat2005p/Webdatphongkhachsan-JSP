package model;

import java.sql.Date;

public class TinhTrangPhong {
    private int id;
    private int phongId;
    private Date ngay;
    private int soLuongCon;
    private String tenPhong;

    public TinhTrangPhong() {}

    public TinhTrangPhong(int id, int phongId, Date ngay, int soLuongCon) {
        this.id = id;
        this.phongId = phongId;
        this.ngay = ngay;
        this.soLuongCon = soLuongCon;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPhongId() {
        return phongId;
    }

    public void setPhongId(int phongId) {
        this.phongId = phongId;
    }

    public Date getNgay() {
        return ngay;
    }

    public void setNgay(Date ngay) {
        this.ngay = ngay;
    }

    public int getSoLuongCon() {
        return soLuongCon;
    }

    public void setSoLuongCon(int soLuongCon) {
        this.soLuongCon = soLuongCon;
    }

    public String getTenPhong() {
        return tenPhong;
    }

    public void setTenPhong(String tenPhong) {
        this.tenPhong = tenPhong;
    }
}
