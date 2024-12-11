<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Content</title>
    <link rel="stylesheet" href="../../css/content.css">
    <link rel="stylesheet" href="../../css/sidebar_header.css">
    <style>
        .container {
            display: flex;
            min-height: 100vh;
        }
        
        .main-content {
            flex: 1;
            background: #f8f9fa;
            padding: 24px;
        }

        h2 {
            font-size: 24px;
            color: #333;
            margin-bottom: 24px;
        }

        .content-form {
            background: white;
            padding: 32px;
            border-radius: 8px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
            max-width: 800px;
            margin: 0 auto;
        }

        .thumbnail-upload {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 12px;
            margin-bottom: 32px;
            padding: 32px;
            border: 2px dashed #ddd;
            border-radius: 8px;
            cursor: pointer;
        }

        .thumbnail-upload .camera-icon {
            width: 48px;
            height: 48px;
            background: #f8f9fa;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .upload-text {
            color: #4285f4;
            font-size: 14px;
        }

        .form-group {
            margin-bottom: 24px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: 500;
        }

        .form-control {
            width: 100%;
            padding: 8px 12px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 14px;
        }

        .form-control:focus {
            outline: none;
            border-color: #4285f4;
        }

        .form-row {
            display: flex;
            gap: 24px;
        }

        .form-row .form-group {
            flex: 1;
        }

        .submit-btn {
            background: #4285f4;
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            width: 100%;
            margin-top: 16px;
        }

        .submit-btn:hover {
            background: #3367d6;
        }
    </style>
</head>
<body>
    <div class="container">
        <%@ include file="sidebar_content.jsp" %>
        <div class="main-content">
            <%@ include file="../header_tvpss.jsp" %>
            
            <h2>Add New Content</h2>
            
            <form class="content-form">
                <div class="thumbnail-upload">
                    <div class="camera-icon">
                        📷
                    </div>
                    <span class="upload-text">Upload Video Thumbnail</span>
                </div>
				<div class="form-group">
                    <label for="category">School</label>
                    <select id="category" class="form-control">
                        <option value="">SMK Bandar Kota Tinggi</option>
                        <option>SMK Impian Emas</option>
                        <option>SMK Taman Pelangi</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="videoName">Video Name</label>
                    <input type="text" id="videoName" class="form-control" placeholder="Enter video name">
                </div>

                <div class="form-group">
                    <label for="category">Category</label>
                    <select id="category" class="form-control">
                        <option value="">Educational</option>
                        <option>Awareness</option>
                        <option>Vlog</option>
                    </select>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="uploadDate">Uploaded Date</label>
                        <input type="date" id="uploadDate" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="videoLink">Video Link</label>
                        <input type="text" id="videoLink" class="form-control" placeholder="Address">
                    </div>
                </div>

                <button type="submit" class="submit-btn">Add Now</button>
            </form>
        </div>
    </div>
</body>
</html>