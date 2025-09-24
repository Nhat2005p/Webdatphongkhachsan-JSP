package model;

public class Phong {
    private int id;
    private int khachSanId;
    private String tenPhong;
    private String loai;
    private int gia;
    private int sucChua;
    private int soLuong;
    private String moTa;
    private String hinhAnh;

    public Phong() {}

    public Phong(int id, int khachSanId, String tenPhong, String loai, int gia,
                 int sucChua, int soLuong, String moTa, String hinhAnh) {
        this.id = id;
        this.khachSanId = khachSanId;
        this.tenPhong = tenPhong;
        this.loai = loai;
        this.gia = gia;
        this.sucChua = sucChua;
        this.soLuong = soLuong;
        this.moTa = moTa;
        this.hinhAnh = hinhAnh;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getKhachSanId() { return khachSanId; }
    public void setKhachSanId(int khachSanId) { this.khachSanId = khachSanId; }

    public String getTenPhong() { return tenPhong; }
    public void setTenPhong(String tenPhong) { this.tenPhong = tenPhong; }

    public String getLoai() { return loai; }
    public void setLoai(String loai) { this.loai = loai; }

    public int getGia() { return gia; }
    public void setGia(int gia) { this.gia = gia; }

    public int getSucChua() { return sucChua; }
    public void setSucChua(int sucChua) { this.sucChua = sucChua; }

    public int getSoLuong() { return soLuong; }
    public void setSoLuong(int soLuong) { this.soLuong = soLuong; }

    public String getMoTa() { return moTa; }
    public void setMoTa(String moTa) { this.moTa = moTa; }

    public String getHinhAnh() { return hinhAnh; }
    public void setHinhAnh(String hinhAnh) { this.hinhAnh = hinhAnh; }
}
