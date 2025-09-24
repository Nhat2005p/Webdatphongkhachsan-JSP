package controller;

import model.KhachHang;
import model.KhachHangDAO;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class KhachHangController extends HttpServlet {

    private KhachHangDAO khDAO;

    @Override
    public void init() throws ServletException {
        khDAO = new KhachHangDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        // 👉 ĐĂNG KÝ TÀI KHOẢN
        if ("register".equals(action)) {
            String ten = request.getParameter("ten");
            String sdt = request.getParameter("sdt");
            String email = request.getParameter("email");
            String matKhau = request.getParameter("matkhau");

            KhachHang kh = new KhachHang();
            kh.setTen(ten);
            kh.setSdt(sdt);
            kh.setEmail(email);
            kh.setMatKhau(matKhau);

            try {
                khDAO.insert(kh);
                response.sendRedirect("dangnhap.jsp");
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("dangky.jsp?error=1");
            }

        // 👉 ĐĂNG NHẬP
        } else {
            String taiKhoan = request.getParameter("taikhoan");
            String matKhau = request.getParameter("matkhau");

            KhachHang kh = khDAO.login(taiKhoan, matKhau);
            if (kh != null) {
                HttpSession session = request.getSession();
                session.setAttribute("khachHang", kh);
                response.sendRedirect("index.jsp");
            } else {
                response.sendRedirect("dangnhap.jsp?error=1");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        // 👉 ĐĂNG XUẤT
        if ("logout".equals(action)) {
            HttpSession session = request.getSession(false);
            if (session != null) session.invalidate();
            response.sendRedirect("index.jsp");
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }
}
