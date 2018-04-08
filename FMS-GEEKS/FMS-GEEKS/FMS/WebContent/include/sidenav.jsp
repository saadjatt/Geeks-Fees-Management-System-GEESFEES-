<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <aside id="sidebar_main">
        
        <div class="sidebar_main_header">
            <div class="sidebar_logo">
            <label style="text-decoration: none;color:black;font-size:30px;font-weight: bold;">Fees</label>
            <label   style="text-decoration: underline;font-size:30px;color:blue;font-weight: bold;"> Geeks</label>
                <a href="index.html" class="sSidebar_show sidebar_logo_small">
                    <img class="logo_regular" src="assets/img/logo_main_small.png" alt="" height="32" width="32"/>
                    <img class="logo_light" src="assets/img/logo_main_small_light.png" alt="" height="32" width="32"/>
                </a>
            </div>
           
        </div>
        
        <div class="menu_section">
            <ul>
                <li class="current_section" title="Dashboard">
                    <a href="dashboard.jsp">
                        <span class="menu_icon"><i class="material-icons">&#xE871;</i></span>
                        <span class="menu_title">Dashboard</span>
                    </a>
                    
                </li>
                
                <li title="Students Management">
                    <a href="#">
                        <span class="menu_icon"><i class="material-icons">&#xE7FB;</i></span>
                        <span class="menu_title">Students Management</span>
                    </a>
                    <ul>
                    	 <li><a href="add_students.jsp">Add New Students</a></li>
                        <li><a href="view_students.jsp">View Students</a></li>
                       
                    </ul>
                
                </li>
                
                <li title="Fees Management">
                    <a href="#">
                        <span class="menu_icon"><i class="material-icons">&#xE8A1;</i></span>
                        <span class="menu_title">Fees Management </span>
                    </a>
                    <ul>
                     <li><a href="view_fees_pending.jsp">View Pending Fees</a></li>
                     <li><a href="view_fees_submit.jsp">View Students Fees</a></li>
                        <li><a href="view_fees_status.jsp">View All Fees Status</a></li>
                       
                    </ul>
                
                </li>
                
                
                 <li title="Batches Management">
                    <a href="#">
                        <span class="menu_icon"><i class="material-icons">&#xE1B2;</i></span>
                        <span class="menu_title">Batches Management</span>
                    </a>
                     <ul>
                     <li><a href="add_batch.jsp">Add New Batches</a></li>
                      <li><a href="batches.jsp">View All Batches</a></li>
                     </ul>
                   
                
                </li>
                
                 
             
               
                 
                 <li title="View All Students of Geeks with perticular batches ">
                    <a href="view_all_students.jsp">
                            <span class="menu_icon"><i class="material-icons">&#xE417;</i></span>   
                        <span class="menu_title"><b><u>View All Students</u></b></span>
                    </a>
                     
                
                </li>
                
                    
                </li>
            </ul>
        </div>
    </aside><!-- main sidebar end -->


</body>
</html>