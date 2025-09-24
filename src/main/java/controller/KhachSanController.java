package controller;

import model.KhachSan;
import model.KhachSanDAO;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class KhachSanController extends HttpServlet {

    private KhachSanDAO ksDAO;

    @Override
    public void init() throws ServletException {
        ksDAO = new KhachSanDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null || action.equals("")) {
            action = "list";
        }

        switch (action) {
            case "list":
                hienThiDanhSach(request, response);
                break;
            case "detail":
                hienThiChiTiet(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Hành động không hợp lệ");
        }
    }

    private void hienThiDanhSach(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<KhachSan> danhSach = ksDAO.getAll();
        request.setAttribute("listKhachSan", danhSach);
        RequestDispatcher rd = request.getRequestDispatcher("/views/khachsan/danhsach.jsp");
        rd.forward(request, response);
    }

    private void hienThiChiTiet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            KhachSan ks = ksDAO.getById(id);
            if (ks == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Không tìm thấy khách sạn");
                return;
            }
            request.setAttribute("khachSan", ks);
            RequestDispatcher rd = request.getRequestDispatcher("/views/khachsan/chitiet.jsp");
            rd.forward(request, response);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID không hợp lệ");
        }
    }
}
