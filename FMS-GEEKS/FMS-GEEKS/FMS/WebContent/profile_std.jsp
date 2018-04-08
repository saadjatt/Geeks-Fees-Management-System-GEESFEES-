<!doctype html>
<!--[if lte IE 9]> <html class="lte-ie9" lang="en"> <![endif]-->
<!--[if gt IE 9]><!--> <%@page import="fms.model.FeesBean"%>
<%@page import="fms.daoimpl.FeesDAOImpl"%>
<%@page import="fms.dao.FeesDAO"%>
<%@page import="fms.daoimpl.BatchDAOImpl"%>
<%@page import="fms.dao.BatchDAO"%>
<%@page import="fms.model.StudentsBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="fms.daoimpl.StudentsDAOImpl"%>
<%@page import="fms.dao.StudentsDAO"%>
<html lang="en"> <!--<![endif]-->



<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Remove Tap Highlight on Windows Phone IE -->
    <meta name="msapplication-tap-highlight" content="no"/>

    <link rel="icon" type="image/png" href="assets/img/favicon-16x16.png" sizes="16x16">
    <link rel="icon" type="image/png" href="assets/img/favicon-32x32.png" sizes="32x32">

    <title>Insert Batches -Geeks</title>

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



    <!-- main header -->
    <jsp:include page="include/header.jsp" />
    <!-- main header ended-->
   
     <!-- main sidebar -->
    <jsp:include page="include/sidenav.jsp" />
     <!-- main sidebar ended-->
    
    
    
    
    <%     
    int studentid=0;
    if(request.getParameter("std_id") !=null){
	studentid =Integer.parseInt(request.getParameter("std_id"));
    } 
StudentsDAO f = new StudentsDAOImpl();
BatchDAO b = new BatchDAOImpl();
ArrayList<StudentsBean> list = new ArrayList <StudentsBean>();
list = f.getStudentData(studentid);
String name="",institude="",dept="",batchname="",addmision="",contact="",email="",surname="",fee="";

int std_id=0,batchid=0;
for (StudentsBean flist : list){
	 name = flist.getName();
	 institude =flist.getInstitude();
	 dept =flist.getDepartment();
	 batchname=flist.getBatch_name();
	 addmision=flist.getAdmissiondate();
	 contact=flist.getContact();
	 email=flist.getEmail();
	 surname=flist.getSurname();
	 std_id= flist.getId();
	 fee= f.getBatchFees(flist.getBatch_id());
	 
	 
	 
} %>
   
    
    
    
    
   
   <div id="page_content">
        <div id="page_content_inner">

          

             <div class="uk-grid" data-uk-grid-margin data-uk-grid-match id="user_profile">
                <div class="uk-width-large-7-12">
                    
                    <div class="md-card">
                        <div class="user_heading">
                            <div class="user_heading_menu hidden-print">
                                <div class="uk-display-inline-block" data-uk-dropdown="{pos:'left-top'}">
                                    <i class="md-icon material-icons md-icon-light">&#xE5D4;</i>
                                    <div class="uk-dropdown uk-dropdown-small">
                                        <ul class="uk-nav">
                                            <li><a href="#">Delete</a></li>
                                           
                                        </ul>
                                    </div>
                                </div>
                                <div class="uk-display-inline-block"><i class="md-icon md-icon-light material-icons" id="page_print">&#xE8ad;</i></div>
                            </div>
                            <div class="user_heading_avatar">
                                <div class="thumbnail">
                                    <img src="assets/img/blank.png" alt="user avatar"/>
                                </div>
                            </div>

                            <div class="user_heading_content">
                                <h2 class="heading_b uk-margin-bottom"><span class="uk-text-truncate"><%=name %></span><span class="sub-heading"><%=institude%></span></h2>
                               
                            </div>
                            
                            <a class="md-fab md-fab-small md-fab-accent hidden-print" href="edit_students.jsp?std_id=<%=std_id %>">
                                <i class="material-icons">&#xE150;</i>
                                

                            </a>


                        </div>
                        
                        <div class="user_content">
                            <ul id="user_profile_tabs" class="uk-tab" data-uk-tab="{connect:'#user_profile_tabs_content', animation:'slide-horizontal'}" data-uk-sticky="{ top: 48, media: 960 }">
                                <li class="uk-active"><a href="#">About Student</a></li>
                                
                            </ul>
                            <ul id="user_profile_tabs_content" class="uk-switcher uk-margin">
                                <li><u><b><%=name+" "+surname %></b></u> from <u><b><%=institude%></b></u> in <u><b> <%=dept%></b></u> department and get addmission in Geeks Academy in <u> <b> <%=addmision %></b> </u>              

                                    <div class="uk-grid uk-margin-medium-top uk-margin-large-bottom" data-uk-grid-margin>
                                        <div class="uk-width-large-1-2">
                                            <h4 class="heading_c uk-margin-small-bottom">Student Info</h4>
                                            <ul class="md-list md-list-addon">
                                                <li>
                                                    <div class="md-list-addon-element">
                                                        <i class="md-list-addon-icon material-icons">&#xE158;</i>
                                                    </div>
                                        <div class="md-list-content">
        <span class="md-list-heading"><%=email %></span>
                                                        <span class="uk-text-small uk-text-muted">Email</span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="md-list-addon-element">
                                                        <i class="md-list-addon-icon material-icons">&#xE0CD;</i>
                                                    </div>
                                                    <div class="md-list-content">
                                                        <span class="md-list-heading"><%=contact %></span>
                                                        <span class="uk-text-small uk-text-muted">Phone</span>
                                                    </div>
                                               
                                            </ul>
                                        </div>
                                        <div class="uk-width-large-1-2">
                                            <h4 class="heading_c uk-margin-small-bottom">Batch</h4>
                                            <ul class="md-list">
                                                <li>
                                                    <div class="md-list-content">
                                                        <span class="md-list-heading"><%=batchname %></span>
                                                       
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="md-list-content">
                                                        <span class="md-list-heading">FEES (per Month)</span>
                                                        <span class="uk-text-small uk-text-muted">Rs <%=fee %></span>
                                                    </div>
                                                </li>
                                                
                                                
                                            </ul>
                                        </div>
                                    </div>
                                    
                                
                            </ul>
                        </div>
                         
                      <center>  <h3>Geeks Report</h3></center>
                        <hr class="uk-grid-divider"> 
                        
                    <div class="uk-grid" data-uk-grid-margin>
                        <div class="uk-width-medium-1-3">
                         
                        </div>
                        <div class="uk-width-medium-1-2">
                            <ul class="md-list md-list-addon md-list-right">
                            
                            <%
                            int sr=0;
                              String dateofsubmission="",nextmonthdate="",status="",sumitteddate="" ,color="",icon="",statement="";
                              FeesDAO fs = new FeesDAOImpl();
                              ArrayList<FeesBean> fslist = new ArrayList<FeesBean>();
                              fslist= fs.studentRecord(studentid);
                              for (FeesBean fbeen :fslist ){
                            	  dateofsubmission= fbeen.getDateforsubmission();
                            	  nextmonthdate= fbeen.getSubmitteddate();
                            	  sumitteddate=fbeen.getBatchname();
                            	  status = fbeen.getStatus();
                            	  if (status.equals("pending")){
                            		  color="danger";
                            		  icon="&#xE14C;";
                            		  statement="Does not fees paid yet";
                            	  }
                            	  else{
                            		  color="success";
                            		  icon="&#xE876;";
                            		  statement="Fees paid on "+sumitteddate;
                            		  
                            	  }
                            	  sr++;
                            	
                            	  %>
                                <li>
                                    <a href="#" class="md-list-addon-element"><i class="md-list-addon-icon material-icons uk-text-<%=color %>"><%=icon %></i></a>
                                    
                                    <div class="md-list-content">
                                       
                           <span class="md-list-heading"><b>Month<%=sr%>:</b>  <%=dateofsubmission %> TO  <%=nextmonthdate%> </span>
                                        <span class="uk-text-small uk-text-muted"><%=statement %></span>
                                    </div>
                                </li>
                              
                              
                              
                             <% }%>
                            </ul>
                        </div>
                    </div>
                    </div>
                    
                </div>
                
            </div>
            
             
                   </div>
    </div>
    <!-- secondary sidebar -->
   
    <!-- secondary sidebar end -->

    <!-- google web fonts -->
   

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