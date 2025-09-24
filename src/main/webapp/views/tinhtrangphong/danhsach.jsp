<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.TinhTrangPhong" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tình trạng phòng theo ngày</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Font Awesome 6 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous">
    <!-- Google Fonts: Inter -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.3/dist/chart.umd.min.js"></script>
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
            vertical-align: middle;
            transition: background 0.2s ease;
        }
        .table tbody tr:hover td {
            background: #f1f5f9;
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

        /* Chart Container */
        .chart-container {
            max-width: 800px;
            margin: 2rem auto;
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
            .chart-container {
                max-width: 100%;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <div class="header">
        <img src="https://images.unsplash.com/photo-1542314831-8f7d16dd2b3b" alt="Hotel Banner" class="img-fluid">
        <h2><i class="fas fa-calendar-alt me-2"></i> Tình Trạng Phòng Theo Ngày</h2>
    </div>

    <!-- Table Container -->
    <div class="container table-container">
        <!-- Search Bar -->
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h4 class="fw-bold">Tình Trạng Phòng</h4>
            <div class="search-bar">
                <i class="fas fa-search"></i>
                <input type="text" id="searchInput" class="form-control" placeholder="Tìm kiếm theo tên phòng hoặc ngày">
            </div>
        </div>

        <%
            List<TinhTrangPhong> list = (List<TinhTrangPhong>) request.getAttribute("listTinhTrang");
            if (list == null || list.isEmpty()) {
        %>
            <div class="alert alert-info d-flex align-items-center" role="alert">
                <i class="fas fa-info-circle me-2"></i>
                <div>Chưa có dữ liệu tình trạng phòng.</div>
            </div>
        <%
            } else {
        %>
            <!-- Chart -->
            <div class="chart-container">
                <canvas id="availabilityChart"></canvas>
            </div>

            <!-- Table -->
            <div class="table-responsive">
                <table class="table table-hover table-bordered" id="statusTable">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Tên Phòng</th>
                            <th>Ngày</th>
                            <th>Số Lượng Còn</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int i = 1;
                            for (TinhTrangPhong ttp : list) {
                        %>
                            <tr>
                                <td><%= i++ %></td>
                                <td><%= ttp.getTenPhong() %></td>
                                <td><%= ttp.getNgay() %></td>
                                <td><%= ttp.getSoLuongCon() %></td>
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
            const rows = document.querySelectorAll('#statusTable tbody tr');
            rows.forEach(row => {
                const tenPhong = row.cells[1].textContent.toLowerCase();
                const ngay = row.cells[2].textContent.toLowerCase();
                row.style.display = (tenPhong.includes(searchText) || ngay.includes(searchText)) ? '' : 'none';
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

        // Chart.js
        <%
            if (list != null && !list.isEmpty()) {
                StringBuilder labels = new StringBuilder("[");
                StringBuilder data = new StringBuilder("[");
                for (int j = 0; j < list.size(); j++) {
                    TinhTrangPhong ttp = list.get(j);
                    labels.append("\"").append(ttp.getNgay()).append("\"");
                    data.append(ttp.getSoLuongCon());
                    if (j < list.size() - 1) {
                        labels.append(",");
                        data.append(",");
                    }
                }
                labels.append("]");
                data.append("]");
        %>
            const ctx = document.getElementById('availabilityChart').getContext('2d');
            const chart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: <%= labels.toString() %>,
                    datasets: [{
                        label: 'Số lượng phòng còn lại',
                        data: <%= data.toString() %>,
                        backgroundColor: 'rgba(59, 130, 246, 0.6)',
                        borderColor: 'rgba(59, 130, 246, 1)',
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true,
                            title: {
                                display: true,
                                text: 'Số lượng phòng còn'
                            }
                        },
                        x: {
                            title: {
                                display: true,
                                text: 'Ngày'
                            }
                        }
                    },
                    plugins: {
                        legend: {
                            display: true,
                            position: 'top'
                        }
                    }
                }
            });
        <%
            }
        %>
    </script>
</body>
</html>