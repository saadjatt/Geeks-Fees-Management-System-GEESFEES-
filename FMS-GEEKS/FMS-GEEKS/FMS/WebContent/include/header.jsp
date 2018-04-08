<%@page import="fms.model.FeesBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="fms.daoimpl.FeesDAOImpl"%>
<%@page import="fms.dao.FeesDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String user="";
if(session.getAttribute("user")!=null){
	user=(String)session.getAttribute( "user" );
}
else if(user.equals("")){
	response.sendRedirect("login.jsp?login=sessionDestroy");
}

%>
 <header id="header_main">
        <div class="header_main_content">
            <nav class="uk-navbar">
                                
                <!-- main sidebar switch -->
                <a href="#" id="sidebar_main_toggle" class="sSwitch sSwitch_left">
                    <span class="sSwitchIcon"></span>
                </a>
                
                <!-- secondary sidebar switch -->
                <a href="#" id="sidebar_secondary_toggle" class="sSwitch sSwitch_right sidebar_secondary_check">
                    <span class="sSwitchIcon"></span>
                </a>
                
               <% 
                FeesDAO fd = new FeesDAOImpl();
                
                %>
                
                <div class="uk-navbar-flip">
                    <ul class="uk-navbar-nav user_actions">
                        <li><a href="" id="full_screen_toggle" class="user_action_icon uk-visible-large"><i class="material-icons md-24 md-light">&#xE5D0;</i></a></li>
                       
                        <li data-uk-dropdown="{mode:'click',pos:'bottom-right'}">
                            <a href="#" class="user_action_icon"><i class="material-icons md-24 md-light">&#xE7F4;</i><span class="uk-badge">  <%= fd.getFeesAlertCount() %></span></a>
                            <div class="uk-dropdown uk-dropdown-xlarge">
                                <div class="md-card-content">
                                    <ul class="uk-tab uk-tab-grid" data-uk-tab="{connect:'#header_alerts',animation:'slide-horizontal'}">
                                       
                                        <li class="uk-width-1-1 uk-active"><a href="#" class="js-uk-prevent uk-text-small">Fees Alerts</a></li>
                                    </ul>
                                    <ul id="header_alerts" class="uk-switcher uk-margin">
                                     <li>
                                            <ul class="md-list md-list-addon">
                                            <%
 	FeesDAO ff = new FeesDAOImpl();
  ArrayList<FeesBean> feelist = new ArrayList <FeesBean>();
  	feelist = ff.getFeesAlertNotSubmittedYet();
  	for (FeesBean fflist : feelist){
 %>
  
											<li>
                                                    <div class="md-list-addon-element">
                                                        <i class="md-list-addon-icon material-icons uk-text-danger">&#xE8B2;</i>
                                                    </div>
                                                    <div class="md-list-content">
                                                        <span class="md-list-heading"><%=fflist.getStudentname() %> -- <%=fflist.getBatchname() %></span>
                                                        <span class="uk-text-small uk-text-muted uk-text-truncate">Rs. <%=fflist.getFees() %></span>
                                                    </div>
                                                </li>                        
                            
                            
                            <%}%>
                                       <%
                                       	FeesDAO f = new FeesDAOImpl();
                                        ArrayList<FeesBean> list = new ArrayList <FeesBean>();
                                        	list = f.getFeesAlertOneDayBefore();
                                        	for (FeesBean flist : list){
                                       %>
												<li>
                                                    <div class="md-list-addon-element">
                                                        <i class="md-list-addon-icon material-icons uk-text-warning">&#xE8B2;</i>
                                                    </div>
                                                    <div class="md-list-content">
                                                        <span class="md-list-heading"><%=flist.getStudentname() %> -- <%=flist.getBatchname() %></span>
                                                        <span class="uk-text-small uk-text-muted uk-text-truncate">Rs. <%=flist.getFees() %></span>
                                                    </div>
                                                </li>
                            
                            <%} %>
                                       
                                                
                                                   </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li data-uk-dropdown="{mode:'click',pos:'bottom-right'}">
                            <a href="#" class="user_action_image"><img class="md-user-image" src="assets/img/avatars/user.png" alt=""/><%=user.toUpperCase() %></a>
                            <div class="uk-dropdown uk-dropdown-small">
                                <ul class="uk-nav js-uk-prevent">
                                    <li><a href="settings.jsp">Settings</a></li>
                                    <li><a href="logout.jsp">Logout</a></li>
                                
                                </ul>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
       
    </header><!-- main header end -->

</body>
</html>