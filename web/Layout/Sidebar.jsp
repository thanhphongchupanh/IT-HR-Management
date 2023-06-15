<%-- Document : sidebar Created on : Jun 3, 2023, 3:33:21 PM Author : trong --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<nav class="fixed top-0 z-50 w-full border-b bg-gray-800 border-gray-700">
    <div class="px-3 py-3 lg:px-5 lg:pl-3">
        <div class="flex items-center justify-between">
            <div class="flex items-center justify-start">
                <!-- Logo  -->
                <button data-drawer-target="logo-sidebar" data-drawer-toggle="logo-sidebar"
                        aria-controls="logo-sidebar" type="button"
                        class="inline-flex items-center p-2 text-sm rounded-lg sm:hidden focus:outline-none focus:ring-2 text-gray-400 hover:bg-gray-700 focus:ring-gray-600">
                    <span class="sr-only">Open sidebar</span>
                    <svg class="w-6 h-6" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20"
                         xmlns="http://www.w3.org/2000/svg">
                        <path clip-rule="evenodd" fill-rule="evenodd"
                              d="M2 4.75A.75.75 0 012.75 4h14.5a.75.75 0 010 1.5H2.75A.75.75 0 012 4.75zm0 10.5a.75.75 0 01.75-.75h7.5a.75.75 0 010 1.5h-7.5a.75.75 0 01-.75-.75zM2 10a.75.75 0 01.75-.75h14.5a.75.75 0 010 1.5H2.75A.75.75 0 012 10z">
                        </path>
                    </svg>
                </button>
                <a href="#" class="flex ml-2 md:mr-24">
                    <img src="https://flowbite.com/docs/images/logo.svg" class="h-8 mr-3" alt="FlowBite Logo" />
                    <span
                        class="self-center text-xl font-semibold sm:text-2xl whitespace-nowrap text-white">CounsinTech</span>
                </a>
            </div>
            <div class="flex items-center">
                <div class="flex items-center ml-3">
                    <!-- avatar -->
                    <div>
                        <button type="button"
                                class="flex text-sm bg-gray-800 rounded-full focus:ring-4 focus:ring-gray-600"
                                aria-expanded="false" data-dropdown-toggle="dropdown-user">
                            <span class="sr-only">Open user menu</span>
                            <img class="w-8 h-8 rounded-full"
                                 src="https://flowbite.com/docs/images/people/profile-picture-5.jpg"
                                 alt="user photo" />
                        </button>
                    </div>
                    <!-- user dropdown menu -->
                    <div class="z-50 hidden my-4 text-base list-none divide-y rounded shadow bg-gray-700 divide-gray-600"
                         id="dropdown-user">                   

                        <div class="px-4 py-3" role="none">
                            <p class="text-sm text-white" role="none">
                                <c:out value="${user.username}"></c:out>
                                </p>

                            </div>
                            <ul class="py-1" role="none">
                                <li>
                                    <a href="/HRManagement/Dashboard.jsp"
                                       class="block px-4 py-2 text-sm text-gray-300 hover:bg-gray-600 hover:text-white"
                                       role="menuitem">Dashboard</a>
                                </li>
                                <li>
                                    <a href="/HRManagement/DispatchServlet?btnAction=newPassword"
                                       class="block px-4 py-2 text-sm text-gray-300 hover:bg-gray-600 hover:text-white"
                                       role="menuitem">
                                        Change Password
                                    </a>
                                </li>

                                <!-- <li>
                                    <a href="#"
                                        class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 text-gray-300 hover:bg-gray-600 hover:text-white"
                                        role="menuitem">Settings</a>
                                </li>
                                <li>
                                    <a href="#"
                                        class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 text-gray-300 hover:bg-gray-600 hover:text-white"
                                        role="menuitem">Earnings</a>
                                </li> -->
                                <li>
                                <c:url var="logout" value="DispatchServlet">
                                    <c:param name="btnAction" value="Logout" />
                                </c:url>
                                </a>
                                <a href=" ${logout}"
                                   class="block px-4 py-2 text-sm text-gray-300 hover:bg-gray-600 hover:text-white"
                                   role="menuitem">Sign out</a>
                            </li>



                            <c:if test="${user!=null}">  
                                <li class="nav-item">

                                </li>  
                            </c:if>


                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</nav>
<!-- sider -->
<aside id="logo-sidebar"
       class="fixed top-0 left-0 z-40 w-64 h-screen pt-20 transition-transform -translate-x-full border-r sm:translate-x-0 bg-gray-800 border-gray-700"
       aria-label="Sidebar">
    <div class="h-full px-3 pb-4 overflow-y-auto bg-gray-800">
        <!-- sider menu -->
        <ul class="space-y-2 font-medium">
            <li>
                <a href="/HRManagement/Dashboard.jsp"
                   class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700">
                    <svg aria-hidden="true"
                         class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                         fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path d="M2 10a8 8 0 018-8v8h8a8 8 0 11-16 0z"></path>
                        <path d="M12 2.252A8.014 8.014 0 0117.748 8H12V2.252z"></path>
                    </svg>
                    <span class="ml-3">Dashboard</span>
                </a>
            </li>
            <c:if test="${user != null and user.roleName == 'HR_SD'}">               
                <li class="nav-item ">
                    <a href="DispatchServlet?btnAction=Staff"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                             fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                             aria-hidden="true">
                            <path
                                d="M10 9a3 3 0 100-6 3 3 0 000 6zM6 8a2 2 0 11-4 0 2 2 0 014 0zM1.49 15.326a.78.78 0 01-.358-.442 3 3 0 014.308-3.516 6.484 6.484 0 00-1.905 3.959c-.023.222-.014.442.025.654a4.97 4.97 0 01-2.07-.655zM16.44 15.98a4.97 4.97 0 002.07-.654.78.78 0 00.357-.442 3 3 0 00-4.308-3.517 6.484 6.484 0 011.907 3.96 2.32 2.32 0 01-.026.654zM18 8a2 2 0 11-4 0 2 2 0 014 0zM5.304 16.19a.844.844 0 01-.277-.71 5 5 0 019.947 0 .843.843 0 01-.277.71A6.975 6.975 0 0110 18a6.974 6.974 0 01-4.696-1.81z">
                            </path>
                        </svg>
                        <span class="ml-3">Staff list</span>
                    </a>
                </li>
                <li class="nav-item ">
                    <a href="DispatchServlet?btnAction=CreateApplication"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                             fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                             aria-hidden="true">
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M3 4.25A2.25 2.25 0 015.25 2h5.5A2.25 2.25 0 0113 4.25v2a.75.75 0 01-1.5 0v-2a.75.75 0 00-.75-.75h-5.5a.75.75 0 00-.75.75v11.5c0 .414.336.75.75.75h5.5a.75.75 0 00.75-.75v-2a.75.75 0 011.5 0v2A2.25 2.25 0 0110.75 18h-5.5A2.25 2.25 0 013 15.75V4.25z">
                            </path>
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M6 10a.75.75 0 01.75-.75h9.546l-1.048-.943a.75.75 0 111.004-1.114l2.5 2.25a.75.75 0 010 1.114l-2.5 2.25a.75.75 0 11-1.004-1.114l1.048-.943H6.75A.75.75 0 016 10z">
                            </path>
                        </svg>

                        <span class="ml-3">Create Applicant</span>
                    </a>
                </li>
                <li class="nav-item ">
                    <a href="DispatchServlet?btnAction=Pending"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                             fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                             aria-hidden="true">
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M3 4.25A2.25 2.25 0 015.25 2h5.5A2.25 2.25 0 0113 4.25v2a.75.75 0 01-1.5 0v-2a.75.75 0 00-.75-.75h-5.5a.75.75 0 00-.75.75v11.5c0 .414.336.75.75.75h5.5a.75.75 0 00.75-.75v-2a.75.75 0 011.5 0v2A2.25 2.25 0 0110.75 18h-5.5A2.25 2.25 0 013 15.75V4.25z">
                            </path>
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M6 10a.75.75 0 01.75-.75h9.546l-1.048-.943a.75.75 0 111.004-1.114l2.5 2.25a.75.75 0 010 1.114l-2.5 2.25a.75.75 0 11-1.004-1.114l1.048-.943H6.75A.75.75 0 016 10z">
                            </path>
                        </svg>

                        <span class="ml-3">Day leave</span>
                    </a>
                </li>
                <li class="nav-item ">
                    <a href="DispatchServlet?btnAction=Sent"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                             fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                             aria-hidden="true">
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M3 4.25A2.25 2.25 0 015.25 2h5.5A2.25 2.25 0 0113 4.25v2a.75.75 0 01-1.5 0v-2a.75.75 0 00-.75-.75h-5.5a.75.75 0 00-.75.75v11.5c0 .414.336.75.75.75h5.5a.75.75 0 00.75-.75v-2a.75.75 0 011.5 0v2A2.25 2.25 0 0110.75 18h-5.5A2.25 2.25 0 013 15.75V4.25z">
                            </path>
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M6 10a.75.75 0 01.75-.75h9.546l-1.048-.943a.75.75 0 111.004-1.114l2.5 2.25a.75.75 0 010 1.114l-2.5 2.25a.75.75 0 11-1.004-1.114l1.048-.943H6.75A.75.75 0 016 10z">
                            </path>
                        </svg>

                        <span class="ml-3">Sent</span>
                    </a>
                </li>
                <li class="nav-item ">
                    <a href="DispatchServlet?btnAction=UserInfo"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                             fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                             aria-hidden="true">
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M3 4.25A2.25 2.25 0 015.25 2h5.5A2.25 2.25 0 0113 4.25v2a.75.75 0 01-1.5 0v-2a.75.75 0 00-.75-.75h-5.5a.75.75 0 00-.75.75v11.5c0 .414.336.75.75.75h5.5a.75.75 0 00.75-.75v-2a.75.75 0 011.5 0v2A2.25 2.25 0 0110.75 18h-5.5A2.25 2.25 0 013 15.75V4.25z">
                            </path>
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M6 10a.75.75 0 01.75-.75h9.546l-1.048-.943a.75.75 0 111.004-1.114l2.5 2.25a.75.75 0 010 1.114l-2.5 2.25a.75.75 0 11-1.004-1.114l1.048-.943H6.75A.75.75 0 016 10z">
                            </path>
                        </svg>

                        <span class="ml-3">User Info</span>
                    </a>
                </li>
                <li class="nav-item ">
                    <a href="DispatchServlet?btnAction=Report"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                             fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                             aria-hidden="true">
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M3 4.25A2.25 2.25 0 015.25 2h5.5A2.25 2.25 0 0113 4.25v2a.75.75 0 01-1.5 0v-2a.75.75 0 00-.75-.75h-5.5a.75.75 0 00-.75.75v11.5c0 .414.336.75.75.75h5.5a.75.75 0 00.75-.75v-2a.75.75 0 011.5 0v2A2.25 2.25 0 0110.75 18h-5.5A2.25 2.25 0 013 15.75V4.25z">
                            </path>
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M6 10a.75.75 0 01.75-.75h9.546l-1.048-.943a.75.75 0 111.004-1.114l2.5 2.25a.75.75 0 010 1.114l-2.5 2.25a.75.75 0 11-1.004-1.114l1.048-.943H6.75A.75.75 0 016 10z">
                            </path>
                        </svg>

                        <span class="ml-3">Report</span>
                    </a>
                </li>
                <li class="nav-item ">
                    <a href="MainController?btnAction=Pending"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                             fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                             aria-hidden="true">
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M3 4.25A2.25 2.25 0 015.25 2h5.5A2.25 2.25 0 0113 4.25v2a.75.75 0 01-1.5 0v-2a.75.75 0 00-.75-.75h-5.5a.75.75 0 00-.75.75v11.5c0 .414.336.75.75.75h5.5a.75.75 0 00.75-.75v-2a.75.75 0 011.5 0v2A2.25 2.25 0 0110.75 18h-5.5A2.25 2.25 0 013 15.75V4.25z">
                            </path>
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M6 10a.75.75 0 01.75-.75h9.546l-1.048-.943a.75.75 0 111.004-1.114l2.5 2.25a.75.75 0 010 1.114l-2.5 2.25a.75.75 0 11-1.004-1.114l1.048-.943H6.75A.75.75 0 016 10z">
                            </path>
                        </svg>

                        <span class="ml-3">Applicant</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="DispatchServlet?btnAction=Salary"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                             fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                             aria-hidden="true">
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M1 4a1 1 0 011-1h16a1 1 0 011 1v8a1 1 0 01-1 1H2a1 1 0 01-1-1V4zm12 4a3 3 0 11-6 0 3 3 0 016 0zM4 9a1 1 0 100-2 1 1 0 000 2zm13-1a1 1 0 11-2 0 1 1 0 012 0zM1.75 14.5a.75.75 0 000 1.5c4.417 0 8.693.603 12.749 1.73 1.111.309 2.251-.512 2.251-1.696v-.784a.75.75 0 00-1.5 0v.784a.272.272 0 01-.35.25A49.043 49.043 0 001.75 14.5z">
                            </path>
                        </svg>
                        <span class="ml-3">Salary list</span>
                    </a>
                </li>

                <li class="nav-item">
                    <a href="DispatchServlet?btnAction=ShowAccountList"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                             fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                             aria-hidden="true">
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-5.5-2.5a2.5 2.5 0 11-5 0 2.5 2.5 0 015 0zM10 12a5.99 5.99 0 00-4.793 2.39A6.483 6.483 0 0010 16.5a6.483 6.483 0 004.793-2.11A5.99 5.99 0 0010 12z">
                            </path>
                        </svg>
                        <span class="ml-3">Show Account List</span>

                    </a>

                </li>

                <li class="nav-item">
                    <a href="DispatchServlet?btnAction=ShowOvertimeList"
                       class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                        <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                             fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                             aria-hidden="true">
                            <path clip-rule="evenodd" fill-rule="evenodd"
                                  d="M12.577 4.878a.75.75 0 01.919-.53l4.78 1.281a.75.75 0 01.531.919l-1.281 4.78a.75.75 0 01-1.449-.387l.81-3.022a19.407 19.407 0 00-5.594 5.203.75.75 0 01-1.139.093L7 10.06l-4.72 4.72a.75.75 0 01-1.06-1.061l5.25-5.25a.75.75 0 011.06 0l3.074 3.073a20.923 20.923 0 015.545-4.931l-3.042-.815a.75.75 0 01-.53-.919z">
                            </path>
                        </svg>
                        <span class="ml-3">Show Overtime List</span>
                    </a>
                </c:if>



                <c:if test="${user != null and user.roleName == 'STAFF'}">
                    <li class="nav-item">
                        <a href="Staff home page.jsp"
                           class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700">
                            <svg aria-hidden="true"
                                 class="w-6 h-6 transition duration-75 text-gray-400  group-hover:text-white"
                                 fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                <path d="M2 10a8 8 0 018-8v8h8a8 8 0 11-16 0z"></path>
                                <path d="M12 2.252A8.014 8.014 0 0117.748 8H12V2.252z"></path>
                            </svg>
                            <span class="ml-3">Staff</span>
                        </a>
                    </li>

                    <li class="nav-item">
                        <a href="CreateDayLeave.jsp"
                           class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700">
                            <svg aria-hidden="true"
                                 class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                                 fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                <path d="M2 10a8 8 0 018-8v8h8a8 8 0 11-16 0z"></path>
                                <path d="M12 2.252A8.014 8.014 0 0117.748 8H12V2.252z"></path>
                            </svg>
                            <span class="ml-3">Create</span>
                        </a>
                    </li>
                </c:if>

        </ul>

                    
<!--                    role HR_PM-->
                    
                    <c:if test="${user != null and user.roleName == 'HR_PM'}">
                        <li class="nav-item ">
                            <a href="DispatchServlet?btnAction=Staff"
                                class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                                <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                                    fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                                    aria-hidden="true">
                                    <path
                                        d="M10 9a3 3 0 100-6 3 3 0 000 6zM6 8a2 2 0 11-4 0 2 2 0 014 0zM1.49 15.326a.78.78 0 01-.358-.442 3 3 0 014.308-3.516 6.484 6.484 0 00-1.905 3.959c-.023.222-.014.442.025.654a4.97 4.97 0 01-2.07-.655zM16.44 15.98a4.97 4.97 0 002.07-.654.78.78 0 00.357-.442 3 3 0 00-4.308-3.517 6.484 6.484 0 011.907 3.96 2.32 2.32 0 01-.026.654zM18 8a2 2 0 11-4 0 2 2 0 014 0zM5.304 16.19a.844.844 0 01-.277-.71 5 5 0 019.947 0 .843.843 0 01-.277.71A6.975 6.975 0 0110 18a6.974 6.974 0 01-4.696-1.81z">
                                    </path>
                                </svg>
                                <span class="ml-3">Staff list</span>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a href="DispatchServlet?btnAction=ShowAccountList"
                                class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                                <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                                    fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                                    aria-hidden="true">
                                    <path clip-rule="evenodd" fill-rule="evenodd"
                                        d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-5.5-2.5a2.5 2.5 0 11-5 0 2.5 2.5 0 015 0zM10 12a5.99 5.99 0 00-4.793 2.39A6.483 6.483 0 0010 16.5a6.483 6.483 0 004.793-2.11A5.99 5.99 0 0010 12z">
                                    </path>
                                </svg>
                                <span class="ml-3">Show Account List</span>

                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="DispatchServlet?btnAction=Timekeeping"
                                class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                                <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                                    fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                                    aria-hidden="true">
                                    <path clip-rule="evenodd" fill-rule="evenodd"
                                        d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-5.5-2.5a2.5 2.5 0 11-5 0 2.5 2.5 0 015 0zM10 12a5.99 5.99 0 00-4.793 2.39A6.483 6.483 0 0010 16.5a6.483 6.483 0 004.793-2.11A5.99 5.99 0 0010 12z">
                                    </path>
                                </svg>
                                <span class="ml-3">Show Timekeeping List</span>

                            </a>
                        </li>
                    </c:if>
                    
<!--                    role HR_UI-->

                    <c:if test="${user != null and user.roleName == 'HR_UI'}">
                        <li class="nav-item ">
                            <a href="DispatchServlet?btnAction=Staff"
                                class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                                <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                                    fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                                    aria-hidden="true">
                                    <path
                                        d="M10 9a3 3 0 100-6 3 3 0 000 6zM6 8a2 2 0 11-4 0 2 2 0 014 0zM1.49 15.326a.78.78 0 01-.358-.442 3 3 0 014.308-3.516 6.484 6.484 0 00-1.905 3.959c-.023.222-.014.442.025.654a4.97 4.97 0 01-2.07-.655zM16.44 15.98a4.97 4.97 0 002.07-.654.78.78 0 00.357-.442 3 3 0 00-4.308-3.517 6.484 6.484 0 011.907 3.96 2.32 2.32 0 01-.026.654zM18 8a2 2 0 11-4 0 2 2 0 014 0zM5.304 16.19a.844.844 0 01-.277-.71 5 5 0 019.947 0 .843.843 0 01-.277.71A6.975 6.975 0 0110 18a6.974 6.974 0 01-4.696-1.81z">
                                    </path>
                                </svg>
                                <span class="ml-3">Staff list</span>
                            </a>
                        </li>


    </div>

</aside>

                            </a>
                        </li>
                          <li class="nav-item">
                            <a href="DispatchServlet?btnAction=Timekeeping"
                                class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                                <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                                    fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                                    aria-hidden="true">
                                    <path clip-rule="evenodd" fill-rule="evenodd"
                                        d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-5.5-2.5a2.5 2.5 0 11-5 0 2.5 2.5 0 015 0zM10 12a5.99 5.99 0 00-4.793 2.39A6.483 6.483 0 0010 16.5a6.483 6.483 0 004.793-2.11A5.99 5.99 0 0010 12z">
                                    </path>
                                </svg>
                                <span class="ml-3">Show Timekeeping List</span>

                            </a>
                        </li>
                    </c:if>
                    
                    <!--role HR_SD-->
                    
                    <c:if test="${user != null and user.roleName == 'HR_SD'}">
                        <li class="nav-item ">
                            <a href="DispatchServlet?btnAction=Staff"
                                class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                                <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                                    fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                                    aria-hidden="true">
                                    <path
                                        d="M10 9a3 3 0 100-6 3 3 0 000 6zM6 8a2 2 0 11-4 0 2 2 0 014 0zM1.49 15.326a.78.78 0 01-.358-.442 3 3 0 014.308-3.516 6.484 6.484 0 00-1.905 3.959c-.023.222-.014.442.025.654a4.97 4.97 0 01-2.07-.655zM16.44 15.98a4.97 4.97 0 002.07-.654.78.78 0 00.357-.442 3 3 0 00-4.308-3.517 6.484 6.484 0 011.907 3.96 2.32 2.32 0 01-.026.654zM18 8a2 2 0 11-4 0 2 2 0 014 0zM5.304 16.19a.844.844 0 01-.277-.71 5 5 0 019.947 0 .843.843 0 01-.277.71A6.975 6.975 0 0110 18a6.974 6.974 0 01-4.696-1.81z">
                                    </path>
                                </svg>
                                <span class="ml-3">Staff list</span>
                            </a>
                        </li>


                        <li class="nav-item">
                            <a href="DispatchServlet?btnAction=ShowAccountList"
                                class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                                <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                                    fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                                    aria-hidden="true">
                                    <path clip-rule="evenodd" fill-rule="evenodd"
                                        d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-5.5-2.5a2.5 2.5 0 11-5 0 2.5 2.5 0 015 0zM10 12a5.99 5.99 0 00-4.793 2.39A6.483 6.483 0 0010 16.5a6.483 6.483 0 004.793-2.11A5.99 5.99 0 0010 12z">
                                    </path>
                                </svg>
                                <span class="ml-3">Show Account List</span>

                            </a>
                        </li>
                          <li class="nav-item">
                            <a href="DispatchServlet?btnAction=Timekeeping"
                                class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                                <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                                    fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                                    aria-hidden="true">
                                    <path clip-rule="evenodd" fill-rule="evenodd"
                                        d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-5.5-2.5a2.5 2.5 0 11-5 0 2.5 2.5 0 015 0zM10 12a5.99 5.99 0 00-4.793 2.39A6.483 6.483 0 0010 16.5a6.483 6.483 0 004.793-2.11A5.99 5.99 0 0010 12z">
                                    </path>
                                </svg>
                                <span class="ml-3">Show Timekeeping List</span>

                            </a>
                        </li>
                    </c:if>
                    
                    <!--role HR_SM-->
                    
                    <c:if test="${user != null and user.roleName == 'HR_SM'}">
                        <li class="nav-item ">
                            <a href="DispatchServlet?btnAction=Staff"
                                class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                                <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                                    fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                                    aria-hidden="true">
                                    <path
                                        d="M10 9a3 3 0 100-6 3 3 0 000 6zM6 8a2 2 0 11-4 0 2 2 0 014 0zM1.49 15.326a.78.78 0 01-.358-.442 3 3 0 014.308-3.516 6.484 6.484 0 00-1.905 3.959c-.023.222-.014.442.025.654a4.97 4.97 0 01-2.07-.655zM16.44 15.98a4.97 4.97 0 002.07-.654.78.78 0 00.357-.442 3 3 0 00-4.308-3.517 6.484 6.484 0 011.907 3.96 2.32 2.32 0 01-.026.654zM18 8a2 2 0 11-4 0 2 2 0 014 0zM5.304 16.19a.844.844 0 01-.277-.71 5 5 0 019.947 0 .843.843 0 01-.277.71A6.975 6.975 0 0110 18a6.974 6.974 0 01-4.696-1.81z">
                                    </path>
                                </svg>
                                <span class="ml-3">Staff list</span>
                            </a>
                        </li>


                        <li class="nav-item">
                            <a href="DispatchServlet?btnAction=ShowAccountList"
                                class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                                <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                                    fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                                    aria-hidden="true">
                                    <path clip-rule="evenodd" fill-rule="evenodd"
                                        d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-5.5-2.5a2.5 2.5 0 11-5 0 2.5 2.5 0 015 0zM10 12a5.99 5.99 0 00-4.793 2.39A6.483 6.483 0 0010 16.5a6.483 6.483 0 004.793-2.11A5.99 5.99 0 0010 12z">
                                    </path>
                                </svg>
                                <span class="ml-3">Show Account List</span>

                            </a>
                        </li>
                          <li class="nav-item">
                            <a href="DispatchServlet?btnAction=Timekeeping"
                                class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700 active:bg-gray-100">
                                <svg class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                                    fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"
                                    aria-hidden="true">
                                    <path clip-rule="evenodd" fill-rule="evenodd"
                                        d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-5.5-2.5a2.5 2.5 0 11-5 0 2.5 2.5 0 015 0zM10 12a5.99 5.99 0 00-4.793 2.39A6.483 6.483 0 0010 16.5a6.483 6.483 0 004.793-2.11A5.99 5.99 0 0010 12z">
                                    </path>
                                </svg>
                                <span class="ml-3">Show Timekeeping List</span>

                            </a>
                        </li>
                    </c:if>
                    
                    <!--role STAFF-->
                    
                    <c:if test="${user != null and user.roleName == 'STAFF'}">
                        <li class="nav-item">
                            <a href="Staff home page.jsp"
                                class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700">
                                <svg aria-hidden="true"
                                    class="w-6 h-6 transition duration-75 text-gray-400  group-hover:text-white"
                                    fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M2 10a8 8 0 018-8v8h8a8 8 0 11-16 0z"></path>
                                    <path d="M12 2.252A8.014 8.014 0 0117.748 8H12V2.252z"></path>
                                </svg>
                                <span class="ml-3">Staff</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="CreateDayLeave.jsp"
                                class="flex items-center p-2 rounded-lg text-white hover:bg-gray-700">
                                <svg aria-hidden="true"
                                    class="w-6 h-6 transition duration-75 text-gray-400 group-hover:text-white"
                                    fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M2 10a8 8 0 018-8v8h8a8 8 0 11-16 0z"></path>
                                    <path d="M12 2.252A8.014 8.014 0 0117.748 8H12V2.252z"></path>
                                </svg>
                                <span class="ml-3">Create</span>
                            </a>
                        </li>
                    </c:if>

                </ul>

            </div>

        </aside>
