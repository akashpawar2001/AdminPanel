<%@page import="Model.Feedback"%>
<%@page import="Model.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User</title>
<%@include file="includes/Header.jsp" %>
<%@include file="includes/Style.jsp" %>
</head>
<body>
<%@include file="includes/sidebar.jsp" %>

<main class="w-full md:w-[calc(100%-256px)] md:ml-64 bg-gray-200 min-h-screen transition-all main ">
       <%@include file="includes/navbar.jsp" %>
        <!-- end navbar -->

      <!-- Content -->
       
            <div class="grid gap-6 mb-6 p-6	">
                <div class="p-6 relative flex flex-col min-w-0 mb-4 lg:mb-0 break-words bg-gray-50 dark:bg-gray-800 w-full shadow-lg rounded">
                    <div class="rounded-t mb-0 px-0 border-0">
                      <div class="flex flex-wrap items-center px-4 py-2">
                        <div class="relative w-full max-w-full flex-grow flex-1">
                          <h3 class="font-semibold text-base text-gray-900 dark:text-gray-50">Feedbacks</h3>
                        </div>
                      </div>
                      <div class="block w-full overflow-x-auto">
                        <table class="items-center w-full bg-transparent border-collapse">
                          <thead>
                            <tr>
                              <th class="px-4 bg-gray-100 dark:bg-gray-600 text-gray-500 dark:text-gray-100 align-middle border border-solid border-gray-200 dark:border-gray-500 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left">Name</th>
                              <th class="px-4 bg-gray-100 dark:bg-gray-600 text-gray-500 dark:text-gray-100 align-middle border border-solid border-gray-200 dark:border-gray-500 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left">Message</th>
                            </tr>
                          </thead>
                          <tbody>
                        <% ArrayList<Feedback> data=(ArrayList<Feedback>) request.getAttribute("FEEDBACKS"); %>
                        <%for(Feedback u:data){ %>
                            <tr class="text-gray-700 dark:text-gray-100">
                              <th class="border-t-0 px-4 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4 text-left"><%=u.getFeedbackerName() %></th>
                              <td class="border-t-0 px-4 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"><%=u.getFeedbackerMessage() %></td>
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