<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="model.KhachHang" %>
<%
    KhachHang khachHang = (KhachHang) session.getAttribute("khachHang");
    String phongId = request.getParameter("phongId"); // truyền từ link trước đó
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đặt phòng</title>
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

        /* Form Container */
        .form-container {
            background: white;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.05);
            padding: 2rem;
            margin: 2rem auto;
            max-width: 500px;
        }
        .form-container .form-label {
            font-weight: 500;
            color: #1e3a8a;
        }
        .form-container .form-control {
            border-radius: 10px;
            border: 1px solid #d1d5db;
            padding-left: 2.5rem;
            transition: all 0.3s ease;
        }
        .form-container .form-control:focus {
            border-color: #3b82f6;
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
        }
        .form-container .input-group {
            position: relative;
        }
        .form-container .input-group i {
            position: absolute;
            top: 50%;
            left: 0.75rem;
            transform: translateY(-50%);
            color: #6b7280;
            z-index: 10;
        }
        .form-container .btn {
            border-radius: 25px;
            padding: 0.5rem 1.5rem;
            transition: all 0.3s ease;
        }
        .form-container .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .form-container .error-message {
            color: #dc3545;
            font-size: 0.9rem;
            margin-top: 0.25rem;
        }

        /* Links */
        .action-links a {
            margin-right: 1rem;
            transition: all 0.3s ease;
        }
        .action-links a:hover {
            color: #3b82f6;
            text-decoration: underline;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .header h2 {
                font-size: 1.5rem;
            }
            .form-container {
                padding: 1.5rem;
                margin: 1rem;
            }
            .form-container .btn {
                width: 100%;
            }
            .action-links a {
                display: block;
                margin: 0.5rem 0;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <div class="header">
        <img src="https://images.unsplash.com/photo-1542314831-8f7d16dd2b3b" alt="Hotel Banner" class="img-fluid">
        <h2><i class="fas fa-bell me-2"></i> Đặt Phòng</h2>
    </div>

    <!-- Form Container -->
    <div class="container form-container">
        <% if (khachHang == null) { %>
            <div class="alert alert-danger d-flex align-items-center" role="alert">
                <i class="fas fa-exclamation-circle me-2"></i>
                <div>Bạn cần <a href="dangnhap.jsp" class="alert-link">đăng nhập</a> để đặt phòng.</div>
            </div>
        <% } else if (phongId == null) { %>
            <div class="alert alert-danger d-flex align-items-center" role="alert">
                <i class="fas fa-exclamation-circle me-2"></i>
                <div>Thiếu thông tin phòng.</div>
            </div>
        <% } else { %>
            <form id="bookingForm" action="dondatphong" method="post">
                <input type="hidden" name="phong_id" value="<%= phongId %>">
                <input type="hidden" name="khach_hang_id" value="<%= khachHang.getId() %>">

                <div class="mb-3">
                    <label for="ngay_nhan" class="form-label">Ngày nhận phòng</label>
                    <div class="input-group">
                        <i class="fas fa-calendar-alt"></i>
                        <input type="date" class="form-control" id="ngay_nhan" name="ngay_nhan" required>
                    </div>
                    <div class="error-message" id="ngayNhanError"></div>
                </div>

                <div class="mb-3">
                    <label for="ngay_tra" class="form-label">Ngày trả phòng</label>
                    <div class="input-group">
                        <i class="fas fa-calendar-alt"></i>
                        <input type="date" class="form-control" id="ngay_tra" name="ngay_tra" required>
                    </div>
                    <div class="error-message" id="ngayTraError"></div>
                </div>

                <div class="mb-3">
                    <label for="ma_don" class="form-label">Mã đơn (hệ thống tự sinh nếu để trống)</label>
                    <div class="input-group">
                        <i class="fas fa-barcode"></i>
                        <input type="text" class="form-control" id="ma_don" name="ma_don" value="<%= "MD" + System.currentTimeMillis() %>">
                    </div>
                    <div class="error-message" id="maDonError"></div>
                </div>

                <button type="submit" class="btn btn-success"><i class="fas fa-check me-2"></i> Xác nhận đặt phòng</button>
            </form>
        <% } %>

        <div class="action-links mt-3">
            <p><a href="index.jsp"><i class="fas fa-arrow-left me-1"></i> Quay lại trang chủ</a></p>
        </div>
    </div>

    <!-- Bootstrap 5 JS and Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script>
        // Client-side form validation
        document.getElementById('bookingForm')?.addEventListener('submit', function(e) {
            let isValid = true;
            const ngayNhan = document.getElementById('ngay_nhan')?.value;
            const ngayTra = document.getElementById('ngay_tra')?.value;
            const maDon = document.getElementById('ma_don')?.value.trim();

            // Reset error messages
            document.querySelectorAll('.error-message').forEach(el => el.textContent = '');

            // Validate ngày nhận phòng
            const today = new Date().toISOString().split('T')[0];
            if (!ngayNhan || ngayNhan < today) {
                document.getElementById('ngayNhanError').textContent = 'Ngày nhận phòng phải từ hôm nay trở đi.';
                isValid = false;
            }

            // Validate ngày trả phòng
            if (!ngayTra || ngayTra <= ngayNhan) {
                document.getElementById('ngayTraError').textContent = 'Ngày trả phòng phải sau ngày nhận phòng.';
                isValid = false;
            }

            // Validate mã đơn (nếu nhập tay)
            if (maDon && !/^[A-Za-z0-9]+$/.test(maDon)) {
                document.getElementById('maDonError').textContent = 'Mã đơn chỉ được chứa chữ cái và số.';
                isValid = false;
            }

            if (!isValid) {
                e.preventDefault();
            }
        });
    </script>
</body>
</html>