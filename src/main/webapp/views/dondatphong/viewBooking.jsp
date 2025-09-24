
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="model.DonDatPhong" %>
<%@ page import="model.KhachHang" %>
<%
    DonDatPhong booking = (DonDatPhong) request.getAttribute("booking");
    KhachHang khachHang = (KhachHang) session.getAttribute("khachHang");
    String error = (String) request.getAttribute("error");
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết đơn đặt phòng</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Font Awesome 6 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous">
    <!-- Google Fonts: Inter -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            background-color: #f4f7fc;
            font-family: 'Inter', sans-serif;
            color: #333;
        }

        /* Header */
        .header {
            background: linear-gradient(135deg, #1e3a8a, #3b82f6);
            color: white;
            padding: 3rem 0;
            text-align: center;
            border-radius: 0 0 20px 20px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            position: relative;
            overflow: hidden;
        }
        .header img {
            max-width: 100%;
            height: auto;
            border-radius: 15px;
            margin-bottom: 1.5rem;
            opacity: 0.9;
            transition: transform 0.3s ease;
        }
        .header img:hover {
            transform: scale(1.02);
        }
        .header h2 {
            font-weight: 700;
            font-size: 2rem;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        /* Detail Container */
        .detail-container {
            background: white;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.05);
            padding: 2rem;
            margin: 2rem auto;
            max-width: 800px;
        }
        .detail-container .detail-item {
            margin-bottom: 1rem;
        }
        .detail-container .detail-item strong {
            color: #1e3a8a;
            font-weight: 600;
        }
        .detail-container .btn {
            border-radius: 25px;
            padding: 0.5rem 1.5rem;
            transition: all 0.3s ease;
        }
        .detail-container .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Responsive */
        @media (max-width: 768px) {
            .header h2 {
                font-size: 1.5rem;
            }
            .detail-container {
                padding: 1.5rem;
                margin: 1rem;
            }
            .detail-container .btn {
                width: 100%;
                margin-bottom: 0.5rem;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <div class="header">
        <img src="https://images.unsplash.com/photo-1542314831-8f7d16dd2b3b" alt="Hotel Banner" class="img-fluid">
        <h2><i class="fas fa-box me-2"></i> Chi Tiết Đơn Đặt Phòng</h2>
    </div>

    <!-- Detail Container -->
    <div class="container detail-container">
        <%
            if (error != null) {
        %>
            <div class="alert alert-danger d-flex align-items-center" role="alert">
                <i class="fas fa-exclamation-circle me-2"></i>
                <div><%= error %></div>
            </div>
        <%
            } else if (booking == null) {
        %>
            <div class="alert alert-danger d-flex align-items-center" role="alert">
                <i class="fas fa-exclamation-circle me-2"></i>
                <div>Không tìm thấy thông tin đơn đặt phòng.</div>
            </div>
        <%
            } else {
        %>
            <div class="detail-item">
                <strong>Mã đơn:</strong> <%= booking.getMaDon() != null ? booking.getMaDon() : "N/A" %>
            </div>
            <div class="detail-item">
                <strong>Khách hàng:</strong> <%= booking.getTenKhachHang() != null ? booking.getTenKhachHang() : "N/A" %>
            </div>
            <div class="detail-item">
                <strong>Phòng:</strong> <%= booking.getTenPhong() != null ? booking.getTenPhong() : "N/A" %>
            </div>
            <div class="detail-item">
                <strong>Ngày nhận phòng:</strong> <%= booking.getNgayNhan() != null ? booking.getNgayNhan() : "N/A" %>
            </div>
            <div class="detail-item">
                <strong>Ngày trả phòng:</strong> <%= booking.getNgayTra() != null ? booking.getNgayTra() : "N/A" %>
            </div>
            <div class="detail-item">
                <strong>Thời gian đặt:</strong> <%= booking.getThoiGianDat() != null ? booking.getThoiGianDat() : "N/A" %>
            </div>
            <div class="mt-3">
                <a href="dondatphong?action=list" class="btn btn-outline-secondary"><i class="fas fa-arrow-left me-2"></i> Quay lại danh sách đơn</a>
                <a href="dondatphong?action=cancel&bookingId=<%= booking.getId() %>" class="btn btn-danger" onclick="return confirm('Bạn có chắc muốn hủy đơn này?')"><i class="fas fa-trash me-2"></i> Hủy đơn</a>
            </div>
        <%
            }
        %>
    </div>

    <!-- Bootstrap 5 JS and Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>