<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.KhachSan" %>
<%
    KhachSan ks = (KhachSan) request.getAttribute("khachSan");
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết khách sạn - <%= ks.getTen() %></title>
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

        /* Card Container */
        .card-container {
            background: white;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.05);
            padding: 2rem;
            margin: 2rem auto;
            max-width: 800px;
        }
        .card-container .card-title {
            font-size: 1.5rem;
            font-weight: 600;
            color: #1e3a8a;
            margin-bottom: 1.5rem;
        }
        .card-container .info-item {
            display: flex;
            align-items: center;
            margin-bottom: 1rem;
        }
        .card-container .info-item i {
            color: #3b82f6;
            margin-right: 1rem;
            font-size: 1.2rem;
        }
        .card-container .info-item strong {
            min-width: 120px;
            color: #333;
        }
        .card-container .info-item span {
            color: #555;
        }

        /* Buttons */
        .action-buttons a {
            margin-right: 1rem;
            padding: 0.5rem 1.5rem;
            border-radius: 25px;
            transition: all 0.3s ease;
        }
        .action-buttons a:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Responsive */
        @media (max-width: 768px) {
            .header h2 {
                font-size: 1.5rem;
            }
            .card-container {
                padding: 1.5rem;
            }
            .card-container .card-title {
                font-size: 1.25rem;
            }
            .action-buttons a {
                display: block;
                margin: 0.5rem 0;
                text-align: center;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <div class="header">
        <img src="https://images.unsplash.com/photo-1542314831-8f7d16dd2b3b" alt="Hotel Banner" class="img-fluid">
        <h2><i class="fas fa-hotel me-2"></i> Chi Tiết Khách Sạn</h2>
    </div>

    <!-- Card Container -->
    <div class="container card-container">
        <h3 class="card-title"><i class="fas fa-building me-2"></i> <%= ks.getTen() %></h3>
        <div class="info-item">
            <i class="fas fa-id-badge"></i>
            <strong>ID:</strong>
            <span><%= ks.getId() %></span>
        </div>
        <div class="info-item">
            <i class="fas fa-map-marker-alt"></i>
            <strong>Địa chỉ:</strong>
            <span><%= ks.getDiaChi() %></span>
        </div>
        <div class="info-item">
            <i class="fas fa-phone"></i>
            <strong>Số điện thoại:</strong>
            <span><%= ks.getSoDienThoai() %></span>
        </div>
        <div class="info-item">
            <i class="fas fa-info-circle"></i>
            <strong>Mô tả:</strong>
            <span><%= ks.getMoTa() %></span>
        </div>

        <!-- Action Buttons -->
        <div class="action-buttons mt-4">
            <a href="phong?action=list&khachSanId=<%= ks.getId() %>" class="btn btn-primary"><i class="fas fa-door-open me-2"></i> Xem phòng</a>
            <a href="khachsan?action=list" class="btn btn-outline-secondary"><i class="fas fa-arrow-left me-2"></i> Quay lại danh sách khách sạn</a>
        </div>
    </div>

    <!-- Bootstrap 5 JS and Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>