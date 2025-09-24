package controller;

import model.DonDatPhong;
import model.DonDatPhongDAO;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Timestamp;
import java.sql.Date;
import java.util.List;

public class DonDatPhongController extends HttpServlet {

    private DonDatPhongDAO ddpDAO;

    @Override
    public void init() throws ServletException {
        ddpDAO = new DonDatPhongDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "list":
                hienThiDanhSach(request, response);
                break;
            case "view":
                xemChiTiet(request, response);
                break;
            case "cancel":
                huyDonDatPhong(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    private void hienThiDanhSach(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<DonDatPhong> list = ddpDAO.getAll();
        request.setAttribute("listDonDat", list);
        RequestDispatcher rd = request.getRequestDispatcher("/views/dondatphong/danhsach.jsp");
        rd.forward(request, response);
    }

    private void xemChiTiet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String bookingId = request.getParameter("bookingId");
        try {
            int id = Integer.parseInt(bookingId);
            DonDatPhong booking = ddpDAO.getById(id);
            if (booking == null) {
                request.setAttribute("error", "Không tìm thấy đơn đặt phòng.");
            } else {
                request.setAttribute("booking", booking);
            }
            RequestDispatcher rd = request.getRequestDispatcher("/views/dondatphong/viewBooking.jsp");
            rd.forward(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "ID đơn đặt phòng không hợp lệ.");
            RequestDispatcher rd = request.getRequestDispatcher("/views/dondatphong/viewBooking.jsp");
            rd.forward(request, response);
        }
    }

    private void huyDonDatPhong(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String bookingId = request.getParameter("bookingId");
        try {
            int id = Integer.parseInt(bookingId);
            DonDatPhong booking = ddpDAO.getById(id);
            if (booking == null) {
                request.setAttribute("error", "Không tìm thấy đơn đặt phòng để hủy.");
                RequestDispatcher rd = request.getRequestDispatcher("/views/dondatphong/danhsach.jsp");
                rd.forward(request, response);
            } else {
                ddpDAO.delete(id);
                request.setAttribute("success", "Hủy đơn đặt phòng thành công.");
                List<DonDatPhong> list = ddpDAO.getAll();
                request.setAttribute("listDonDat", list);
                RequestDispatcher rd = request.getRequestDispatcher("/views/dondatphong/danhsach.jsp");
                rd.forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "ID đơn đặt phòng không hợp lệ.");
            RequestDispatcher rd = request.getRequestDispatcher("/views/dondatphong/danhsach.jsp");
            rd.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int phongId = Integer.parseInt(request.getParameter("phong_id"));
            int khachHangId = Integer.parseInt(request.getParameter("khach_hang_id"));
            Date ngayNhan = Date.valueOf(request.getParameter("ngay_nhan"));
            Date ngayTra = Date.valueOf(request.getParameter("ngay_tra"));
            String maDon = request.getParameter("ma_don");

            DonDatPhong don = new DonDatPhong(0, phongId, khachHangId, ngayNhan, ngayTra, new Timestamp(System.currentTimeMillis()), maDon);
            ddpDAO.insert(don);
            request.setAttribute("success", "Đặt phòng thành công.");
            List<DonDatPhong> list = ddpDAO.getAll();
            request.setAttribute("listDonDat", list);
            RequestDispatcher rd = request.getRequestDispatcher("/views/dondatphong/danhsach.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi khi đặt phòng: " + e.getMessage());
            RequestDispatcher rd = request.getRequestDispatcher("/views/dondatphong/danhsach.jsp");
            rd.forward(request, response);
        }
    }
}