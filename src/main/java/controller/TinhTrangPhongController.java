package controller;

import model.TinhTrangPhong;
import model.TinhTrangPhongDAO;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

public class TinhTrangPhongController extends HttpServlet {

    private TinhTrangPhongDAO ttpDAO;

    @Override
    public void init() throws ServletException {
        ttpDAO = new TinhTrangPhongDAO();
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
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    private void hienThiDanhSach(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<TinhTrangPhong> list = ttpDAO.getAll();
        request.setAttribute("listTinhTrang", list);
        RequestDispatcher rd = request.getRequestDispatcher("/views/tinhtrangphong/danhsach.jsp");
        rd.forward(request, response);
    }
}
