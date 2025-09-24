<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng ký tài khoản</title>
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
        <h2><i class="fas fa-user-plus me-2"></i> Đăng Ký Tài Khoản</h2>
    </div>

    <!-- Form Container -->
    <div class="container form-container">
        <% if (request.getParameter("error") != null) { %>
            <div class="alert alert-danger d-flex align-items-center" role="alert">
                <i class="fas fa-exclamation-circle me-2"></i>
                <div>Email hoặc số điện thoại đã tồn tại!</div>
            </div>
        <% } %>

        <form id="registerForm" action="khachhang?action=register" method="post">
            <div class="mb-3">
                <label for="ten" class="form-label">Họ và tên</label>
                <div class="input-group">
                    <i class="fas fa-user"></i>
                    <input type="text" class="form-control" id="ten" name="ten" required>
                </div>
                <div class="error-message" id="tenError"></div>
            </div>

            <div class="mb-3">
                <label for="sdt" class="form-label">Số điện thoại</label>
                <div class="input-group">
                    <i class="fas fa-phone"></i>
                    <input type="text" class="form-control" id="sdt" name="sdt" required>
                </div>
                <div class="error-message" id="sdtError"></div>
            </div>

            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <div class="input-group">
                    <i class="fas fa-envelope"></i>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                <div class="error-message" id="emailError"></div>
            </div>

            <div class="mb-3">
                <label for="matkhau" class="form-label">Mật khẩu</label>
                <div class="input-group">
                    <i class="fas fa-lock"></i>
                    <input type="password" class="form-control" id="matkhau" name="matkhau" required>
                </div>
                <div class="error-message" id="matkhauError"></div>
            </div>

            <button type="submit" class="btn btn-primary"><i class="fas fa-user-plus me-2"></i> Đăng ký</button>
        </form>

        <div class="action-links mt-3">
            <p>Đã có tài khoản? <a href="dangnhap.jsp">Đăng nhập</a></p>
            <p><a href="index.jsp"><i class="fas fa-arrow-left me-1"></i> Quay lại trang chủ</a></p>
        </div>
    </div>

    <!-- Bootstrap 5 JS and Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script>
        // Client-side form validation
        document.getElementById('registerForm').addEventListener('submit', function(e) {
            let isValid = true;
            const ten = document.getElementById('ten').value.trim();
            const sdt = document.getElementById('sdt').value.trim();
            const email = document.getElementById('email').value.trim();
            const matkhau = document.getElementById('matkhau').value;

            // Reset error messages
            document.querySelectorAll('.error-message').forEach(el => el.textContent = '');

            // Validate tên
            if (ten === '') {
                document.getElementById('tenError').textContent = 'Vui lòng nhập họ và tên.';
                isValid = false;
            }

            // Validate số điện thoại
            const sdtPattern = /^[0-9]{10,11}$/;
            if (!sdtPattern.test(sdt)) {
                document.getElementById('sdtError').textContent = 'Số điện thoại phải có 10-11 chữ số.';
                isValid = false;
            }

            // Validate email
            const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailPattern.test(email)) {
                document.getElementById('emailError').textContent = 'Vui lòng nhập email hợp lệ.';
                isValid = false;
            }

            // Validate mật khẩu
            if (matkhau.length < 6) {
                document.getElementById('matkhauError').textContent = 'Mật khẩu phải có ít nhất 6 ký tự.';
                isValid = false;
            }

            if (!isValid) {
                e.preventDefault();
            }
        });
    </script>
</body>
</html>