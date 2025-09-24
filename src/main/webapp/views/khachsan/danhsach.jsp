<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.KhachSan" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách khách sạn</title>
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

        /* Table Container */
        .table-container {
            background: white;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.05);
            padding: 2rem;
            margin: 2rem auto;
            max-width: 1200px;
        }

        /* Search Bar */
        .search-bar {
            position: relative;
            max-width: 500px;
        }
        .search-bar input {
            padding-left: 2.5rem;
            border-radius: 25px;
            border: 1px solid #d1d5db;
            transition: all 0.3s ease;
        }
        .search-bar input:focus {
            border-color: #3b82f6;
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
        }
        .search-bar i {
            position: absolute;
            top: 50%;
            left: 0.75rem;
            transform: translateY(-50%);
            color: #6b7280;
        }

        /* Table */
        .table {
            border-collapse: separate;
            border-spacing: 0 0.5rem;
        }
        .table th {
            background: #3b82f6;
            color: white;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            padding: 1rem;
        }
        .table td {
            background: #fff;
            padding: 1rem;
            transition: background 0.2s ease;
        }
        .table tbody tr:hover td {
            background: #f1f5f9;
        }
        .action-buttons a {
            margin-right: 0.5rem;
            padding: 0.5rem 1rem;
            border-radius: 25px;
            transition: all 0.3s ease;
        }
        .action-buttons a:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Pagination */
        .pagination .page-link {
            border-radius: 50%;
            margin: 0 0.25rem;
            color: #3b82f6;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        .pagination .page-item.active .page-link {
            background: #3b82f6;
            border-color: #3b82f6;
            color: white;
        }
        .pagination .page-link:hover {
            background: #3b82f6;
            color: white;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .header h2 {
                font-size: 1.5rem;
            }
            .table-container {
                padding: 1rem;
            }
            .search-bar {
                max-width: 100%;
            }
            .table {
                font-size: 0.9rem;
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
        <h2><i class="fas fa-hotel me-2"></i> Danh Sách Khách Sạn</h2>
    </div>

    <!-- Table Container -->
    <div class="container table-container">
        <!-- Search Bar -->
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h4 class="fw-bold">Danh Sách Khách Sạn</h4>
            <div class="search-bar">
                <i class="fas fa-search"></i>
                <input type="text" id="searchInput" class="form-control" placeholder="Tìm kiếm theo tên hoặc địa chỉ">
            </div>
        </div>

        <%
            List<KhachSan> list = (List<KhachSan>) request.getAttribute("listKhachSan");
            if (list == null || list.isEmpty()) {
        %>
            <div class="alert alert-info d-flex align-items-center" role="alert">
                <i class="fas fa-info-circle me-2"></i>
                <div>Không có khách sạn nào trong hệ thống.</div>
            </div>
        <%
            } else {
        %>
            <!-- Table -->
            <div class="table-responsive">
                <table class="table table-hover table-bordered" id="hotelTable">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Tên Khách Sạn</th>
                            <th>Địa Chỉ</th>
                            <th>SĐT</th>
                            <th>Chi Tiết</th>
                            <th>Phòng</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int i = 1;
                            for (KhachSan ks : list) {
                        %>
                            <tr>
                                <td><%= i++ %></td>
                                <td><%= ks.getTen() %></td>
                                <td><%= ks.getDiaChi() %></td>
                                <td><%= ks.getSoDienThoai() %></td>
                                <td class="action-buttons">
                                    <a href="khachsan?action=detail&id=<%= ks.getId() %>" class="btn btn-sm btn-primary"><i class="fas fa-eye me-1"></i> Xem chi tiết</a>
                                </td>
                                <td class="action-buttons">
                                    <a href="phong?action=list&khachSanId=<%= ks.getId() %>" class="btn btn-sm btn-info"><i class="fas fa-door-open me-1"></i> Xem phòng</a>
                                </td>
                            </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>

            <!-- Pagination (Placeholder) -->
            <nav aria-label="Page navigation">
                <ul class="pagination justify-content-center">
                    <li class="page-item"><a class="page-link" href="#">Trước</a></li>
                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">Sau</a></li>
                </ul>
            </nav>
        <%
            }
        %>

        <!-- Back to Home -->
        <p class="mt-4"><a href="index.jsp" class="btn btn-outline-secondary"><i class="fas fa-arrow-left me-2"></i> Quay lại trang chủ</a></p>
    </div>

    <!-- Bootstrap 5 JS and Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script>
        // Search functionality
        document.getElementById('searchInput').addEventListener('input', function(e) {
            const searchText = e.target.value.toLowerCase();
            const rows = document.querySelectorAll('#hotelTable tbody tr');
            rows.forEach(row => {
                const ten = row.cells[1].textContent.toLowerCase();
                const diaChi = row.cells[2].textContent.toLowerCase();
                row.style.display = (ten.includes(searchText) || diaChi.includes(searchText)) ? '' : 'none';
            });
        });

        // Pagination (client-side placeholder)
        document.querySelectorAll('.page-link').forEach(link => {
            link.addEventListener('click', function(e) {
                e.preventDefault();
                // Add server-side pagination logic here
                alert('Chức năng phân trang chưa được triển khai. Vui lòng thêm logic phía server.');
            });
        });
    </script>
</body>
</html>