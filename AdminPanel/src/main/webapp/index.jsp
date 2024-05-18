<%@page import="Model.OrderDto"%>
<%@page import="Model.User"%>
<%@page import="java.util.List"%>
<%@page import="Model.Dao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Admin Panel</title>
<%@include file="includes/Header.jsp" %>
<%@include file="includes/Style.jsp" %>
</head>
<body>
<%@include file="includes/sidebar.jsp" %>
    <!-- end sidenav -->

    <main class="w-full md:w-[calc(100%-256px)] md:ml-64 bg-gray-200 min-h-screen transition-all main">
       <%@include file="includes/navbar.jsp" %>
        <!-- end navbar -->

      <!-- Content -->
        <div class="p-6">
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 mb-6">
                <div class="bg-white rounded-md border border-gray-100 p-6 shadow-md shadow-black/5">
                    <div class="flex justify-between mb-6">
                        <div>
                            <div class="flex items-center mb-1">
                            <%int count=Dao.fetchUsers(); %>
                                <div class="text-2xl font-semibold"><%=count %></div>
                            </div>
                            <div class="text-sm font-medium text-gray-400">Users</div>
                        </div>
                    </div>

                    <a href="customer" class="text-[#f84525] font-medium text-sm hover:text-red-800">View</a>
                </div>
                <div class="bg-white rounded-md border border-gray-100 p-6 shadow-md shadow-black/5">
                    <div class="flex justify-between mb-4">
                        <div>
                        <%int orderCount=Dao.fetchOrderCount(); %>
                            <div class="flex items-center mb-1">
                                <div class="text-2xl font-semibold"><%=orderCount %></div>
                            </div>
                            <div class="text-sm font-medium text-gray-400">Orders</div>
                        </div>
                    </div>
                    <a href="orders" class="text-[#f84525] font-medium text-sm hover:text-red-800">View</a>
                </div>
                <div class="bg-white rounded-md border border-gray-100 p-6 shadow-md shadow-black/5">
                    <div class="flex justify-between mb-6">
                        <div>
                        <% int feedbackCount=Dao.fetchFeedbackCount(); %>
                            <div class="text-2xl font-semibold mb-1"><%=feedbackCount %></div>
                            <div class="text-sm font-medium text-gray-400">Feedback</div>
                        </div>
                    </div>
                    <a href="feedback" class="text-[#f84525] font-medium text-sm hover:text-red-800">View</a>
                </div>
            </div>
            <div class="grid grid-cols-1 lg:grid-cols-2 gap-6 mb-6">
                <div class="p-6 relative flex flex-col min-w-0 mb-4 lg:mb-0 break-words bg-gray-50 dark:bg-gray-800 w-full shadow-lg rounded">
                    <div class="rounded-t mb-0 px-0 border-0">
                      <div class="flex flex-wrap items-center px-4 py-2">
                        <div class="relative w-full max-w-full flex-grow flex-1">
                          <h3 class="font-semibold text-base text-gray-900 dark:text-gray-50">Users</h3>
                        </div>
                      </div>
                      <div class="block w-full overflow-x-auto">
                        <table class="items-center w-full bg-transparent border-collapse">
                          <thead>
                            <tr>
                              <th class="px-4 bg-gray-100 dark:bg-gray-600 text-gray-500 dark:text-gray-100 align-middle border border-solid border-gray-200 dark:border-gray-500 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left">Name</th>
                              <th class="px-4 bg-gray-100 dark:bg-gray-600 text-gray-500 dark:text-gray-100 align-middle border border-solid border-gray-200 dark:border-gray-500 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left">Email</th>
                              <th class="px-4 bg-gray-100 dark:bg-gray-600 text-gray-500 dark:text-gray-100 align-middle border border-solid border-gray-200 dark:border-gray-500 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left min-w-140-px">Contact No</th>
                            </tr>
                          </thead>
                          <tbody>
                          <%List<User> users=Dao.fethUserDetails();%>
                          <%for(User user:users){ %>
                            <tr class="text-gray-700 dark:text-gray-100">
                              <th class="border-t-0 px-4 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4 text-left"><%=user.getFirstName() %> <%=user.getLastName() %></th>
                              <td class="border-t-0 px-4 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"><%=user.getEmailAddress() %></td>
                              <td class="border-t-0 px-4 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4">
                                <div class="flex items-center">
                                  <span class="mr-2"><%=user.getContact() %></span>
                                </div>
                              </td>
                            </tr>
                            <%} %>
                          </tbody>
                        </table>
                      </div>
                    </div>
                  </div>
                  
                 
                <div class="p-6 relative flex flex-col min-w-0 mb-4 lg:mb-0 break-words bg-gray-50 dark:bg-gray-800 w-full shadow-lg rounded">
                    <div class="rounded-t mb-0 px-0 border-0">
                      <div class="flex flex-wrap items-center px-4 py-2">
                        <div class="relative w-full max-w-full flex-grow flex-1">
                          <h3 class="font-semibold text-base text-gray-900 dark:text-gray-50">Orders</h3>
                        </div>
                      </div>
                      <div class="block w-full overflow-x-auto">
                        <table class="items-center w-full bg-transparent border-collapse">
                          <thead>
                            <tr>
                              <th class="px-4 bg-gray-100 dark:bg-gray-600 text-gray-500 dark:text-gray-100 align-middle border border-solid border-gray-200 dark:border-gray-500 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left">Customer Name</th>
                              <th class="px-4 bg-gray-100 dark:bg-gray-600 text-gray-500 dark:text-gray-100 align-middle border border-solid border-gray-200 dark:border-gray-500 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left">Order Type</th>
                              <th class="px-4 bg-gray-100 dark:bg-gray-600 text-gray-500 dark:text-gray-100 align-middle border border-solid border-gray-200 dark:border-gray-500 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left min-w-140-px">Size</th>
                            </tr>
                          </thead>
                          <tbody>
                           <%List<OrderDto> ordersList=Dao.fetchOrders();%>
                          <%for(OrderDto o1:ordersList){ %>
                            <tr class="text-gray-700 dark:text-gray-100">
                              <th class="border-t-0 px-4 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4 text-left"><%=o1.getCustomerName() %></th>
                              <td class="border-t-0 px-4 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"><%=o1.getOrderType() %></td>
                              <td class="border-t-0 px-4 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4">
                              <%=o1.getOrderSize() %>
                              </td>
                            </tr>
                            <%} %>
                          </tbody>
                        </table>
                      </div>
                    </div>
                  </div>
                 </div>
        </main>
</body>
 <%@include file="includes/footerfile.jsp" %>
</html>