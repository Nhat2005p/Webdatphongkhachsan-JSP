<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page session="true" %>
<%@ page import="model.KhachHang" %>
<%
    KhachHang khachHang = (KhachHang) session.getAttribute("khachHang");
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chủ - Hệ thống đặt phòng khách sạn</title>
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
            overflow-x: hidden;
        }

        /* Header */
        .header {
            background: linear-gradient(135deg, #1e3a8a, #3b82f6);
            color: white;
            padding: 4rem 0;
            text-align: center;
            border-radius: 0 0 20px 20px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            position: relative;
            overflow: hidden;
        }
        .header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('https://images.unsplash.com/photo-1542314831-8f7d16dd2b3b') no-repeat center/cover;
            opacity: 0.3;
            z-index: 0;
        }
        .header h1 {
            font-weight: 700;
            font-size: 2.5rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            position: relative;
            z-index: 1;
            animation: fadeInDown 1s ease-out;
        }

        /* Welcome Message */
        .welcome-message {
            max-width: 600px;
            margin: 1rem auto;
            animation: fadeIn 1s ease-out;
        }

        /* Feature Cards */
        .features-container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 1rem;
        }
        .feature-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.05);
            padding: 1.5rem;
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            animation: fadeInUp 1s ease-out;
        }
        .feature-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.1);
        }
        .feature-card i {
            font-size: 2rem;
            color: #3b82f6;
            margin-bottom: 1rem;
        }
        .feature-card h5 {
            font-weight: 600;
            color: #1e3a8a;
        }
        .feature-card p {
            color: #555;
            font-size: 0.9rem;
        }
        .feature-card a {
            color: #3b82f6;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
        }
        .feature-card a:hover {
            color: #1e3a8a;
            text-decoration: underline;
        }

        /* Footer */
        .footer {
            background: #1e3a8a;
            color: white;
            padding: 2rem 0;
            text-align: center;
            margin-top: 2rem;
        }
        .footer a {
            color: #a1bffa;
            margin: 0 0.5rem;
            transition: color 0.3s ease;
        }
        .footer a:hover {
            color: white;
        }

        /* Animations */
        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        /* Responsive */
        @media (max-width: 768px) {
            .header h1 {
                font-size: 1.8rem;
            }
            .feature-card {
                margin-bottom: 1rem;
            }
            .welcome-message {
                margin: 1rem;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <div class="header">
        <h1><i class="fas fa-hotel me-2"></i> Hệ Thống Đặt Phòng Khách Sạn</h1>
    </div>

    <!-- Welcome Message -->
    <div class="container welcome-message">
        <%
            if (khachHang != null) {
        %>
            <div class="alert alert-success d-flex align-items-center" role="alert">
                <i class="fas fa-user-check me-2"></i>
                <div>Xin chào, <b><%= khachHang.getTen() %></b> | 
                    <a href="khachhang?action=logout" class="alert-link">Đăng xuất</a>
                </div>
            </div>
        <%
            } else {
        %>
            <div class="alert alert-info d-flex align-items-center" role="alert">
                <i class="fas fa-info-circle me-2"></i>
                <div>
                    Vui lòng <a href="dangnhap.jsp" class="alert-link">Đăng nhập</a> hoặc 
                    <a href="dangky.jsp" class="alert-link">Đăng ký</a> để sử dụng đầy đủ tính năng.
                </div>
            </div>
        <%
            }
        %>
    </div>

    <!-- Features Section -->
    <div class="container features-container">
        <h3 class="text-center mb-4">Chức Năng Chính</h3>
        <div class="row g-4">
            <div class="col-md-4">
                <div class="feature-card">
                    <i class="fas fa-map-marked-alt"></i>
                    <h5>Danh Sách Khách Sạn</h5>
                    <p>Khám phá danh sách các khách sạn với thông tin chi tiết và vị trí.</p>
                    <a href="khachsan?action=list">Xem ngay <i class="fas fa-arrow-right ms-1"></i></a>
                </div>
            </div>
            <div class="col-md-4">
                <div class="feature-card">
                    <i class="fas fa-box"></i>
                    <h5>Đơn Đặt Phòng</h5>
                    <p>Xem và quản lý các đơn đặt phòng của bạn một cách dễ dàng.</p>
                    <a href="dondatphong?action=list">Xem ngay <i class="fas fa-arrow-right ms-1"></i></a>
                </div>
            </div>
            <div class="col-md-4">
                <div class="feature-card">
                    <i class="fas fa-calendar-alt"></i>
                    <h5>Tình Trạng Phòng</h5>
                    <p>Kiểm tra tình trạng phòng trống theo ngày để lên kế hoạch.</p>
                    <a href="tinhtrangphong?action=list">Xem ngay <i class="fas fa-arrow-right ms-1"></i></a>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <div class="footer">
        <p>© 2025 - Hệ thống đặt phòng khách sạn bằng JSP/Servlet</p>
        <p>
            <a href="#"><i class="fab fa-facebook-f"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
        </p>
    </div>

    <!-- Bootstrap 5 JS and Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>