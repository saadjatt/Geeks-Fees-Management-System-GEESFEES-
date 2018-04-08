<!doctype html>
<!--[if lte IE 9]> <html class="lte-ie9" lang="en"> <![endif]-->
<!--[if gt IE 9]><!--> <html lang="en"> <!--<![endif]-->


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Remove Tap Highlight on Windows Phone IE -->
    <meta name="msapplication-tap-highlight" content="no"/>

    <link rel="icon" type="image/png" href="assets/img/favicon-16x16.png" sizes="16x16">
    <link rel="icon" type="image/png" href="assets/img/favicon-32x32.png" sizes="32x32">

    <title>Geeks -Fee Management System</title>

    <link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500' rel='stylesheet' type='text/css'>

    <!-- uikit -->
    <link rel="stylesheet" href="bower_components/uikit/css/uikit.almost-flat.min.css"/>

    <!-- altair admin login page -->
    <link rel="stylesheet" href="assets/css/login_page.min.css" />

</head>
<%

if(session.getAttribute("user")!=null){

	response.sendRedirect("dashboard.jsp");
}

%>
<%
                    String err="hidden";
					String errorStatement="";
					String color="";
                    if (request.getParameter("login")!=null){
                    	
                    	String login= request.getParameter("login");
                    	if (login.equals("success")){
                    		session.setAttribute( "user", "admin" );
                    		response.sendRedirect("login.jsp");
                    		
                    	}
                    	else if (login.equals("failed")){
                    		color="red";
                    		err= "visible";
                    		errorStatement="Incorrect Password";
                    	}
                    	else if (login.equals("sessionDestroy")){
                    		color="orange";
                    		err= "visible";
                    		errorStatement="Session Destroyed Again Login";
                    	}
                    	
                    	
                    	
                    }
                    
                    %>
<body class="login_page login_page_v2">

    <div class="uk-container uk-container-center">
        <div class="md-card">
            <div class="md-card-content padding-reset">
                <div class="uk-grid uk-grid-collapse">
                    <div class="uk-width-large-2-3 uk-hidden-medium uk-hidden-small">
                        <div class="login_page_info uk-height-1-1" style="background-image: url('assets/img/bck3.jpg')">
                            <div class="info_content">
                                 <label style="text-decoration: none;color:black;font-size:40px;font-weight: bold;">Fees</label>
            <label   style="text-decoration: underline;font-size:40px;color:#59c4e6;font-weight: bold;"> Geeks</label>
                               
                                <p>
                                Welcome to FeesGeeks. <br>
                                (Fees Management System), By Saad_Jatt     
                                </p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="uk-width-large-1-3 uk-width-medium-2-3 uk-container-center">
                        <div class="login_page_forms">
                            <div id="login_card">
                                <div id="login_form">
                                    <div class="login_heading">
                                        <div class="user_avatar"></div>
                                    </div>
                                    <form method="post" action="LoginServlet">
                                        <div class="uk-form-row">
                                            <label for="login_username">Username</label>
                                            <input class="md-input" type="text" id="login_username" name="user" />
                                        </div>
                                        <div class="uk-form-row">
                                            <label for="login_password">Password</label>
                                            <input class="md-input" type="password" id="login_password" name="pass" />
                                        </div>
                                        <div class="uk-margin-medium-top">
                                       <input class="md-btn md-btn-primary md-btn-block md-btn-large" type="submit" id="sbt" name="sbt" value="Sign In"/>
                                        
                                            
                                        </div>
                                        
                                        <div class="uk-margin-top">
                                            <a href="#" id="login_help_show" class="uk-float-right">Forget Password?</a>
                                            <span class="icheck-inline">
                                               
                                            </span>
                                        </div>
                                    </form>
                                    <div >
                    <h3 style="color:<%=color %>; border:2px <%=color %> solid; visibility:<%=err %>"><%=errorStatement %></h3>
                    
                                </div>
                                <div class="uk-position-relative" id="login_help" style="display: none">
                                    <button type="button" class="uk-position-top-right uk-close uk-margin-right back_to_login"></button>
                                    <h2 class="heading_b uk-text-success">Can't log in?</h2>
                                    <p>Here’s the info to get you back in to your account as quickly as possible.</p>
                                    <p>First, try the easiest thing: if you remember your password but it isn’t working, make sure that Caps Lock is turned off, and that your username is spelled correctly, and then try again.</p>
                                    <p>If your password still isn’t working, it’s time to <a href="#" id="password_reset_show">reset your password</a>.</p>
                                </div>
                                <div id="login_password_reset" style="display: none">
                                    <button type="button" class="uk-position-top-right uk-close uk-margin-right back_to_login"></button>
                                    <h2 class="heading_a uk-margin-large-bottom">Reset password</h2>
                                    <form>
                                        <div class="uk-form-row">
                                            <label for="login_email_reset">Your email address</label>
                                            <input class="md-input" type="text" id="login_email_reset" name="login_email_reset" />
                                        </div>
                                        <div class="uk-margin-medium-top">
                                            <a href="index.html" class="md-btn md-btn-primary md-btn-block">Reset password</a>
                                        </div>
                                    </form>
                                </div>
                                <div id="register_form" style="display: none">
                                    <button type="button" class="uk-position-top-right uk-close uk-margin-right back_to_login"></button>
                                    <h2 class="heading_a uk-margin-medium-bottom">Create an account</h2>
                                    <form>
                                        <div class="uk-form-row">
                                            <label for="register_username">Username</label>
                                            <input class="md-input" type="text" id="register_username" name="register_username" />
                                        </div>
                                        <div class="uk-form-row">
                                            <label for="register_password">Password</label>
                                            <input class="md-input" type="password" id="register_password" name="register_password" />
                                        </div>
                                        <div class="uk-form-row">
                                            <label for="register_password_repeat">Repeat Password</label>
                                            <input class="md-input" type="password" id="register_password_repeat" name="register_password_repeat" />
                                        </div>
                                        <div class="uk-form-row">
                                            <label for="register_email">E-mail</label>
                                            <input class="md-input" type="text" id="register_email" name="register_email" />
                                        </div>
                                        <div class="uk-margin-medium-top">
                                            <a href="index.html" class="md-btn md-btn-primary md-btn-block md-btn-large">Sign Up</a>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="uk-margin-top uk-text-center">
                               <!--  <a href="#" id="signup_form_show">Create an account</a> -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- common functions -->
    <script src="assets/js/common.min.js"></script>
    <!-- uikit functions -->
    <script src="assets/js/uikit_custom.min.js"></script>
    <!-- altair core functions -->
    <script src="assets/js/altair_admin_common.min.js"></script>

    <!-- altair login page functions -->
    <script src="assets/js/pages/login.min.js"></script>

    <script>
        // check for theme
        if (typeof(Storage) !== "undefined") {
            var root = document.getElementsByTagName( 'html' )[0],
                theme = localStorage.getItem("altair_theme");
            if(theme == 'app_theme_dark' || root.classList.contains('app_theme_dark')) {
                root.className += ' app_theme_dark';
            }
        }
    </script>

</body>

<!-- Mirrored from altair_html.tzdthemes.com/login_v2.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 05 Mar 2018 21:42:51 GMT -->
</html>