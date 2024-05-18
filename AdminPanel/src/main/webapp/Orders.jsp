<%@page import="Model.Dao"%>
<%@page import="Model.OrderDto"%>
<%@page import="java.io.OutputStream"%>
<%@page import="Model.Images"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>orders</title>
<%@include file="includes/Header.jsp" %>
<%@include file="includes/Style.jsp" %>
<script>
        function downloadImage(imageId) {
            var xhr = new XMLHttpRequest();
            xhr.open('GET', 'downloadImage?imageId=' + imageId, true);
            xhr.responseType = 'blob';

            xhr.onload = function() {
                if (this.status === 200) {
                    var blob = this.response;
                    var a = document.createElement('a');
                    a.href = window.URL.createObjectURL(blob);
                    a.download = 'image.jpg';
                    document.body.appendChild(a);
                    a.click();
                    document.body.removeChild(a);
                }
            };

            xhr.send();
        }
    </script>

</head>
<body>
<%@include file="includes/sidebar.jsp" %>

<main class="w-full md:w-[calc(100%-256px)] md:ml-64 bg-gray-200 min-h-screen transition-all main ">
       <%@include file="includes/navbar.jsp" %>
        <!-- end navbar -->

      <!-- Content -->
        <div class="flex flex-col justify-center items-center p-10">
            <div
                class="relative flex w-full flex-col rounded-[10px] border-[1px] border-gray-200 bg-white bg-clip-border shadow-md shadow-[#F3F3F3]"
            >
                <div
                class="flex h-fit w-full items-center justify-between rounded-t-2xl bg-white px-4 pb-[20px] pt-4 shadow-2xl shadow-gray-100 dark:!bg-navy-700 dark:shadow-none"
                >
                <h4 class="text-lg font-bold text-navy-700">
                   	Order Table
                </h4>
                <%@include file="includes/dialogbox.jsp" %>
                </div>
                <div class="w-full overflow-x-scroll px-4 md:overflow-x-hidden">
                <table role="table" class="w-full min-w-[500px] overflow-x-scroll">
                    <thead>
                    <tr role="row">
                        <th
                        colspan="1"
                        role="columnheader"
                        title="Toggle SortBy"
                        style="cursor: pointer"
                        >
                        <div
                            class="flex items-center justify-between pb-2 pt-4 text-start uppercase tracking-wide text-gray-600 sm:text-xs lg:text-xs"
                        >
                            Name
                        </div>
                        </th>
                        <th
                        colspan="1"
                        role="columnheader"
                        title="Toggle SortBy"
                        style="cursor: pointer"
                        >
                        <div
                            class="flex items-center justify-between pb-2 pt-4 text-start uppercase tracking-wide text-gray-600 sm:text-xs lg:text-xs"
                        >
                            Type
                        </div>
                        </th>
                        <th
                        colspan="1"
                        role="columnheader"
                        title="Toggle SortBy"
                        style="cursor: pointer"
                        >
                        <div
                            class="flex items-center justify-between pb-2 pt-4 text-start uppercase tracking-wide text-gray-600 sm:text-xs lg:text-xs"
                        >
                            Faces
                        </div>
                        </th>
                        <th
                        colspan="1"
                        role="columnheader"
                        title="Toggle SortBy"
                        style="cursor: pointer"
                        >
                        <div
                            class="flex items-center justify-between pb-2 pt-4 text-start uppercase tracking-wide text-gray-600 sm:text-xs lg:text-xs"
                        >
                            Size
                        </div>
                        </th>
                        <th
                        colspan="1"
                        role="columnheader"
                        title="Toggle SortBy"
                        style="cursor: pointer"
                        >
                        <div
                            class="flex items-center justify-between pb-2 pt-4 text-start uppercase tracking-wide text-gray-600 sm:text-xs lg:text-xs"
                        >
                            Contact
                        </div>
                        </th>
                        <th
                        colspan="1"
                        role="columnheader"
                        title="Toggle SortBy"
                        style="cursor: pointer"
                        >
                        <div
                            class="flex items-center justify-between pb-2 pt-4 text-start uppercase tracking-wide text-gray-600 sm:text-xs lg:text-xs"
                        >
                            Payment
                        </div>
                        </th>
                        <th
                        colspan="1"
                        role="columnheader"
                        title="Toggle SortBy"
                        style="cursor: pointer"
                        >
                        <div
                            class="flex items-center justify-between pb-2 pt-4 text-start uppercase tracking-wide text-gray-600 sm:text-xs lg:text-xs"
                        >
                          	download
                        </div>
                        </th>
                    </tr>
                    </thead>
                    <tbody role="rowgroup" class="px-4">
                    <%
                    ArrayList<OrderDto> orderList=(ArrayList<OrderDto>) request.getAttribute("ORDERLIST");
                    for(OrderDto i:orderList){ %>
                    <tr role="row">
                        <td class="py-3 text-sm" role="cell">
                        <div class="flex items-center gap-2">
                            <div class="h-[30px] w-[30px] rounded-full">
                            <img
                                src="data:image/jpg;base64,<%=i.getBase64Image() %>"
                                class="h-full w-full rounded-full"
                                alt=""
                            />
                            </div>
                            <p
                            class="text-sm font-medium text-navy-700"
                            >
                            <%=i.getCustomerName() %>
                            </p>
                        </div>
                        </td>
                        <td class="py-3 text-sm" role="cell">
                        <p class="text-md font-medium text-gray-600">
                           <%=i.getOrderType() %>
                        </p>
                        </td>
                        <td class="py-3 text-sm" role="cell">
                       	<p class="text-md font-medium text-gray-600">
                           <%=i.getOrderFace() %>
                        </p>
                        </td>
                         <td class="py-3 text-sm" role="cell">
                       	<p class="text-md font-medium text-gray-600">
                           <%=i.getOrderSize() %>
                        </p>
                        </td>
                         <td class="py-3 text-sm" role="cell">
                       	<p class="text-md font-medium text-gray-600">
                           <%=i.getCustomerContact()%>
                        </p>
                        </td>
                         <td class="py-3 text-sm" role="cell">
                       	<p class="text-md font-medium text-gray-600">
                           <%=i.getOrderPayment()%>
                        </p>
                        </td>
                         <td class="py-3 text-lg" role="cell">
                       	<button onclick="downloadImage(<%=i.getOrderId()%>)" class="text-md font-medium cursor-pointer text-red-600">
                           <i class="ri-download-line"></i>
                        </button>
                        </td>
                    </tr>
                    <%} %>
                    <%double total=Dao.totalRevenue(); %>
                    <tr class="row">
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                    	<td></td>
                        <td class="py-3 text-sm text-center text-start">
                       	<p class="text-md font-medium text-gray-600">
                       		Total Revenue : 
                           <%=total%>
                        </p>
                        </td>
                    </tr>
                    </tbody>
                </table>
                </div>
            </div>
        </div>
           
 </main> 
</body>
 <%@include file="includes/footerfile.jsp" %>
</html>