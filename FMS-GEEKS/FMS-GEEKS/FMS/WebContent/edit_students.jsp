<!doctype html>
<!--[if lte IE 9]> <html class="lte-ie9" lang="en"> <![endif]-->
<!--[if gt IE 9]><!--> <%@page import="fms.daoimpl.StudentsDAOImpl"%>
<%@page import="fms.dao.StudentsDAO"%>
<%@page import="fms.model.StudentsBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="fms.model.BatchBean"%>
<%@page import="fms.daoimpl.BatchDAOImpl"%>
<%@page import="fms.dao.BatchDAO"%>
<html lang="en"> <!--<![endif]-->



<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Remove Tap Highlight on Windows Phone IE -->
    <meta name="msapplication-tap-highlight" content="no"/>

    <link rel="icon" type="image/png" href="assets/img/favicon-16x16.png" sizes="16x16">
    <link rel="icon" type="image/png" href="assets/img/favicon-32x32.png" sizes="32x32">

    <title>Edit Student -Geeks</title>

 <link rel="stylesheet" href="assets/skins/dropify/css/dropify.css">
    <!-- additional styles for plugins -->
        <!-- weather icons -->
        <link rel="stylesheet" href="bower_components/weather-icons/css/weather-icons.min.css" media="all">
        <!-- metrics graphics (charts) -->
        <link rel="stylesheet" href="bower_components/metrics-graphics/dist/metricsgraphics.css">
        <!-- chartist -->
        <link rel="stylesheet" href="bower_components/chartist/dist/chartist.min.css">
    
    <!-- uikit -->
    <link rel="stylesheet" href="bower_components/uikit/css/uikit.almost-flat.min.css" media="all">

    <!-- flag icons -->
    <link rel="stylesheet" href="assets/icons/flags/flags.min.css" media="all">

    <!-- style switcher -->
    <link rel="stylesheet" href="assets/css/style_switcher.min.css" media="all">
    
    <!-- altair admin -->
    <link rel="stylesheet" href="assets/css/main.min.css" media="all">

    <!-- themes -->
    <link rel="stylesheet" href="assets/css/themes/themes_combined.min.css" media="all">

    <!-- matchMedia polyfill for testing media queries in JS -->
    <!--[if lte IE 9]>
        <script type="text/javascript" src="bower_components/matchMedia/matchMedia.js"></script>
        <script type="text/javascript" src="bower_components/matchMedia/matchMedia.addListener.js"></script>
        <link rel="stylesheet" href="assets/css/ie.css" media="all">
    <![endif]-->

</head>
<body class="disable_transitions sidebar_main_open sidebar_main_swipe">

<%

String name="",surname="",batch="" ,email="",phone="",university="",dept="",fees=""; 
String deptArray[]={"Software Engineering","Computer System Engineering","Information Technology","Telecom Engineering","Others"};    		
String inititudeArray[]={"Mehran University","Sindh University","SZABIST Institude","Others"};
String feesArray[]={"2500","2700","3000","3300","3500"};


int batch_id=0;    	
int stdid=0;
if (request.getParameter("std_id")!=null){
	 stdid =Integer.parseInt( request.getParameter("std_id"));
	ArrayList<StudentsBean> slist = new ArrayList<StudentsBean>();
	StudentsDAO sd = new StudentsDAOImpl();
	slist=sd.getStudentData(stdid);
	
	for (StudentsBean s: slist){
		name= s.getName();
		surname=s.getSurname();
		batch =s.getBatch_name();
		email = s.getEmail();
		phone = s.getContact();
		university= s.getInstitude();
		dept = s.getDepartment();
		fees= sd.getBatchFees(s.getBatch_id());
		batch_id=s.getBatch_id();
	}
}
%>

    <!-- main header -->
    <jsp:include page="include/header.jsp" />
    <!-- main header ended-->
   
     <!-- main sidebar -->
    <jsp:include page="include/sidenav.jsp" />
     <!-- main sidebar ended-->
    
    
    
    
    
    
    <div id="page_content">
        <div id="page_content_inner">
            <form action="StudentsServlet" class="uk-form-stacked" id="user_edit_form"        method="get">
                <div class="uk-grid" data-uk-grid-margin>
                    <div class="uk-width-large-10-10">
                        <div class="md-card">
                            <div class="user_heading" data-uk-sticky="{ top: 48, media: 960 }">
                                <div class="user_heading_avatar fileinput fileinput-new" data-provides="fileinput">
                                    <div class="fileinput-new thumbnail">
                                        <img src="assets/img/blank.png" alt="user avatar"/>
                                    </div>
                                    <div class="fileinput-preview fileinput-exists thumbnail"></div>
                                    <div class="user_avatar_controls">
                                        <span class="btn-file">
                                            <span class="fileinput-new"><i class="material-icons">&#xE2C6;</i></span>
                                            <span class="fileinput-exists"><i class="material-icons">&#xE86A;</i></span>
                                            <input type="file"  id="user_edit_avatar_control">
                                        </span>
                                        <a href="#" class="btn-file fileinput-exists" data-dismiss="fileinput"><i class="material-icons">&#xE5CD;</i></a>
                                    </div>
                                </div>
                                <div class="user_heading_content">
                                    <h2 class="heading_b"><span class="uk-text-truncate" id="user_edit_uname"><%=name %></span><span class="sub-heading" id="user_edit_position"><%=surname %></span></h2>
                                </div>
                                <div class="md-fab-wrapper">
                                 <div class="uk-width-1-1">
                                <button type="submit" class="md-btn md-btn-success md-btn-block md-btn-wave-light waves-effect waves-button waves-light">Edit</button>
                            </div>
                                </div>
                            </div>
                            <div class="user_content">
                                <ul id="user_edit_tabs" class="uk-tab" data-uk-tab="{connect:'#user_edit_tabs_content'}">
                                    <h3 class="uk-active">Edit Student</h3>
                                    
                                </ul>
                                <ul id="user_edit_tabs_content" class="uk-switcher uk-margin">
                                    <li>
                                        <div class="uk-margin-top">
                                    
                                            <div class="uk-grid" data-uk-grid-margin>
                                                <div class="uk-width-medium-1-2">
                                                    <label for="user_edit_uname_control">Name</label>
                                                    <input class="md-input" type="text" id="user_edit_uname_control" name="stdname" value="<%=name %>" />
                                                </div>
                                                <div class="uk-width-medium-1-2">
                                                    <label for="user_edit_position_control">Surname</label>
                                                    <input class="md-input" type="text" id="user_edit_position_control" name="surname" value="<%=surname %>" />
                                                </div>
                                            </div>
                                            
                                            <div class="uk-grid" data-uk-grid-margin>
                                                <div class="uk-width-medium-1-2">
                                                    <label for="user_edit_uname_control">Institude</label>
                                                   <select class="md-input" name="institude">
                                                   <option value="<%=university %>"><%=university %></option>
                                                             <%
                                                  for (int i=0; i< inititudeArray.length ; i++ ){
                                                	  if (inititudeArray[i].equals(university)){
                                                		  continue;
                                                	  }
                                        
                                                  %>
                                        <option value="<%=inititudeArray[i] %>"><%=inititudeArray[i] %></option>
                                     <%}%>
                                                   </select>
                                                </div>
                                                <div class="uk-width-medium-1-2">
                                                    <label for="user_edit_uname_control">Department</label>
                                                   <select class="md-input" name="dept">
                                                  <option value="<%=dept %>"><%=dept %></option>
                                                  <%
                                                  for (int i=0; i< deptArray.length ; i++ ){
                                                	  if (deptArray[i].equals(dept)){
                                                		  continue;
                                                	  }
                                        
                                                  %>
                                        <option value="<%=deptArray[i] %>"><%=deptArray[i] %></option>
                                     <%}%>
                                                   </select>
                                                </div>
                                            </div>
                                            
                                            <div class="uk-grid" data-uk-grid-margin>
                                                <div class="uk-width-medium-1-2">
                                                    <label for="user_edit_uname_control">Email</label>
                                                    <input class="md-input" type="text" id="user_edit_uname_control" name="email" value="<%=email %>" />
                                                </div>
                                                <div class="uk-width-medium-1-2">
                                                    <label for="user_edit_position_control">Phone</label>
                                                    <input class="md-input" type="text" id="user_edit_position_control" name="phone" value="<%=phone %>" />
                                                </div>
                                            </div>
                                            
                                            
                                           
                                          <div class="uk-grid" data-uk-grid-margin>
                                                <div class="uk-width-medium-1-2">
                                                    <label for="user_edit_uname_control">Batch</label>
                                                       <select class="md-input" name="batch">
            											<option value="<%=batch_id%>"><%=batch%></option>                                                                 
                                                                <%
                                                                
      BatchDAO st = new BatchDAOImpl();
 ArrayList<BatchBean> list = new ArrayList <BatchBean>();
 	list = st.viewAllBatch();
 	for (BatchBean b : list){
 		if (b.getName().equals(batch)){
 			
 			continue;
 		}
				%>
                                        <option value="<%=b.getId()%>"><%=b.getName() %></option>
                                         <%}  %>
                                                
                             
                                                   </select>
                                                </div>
                                                <div class="uk-width-medium-1-2">
                                                    <label for="user_edit_uname_control">Fees (Rs)</label>
                                                   <select class="md-input" name="fees">
                                                   
                                                   <option <%=fees %>><%=fees %></option>
                                                           
                                                  <%
                                                  for (int i=0; i< feesArray.length ; i++ ){
                                                	  if (feesArray[i].equals(fees)){
                                                		  continue;
                                                	  }
                                        
                                                  %>
                                        <option value="<%=feesArray[i] %>"><%=feesArray[i] %></option>
                                     <%}%>
                                                   
                                                   </select>
                                                </div>
                                                <input type="text"  name="stdid" value="<%=stdid %>" style="visibility:hidden"> 
                                            </div>
                                     
                                                    </div>
                                    </li>
                                    
                                    
                                </ul>
                            </div>
                        </div>
                    </div>
                    
                </div>

            </form>

        </div>
    </div>
    
    
    
   
   
   

    <!-- common functions -->
    <script src="assets/js/common.min.js"></script>
    <!-- uikit functions -->
    <script src="assets/js/uikit_custom.min.js"></script>
    <!-- altair common functions/helpers -->
    <script src="assets/js/altair_admin_common.min.js"></script>

    <!-- page specific plugins -->
        <!-- d3 -->
        <script src="bower_components/d3/d3.min.js"></script>
        <!-- metrics graphics (charts) -->
        <script src="bower_components/metrics-graphics/dist/metricsgraphics.min.js"></script>
        <!-- chartist (charts) -->
        <script src="bower_components/chartist/dist/chartist.min.js"></script>
        <!-- maplace (google maps) -->
        <script src="http://maps.google.com/maps/api/js"></script>
        <script src="bower_components/maplace-js/dist/maplace.min.js"></script>
        <!-- peity (small charts) -->
        <script src="bower_components/peity/jquery.peity.min.js"></script>
        <!-- easy-pie-chart (circular statistics) -->
        <script src="bower_components/jquery.easy-pie-chart/dist/jquery.easypiechart.min.js"></script>
        <!-- countUp -->
        <script src="bower_components/countUp.js/dist/countUp.min.js"></script>
        <!-- handlebars.js -->
        <script src="bower_components/handlebars/handlebars.min.js"></script>
        <script src="assets/js/custom/handlebars_helpers.min.js"></script>
        <!-- CLNDR -->
        <script src="bower_components/clndr/clndr.min.js"></script>

        <!--  dashbord functions -->
        <script src="assets/js/pages/dashboard.min.js"></script>
         <script src="bower_components/parsleyjs/dist/parsley.min.js"></script>

    <!--  forms validation functions -->
    <script src="assets/js/pages/forms_validation.min.js"></script>
     <script src="assets/js/common.min.js"></script>
    <!-- uikit functions -->
    <script src="assets/js/uikit_custom.min.js"></script>
    <!-- altair common functions/helpers -->
    <script src="assets/js/altair_admin_common.min.js"></script>
     <script src="bower_components/dropify/dist/js/dropify.min.js"></script>

    <!--  form file input functions -->
    <script src="assets/js/pages/forms_file_input.min.js"></script>
    
    <script>
        $(function() {
            if(isHighDensity()) {
                $.getScript( "assets/js/custom/dense.min.js", function(data) {
                    // enable hires images
                    altair_helpers.retina_images();
                });
            }
            if(Modernizr.touch) {
                // fastClick (touch devices)
                FastClick.attach(document.body);
            }
        });
        $window.load(function() {
            // ie fixes
            altair_helpers.ie_fix();
        });
    </script>

    <script>
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
            m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','../www.google-analytics.com/analytics.js','ga');
        ga('create', 'UA-65191727-1', 'auto');
        ga('send', 'pageview');
    </script>

   

    <script>
        $(function() {
            var $switcher = $('#style_switcher'),
                $switcher_toggle = $('#style_switcher_toggle'),
                $theme_switcher = $('#theme_switcher'),
                $mini_sidebar_toggle = $('#style_sidebar_mini'),
                $slim_sidebar_toggle = $('#style_sidebar_slim'),
                $boxed_layout_toggle = $('#style_layout_boxed'),
                $accordion_mode_toggle = $('#accordion_mode_main_menu'),
                $html = $('html'),
                $body = $('body');


            $switcher_toggle.click(function(e) {
                e.preventDefault();
                $switcher.toggleClass('switcher_active');
            });

            $theme_switcher.children('li').click(function(e) {
                e.preventDefault();
                var $this = $(this),
                    this_theme = $this.attr('data-app-theme');

                $theme_switcher.children('li').removeClass('active_theme');
                $(this).addClass('active_theme');
                $html
                    .removeClass('app_theme_a app_theme_b app_theme_c app_theme_d app_theme_e app_theme_f app_theme_g app_theme_h app_theme_i app_theme_dark')
                    .addClass(this_theme);

                if(this_theme == '') {
                    localStorage.removeItem('altair_theme');
                    $('#kendoCSS').attr('href','bower_components/kendo-ui/styles/kendo.material.min.css');
                } else {
                    localStorage.setItem("altair_theme", this_theme);
                    if(this_theme == 'app_theme_dark') {
                        $('#kendoCSS').attr('href','bower_components/kendo-ui/styles/kendo.materialblack.min.css')
                    } else {
                        $('#kendoCSS').attr('href','bower_components/kendo-ui/styles/kendo.material.min.css');
                    }
                }

            });

            // hide style switcher
            $document.on('click keyup', function(e) {
                if( $switcher.hasClass('switcher_active') ) {
                    if (
                        ( !$(e.target).closest($switcher).length )
                        || ( e.keyCode == 27 )
                    ) {
                        $switcher.removeClass('switcher_active');
                    }
                }
            });

            // get theme from local storage
            if(localStorage.getItem("altair_theme") !== null) {
                $theme_switcher.children('li[data-app-theme='+localStorage.getItem("altair_theme")+']').click();
            }


        // toggle mini sidebar

            // change input's state to checked if mini sidebar is active
            if((localStorage.getItem("altair_sidebar_mini") !== null && localStorage.getItem("altair_sidebar_mini") == '1') || $body.hasClass('sidebar_mini')) {
                $mini_sidebar_toggle.iCheck('check');
            }

            $mini_sidebar_toggle
                .on('ifChecked', function(event){
                    $switcher.removeClass('switcher_active');
                    localStorage.setItem("altair_sidebar_mini", '1');
                    localStorage.removeItem('altair_sidebar_slim');
                    location.reload(true);
                })
                .on('ifUnchecked', function(event){
                    $switcher.removeClass('switcher_active');
                    localStorage.removeItem('altair_sidebar_mini');
                    location.reload(true);
                });

        // toggle slim sidebar

            // change input's state to checked if mini sidebar is active
            if((localStorage.getItem("altair_sidebar_slim") !== null && localStorage.getItem("altair_sidebar_slim") == '1') || $body.hasClass('sidebar_slim')) {
                $slim_sidebar_toggle.iCheck('check');
            }

            $slim_sidebar_toggle
                .on('ifChecked', function(event){
                    $switcher.removeClass('switcher_active');
                    localStorage.setItem("altair_sidebar_slim", '1');
                    localStorage.removeItem('altair_sidebar_mini');
                    location.reload(true);
                })
                .on('ifUnchecked', function(event){
                    $switcher.removeClass('switcher_active');
                    localStorage.removeItem('altair_sidebar_slim');
                    location.reload(true);
                });

        // toggle boxed layout

            if((localStorage.getItem("altair_layout") !== null && localStorage.getItem("altair_layout") == 'boxed') || $body.hasClass('boxed_layout')) {
                $boxed_layout_toggle.iCheck('check');
                $body.addClass('boxed_layout');
                $(window).resize();
            }

            $boxed_layout_toggle
                .on('ifChecked', function(event){
                    $switcher.removeClass('switcher_active');
                    localStorage.setItem("altair_layout", 'boxed');
                    location.reload(true);
                })
                .on('ifUnchecked', function(event){
                    $switcher.removeClass('switcher_active');
                    localStorage.removeItem('altair_layout');
                    location.reload(true);
                });

        // main menu accordion mode
            if($sidebar_main.hasClass('accordion_mode')) {
                $accordion_mode_toggle.iCheck('check');
            }

            $accordion_mode_toggle
                .on('ifChecked', function(){
                    $sidebar_main.addClass('accordion_mode');
                })
                .on('ifUnchecked', function(){
                    $sidebar_main.removeClass('accordion_mode');
                });


        });
    </script>
</body>


</html>