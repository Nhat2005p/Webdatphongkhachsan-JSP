package model;

public class KhachHang {
    private int id;
    private String ten;
    private String sdt;
    private String email;
    private String matKhau;

    public KhachHang() {}

    public KhachHang(int id, String ten, String sdt, String email, String matKhau) {
        this.id = id;
        this.ten = ten;
        this.sdt = sdt;
        this.email = email;
        this.matKhau = matKhau;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getTen() { return ten; }
    public void setTen(String ten) { this.ten = ten; }

    public String getSdt() { return sdt; }
    public void setSdt(String sdt) { this.sdt = sdt; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getMatKhau() { return matKhau; }
    public void setMatKhau(String matKhau) { this.matKhau = matKhau; }
}
