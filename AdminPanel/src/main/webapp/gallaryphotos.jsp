<%@page import="java.io.OutputStream"%>
<%@page import="Model.Images"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>gallary</title>
<%@include file="includes/Header.jsp" %>
<%@include file="includes/Style.jsp" %>
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
                   	Image Table
                </h4>
                <button
                	onclick="document.getElementById('myModal').showModal()"
                	id="btn"
                    class="linear rounded-[20px] bg-lightPrimary px-4 py-2 text-base font-medium text-brand-500 transition duration-200 hover:bg-gray-100 active:bg-gray-200"
                >
                    Add Photo
                </button>
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
                            Date
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
                            Action
                        </div>
                        </th>
                    </tr>
                    </thead>
                    <tbody role="rowgroup" class="px-4">
                    <%
                    ArrayList<Images> imgList=(ArrayList<Images>) request.getAttribute("IMGDATA");
                    for(Images i:imgList){ %>
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
                            <%=i.getImgTitle() %>
                            </p>
                        </div>
                        </td>
                        <td class="py-3 text-sm" role="cell">
                        <p class="text-md font-medium text-gray-600">
                           <%=i.getImgType() %>
                        </p>
                        </td>
                        <td class="py-3 text-sm" role="cell">
                       	<p class="text-md font-medium text-gray-600">
                           <%=i.getImgDate() %>
                        </p>
                        </td>
                         <td class="py-3 text-lg text-center" role="cell">
                       	<a href="delete?id=<%=i.getImgId() %>" class="text-md font-medium cursor-pointer text-red-600">
                           <i class="ri-delete-bin-2-line"></i>
                        </a>
                        </td>
                    </tr>
                    <%} %>
                    </tbody>
                </table>
                </div>
            </div>
        </div>
           
 </main> 
</body>
 <%@include file="includes/footerfile.jsp" %>
</html>