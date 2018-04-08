<!doctype html>
<!--[if lte IE 9]> <html class="lte-ie9" lang="en"> <![endif]-->
<!--[if gt IE 9]><!--> <%@page import="fms.model.FeesBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="fms.daoimpl.StudentsDAOImpl"%>
<%@page import="fms.dao.StudentsDAO"%>
<%@page import="fms.daoimpl.BatchDAOImpl"%>
<%@page import="fms.dao.BatchDAO"%>
<%@page import="fms.daoimpl.FeesDAOImpl"%>
<%@page import="fms.dao.FeesDAO"%>
<html lang="en"> <!--<![endif]-->



<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Remove Tap Highlight on Windows Phone IE -->
    <meta name="msapplication-tap-highlight" content="no"/>

    <link rel="icon" type="image/png" href="assets/img/favicon-16x16.png" sizes="16x16">
    <link rel="icon" type="image/png" href="assets/img/favicon-32x32.png" sizes="32x32">

    <title>Dashboard -Geeks</title>

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
<%
String user="";
if(session.getAttribute("user")!=null){
	user=(String)session.getAttribute( "user" );
}
else {
	response.sendRedirect("login.jsp?login=sessionDestroy");
}

%>


<% 

FeesDAOImpl fd = new FeesDAOImpl();
  fd.feeManagement(); 		

%>
<body class="disable_transitions sidebar_main_open sidebar_main_swipe">
    <!-- main header -->
    <jsp:include page="include/header.jsp" />
    <!-- main header ended-->
   
     <!-- main sidebar -->
    <jsp:include page="include/sidenav.jsp" />
     <!-- main sidebar ended-->
   
    <div id="page_content">
        <div id="page_content_inner">

            <!-- statistics (small charts) -->
            <% BatchDAO bd = new BatchDAOImpl();
            	StudentsDAO st = new StudentsDAOImpl();
            	FeesDAO fs = new FeesDAOImpl();
            	
            	int allsubmitstudent= fs.totalSubmitFeesCount();
            	
            	int allStdCurrentMonth = fs.totalAllStudentsCount();
            	int sumSubmitFees=fs.totalSubmitFeesCount();
            	int sumPendingFees = fs.totalPendingFeesCount();
            	int countStudent=st.countRows();
                int countbatch=bd.countRows();
                %>
            <div class="uk-grid uk-grid-width-large-1-4 uk-grid-width-medium-1-2 uk-grid-medium uk-sortable sortable-handler hierarchical_show" data-uk-sortable data-uk-grid-margin>
                <div>
                    <div class="md-card">
                        <div class="md-card-content">
                            <div class="uk-float-right uk-margin-top uk-margin-small-right">  <i class="md-icon material-icons ">&#xE7FB;</i></div>
                            <span class="uk-text-muted uk-text-small">Total Students</span>
                            <h2 class="uk-margin-remove"><span class="countUpMe">0<noscript><%= countStudent %></noscript></span></h2>
                        </div>
                    </div>
                </div>
                <div>
                
                    <div class="md-card">
                        <div class="md-card-content">
                            <div class="uk-float-right uk-margin-top uk-margin-small-right"> <i class="md-icon material-icons ">&#xE1B2;</i></div>
                            <span class="uk-text-muted uk-text-small">Total Batches</span>
                            <h2 class="uk-margin-remove"><span class="countUpMe">0<noscript><%= countbatch %></noscript></span></h2>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="md-card">
                        <div class="md-card-content">
                            <div class="uk-float-right uk-margin-top uk-margin-small-right"><i class="md-icon material-icons" >&#xE7FB;</i><i class="md-icon material-icons ">&#xE877; </i></div>
                            <span class="uk-text-muted uk-text-small">Fees Submitted (Total)</span>
                            <h2 class="uk-margin-remove">RS <span class="countUpMe">0<noscript><%=sumSubmitFees %></noscript></span></h2>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="md-card">
                        <div class="md-card-content">
                            <div class="uk-float-right uk-margin-top uk-margin-small-right"><i class="md-icon material-icons" >&#xE7FB; </i><i class="md-icon material-icons ">&#xE14C;</i></div>
                            <span class="uk-text-muted uk-text-small">Fees Pending (Total)</span>
                            <h2 class="uk-margin-remove">RS <span class="countUpMe">0<noscript><%= sumPendingFees%> </noscript></span></h2>
                        </div>
                    </div>
                </div>
                
                <div class="header_main_search_form">
           
            <form class="uk-form uk-autocomplete" action="view_students.jsp" method="get">
                Search Students<input type="text" name="srch" class="header_main_search_input" />
                <button type="submit" class="header_main_search_btn uk-button-link"><i class="md-icon material-icons">&#xE8B6;</i></button>
               
            </form>
        </div>
        
               <div class="header_main_search_form" >
           
            <form class="uk-form uk-autocomplete" action="batches.jsp" method="get">
                Search Batch<input type="text" name="srch" class="header_main_search_input" />
                <button type="submit" class="header_main_search_btn uk-button-link"><i class="md-icon material-icons">&#xE8B6;</i></button>
               
            </form>
        </div> 
            
            </div>
 <%
 	FeesDAO ff = new FeesDAOImpl();
  ArrayList<FeesBean> feelist = new ArrayList <FeesBean>();
  	feelist = ff.getFeesAlertNotSubmittedYet();
  	for (FeesBean fflist : feelist){
 %>
  
<div class="uk-alert uk-alert-danger" data-uk-alert>
	
                                <a href="#" class="uk-alert-close uk-close"></a>
                                <h4 class="heading_b">Fees Alerts</h4>
                                <a style=" text-decoration:none;color:white " href="view_fees_pending.jsp">
                               
                                <b><%=fflist.getStudentname()%> Not Submiited Their Fees Yet Please Check His Account</b>  
                              	
                                </a>
                            </div>
                            
                            
                            
                            <%}%>            
            
         
 <%
                                  	FeesDAO f = new FeesDAOImpl();
                                   ArrayList<FeesBean> list = new ArrayList <FeesBean>();
                                   	list = f.getFeesAlertOneDayBefore();
                                   	for (FeesBean flist : list){
                                  %>
								<div class="uk-alert uk-alert-warning" data-uk-alert>
                                <a href="#" class="uk-alert-close uk-close"></a>
                                <h4 class="heading_b">Fees Alert</h4>
                                
                                <b><a style=" text-decoration:none;color:white " href="view_fees_pending.jsp">Remainder to  <%=flist.getStudentname() %></a></b> From <%=flist.getBatchname() %> bring their Fees (<%=flist.getFees() %>) on Tommarrow 
                              
                                
                            </div>
                            
                            <%} %>
            <!-- large chart -->
           

            <!-- circular charts -->
           
            <!-- tasks -->
          

            <div class="uk-grid uk-grid-medium" data-uk-grid-margin>
                <div class="uk-width-large-1-2">
                    <div class="md-card">
                        <div id="clndr_events" class="clndr-wrapper">
                            <script data-cfasync="false" src="cdn-cgi/scripts/d07b1474/cloudflare-static/email-decode.min.js"></script><script>
                                // calendar events
                                clndrEvents = [
                                    { date: '2018-01-08', title: 'Doctor appointment', url: 'javascript:void(0)', timeStart: '10:00', timeEnd: '11:00' },
                                    { date: '2018-01-09', title: 'John\'s Birthday', url: 'javascript:void(0)' },
                                    { date: '2018-01-09', title: 'Party', url: 'javascript:void(0)', timeStart: '08:00', timeEnd: '08:30' },
                                    { date: '2018-01-13', title: 'Meeting', url: 'javascript:void(0)', timeStart: '18:00', timeEnd: '18:20' },
                                    { date: '2018-01-18', title: 'Work Out', url: 'javascript:void(0)', timeStart: '07:00', timeEnd: '08:00' },
                                    { date: '2018-01-18', title: 'Business Meeting', url: 'javascript:void(0)', timeStart: '11:10', timeEnd: '11:45' },
                                    { date: '2018-01-23', title: 'Meeting', url: 'javascript:void(0)', timeStart: '20:25', timeEnd: '20:50' },
                                    { date: '2018-01-26', title: 'Haircut', url: 'javascript:void(0)' },
                                    { date: '2018-01-26', title: 'Lunch with Katy', url: 'javascript:void(0)', timeStart: '08:45', timeEnd: '09:45' },
                                    { date: '2018-01-26', title: 'Concept review', url: 'javascript:void(0)', timeStart: '15:00', timeEnd: '16:00' },
                                    { date: '2018-01-27', title: 'Swimming Poll', url: 'javascript:void(0)', timeStart: '13:50', timeEnd: '14:20' },
                                    { date: '2018-01-29', title: 'Team Meeting', url: 'javascript:void(0)', timeStart: '17:25', timeEnd: '18:15' },
                                    { date: '2018-02-02', title: 'Dinner with John', url: 'javascript:void(0)', timeStart: '16:25', timeEnd: '18:45' },
                                    { date: '2018-02-13', title: 'Business Meeting', url: 'javascript:void(0)', timeStart: '10:00', timeEnd: '11:00' }
                                ]
                            </script>
                            <script id="clndr_events_template" type="text/x-handlebars-template">
                                <div class="md-card-toolbar">
                                    <div class="md-card-toolbar-actions">
                                        <i class="md-icon clndr_add_event material-icons">&#xE145;</i>
                                        <i class="md-icon clndr_today material-icons">&#xE8DF;</i>
                                        <i class="md-icon clndr_previous material-icons">&#xE408;</i>
                                        <i class="md-icon clndr_next material-icons uk-margin-remove">&#xE409;</i>
                                    </div>
                                    <h3 class="md-card-toolbar-heading-text">
                                        {{ month }} {{ year }}
                                    </h3>
                                </div>
                                <div class="clndr_days">
                                    <div class="clndr_days_names">
                                        {{#each daysOfTheWeek}}
                                        <div class="day-header">{{ this }}</div>
                                        {{/each}}
                                    </div>
                                    <div class="clndr_days_grid">
                                        {{#each days}}
                                        <div class="{{ this.classes }}" {{#if this.id }} id="{{ this.id }}" {{/if}}>
                                            <span>{{ this.day }}</span>
                                        </div>
                                        {{/each}}
                                    </div>
                                </div>
                                <div class="clndr_events">
                                    <i class="material-icons clndr_events_close_button">&#xE5CD;</i>
                                    {{#each eventsThisMonth}}
                                    <div class="clndr_event" data-clndr-event="{{ dateFormat this.date format='YYYY-MM-DD' }}">
                                        <a href="{{ this.url }}">
                                            <span class="clndr_event_title">{{ this.title }}</span>
                                            <span class="clndr_event_more_info">
                                                {{~dateFormat this.date format='MMM Do'}}
                                                {{~#ifCond this.timeStart '||' this.timeEnd}} ({{/ifCond}}
                                                {{~#if this.timeStart }} {{~this.timeStart~}} {{/if}}
                                                {{~#ifCond this.timeStart '&&' this.timeEnd}} - {{/ifCond}}
                                                {{~#if this.timeEnd }} {{~this.timeEnd~}} {{/if}}
                                                {{~#ifCond this.timeStart '||' this.timeEnd}}){{/ifCond~}}
                                            </span>
                                        </a>
                                    </div>
                                    {{/each}}
                                </div>
                            </script>
                        </div>
                        <div class="uk-modal" id="modal_clndr_new_event">
                            <div class="uk-modal-dialog">
                                <div class="uk-modal-header">
                                    <h3 class="uk-modal-title">New Event</h3>
                                </div>
                                <div class="uk-margin-bottom">
                                    <label for="clndr_event_title_control">Event Title</label>
                                    <input type="text" class="md-input" id="clndr_event_title_control" />
                                </div>
                                <div class="uk-margin-medium-bottom">
                                    <label for="clndr_event_link_control">Event Link</label>
                                    <input type="text" class="md-input" id="clndr_event_link_control" />
                                </div>
                                <div class="uk-grid uk-grid-width-medium-1-3 uk-margin-large-bottom" data-uk-grid-margin>
                                    <div>
                                        <div class="uk-input-group">
                                            <span class="uk-input-group-addon"><i class="uk-input-group-icon uk-icon-calendar"></i></span>
                                            <label for="clndr_event_date_control">Event Date</label>
                                            <input class="md-input" type="text" id="clndr_event_date_control" data-uk-datepicker="{format:'YYYY-MM-DD', minDate: '2018-01-16' }">
                                        </div>
                                    </div>
                                    <div>
                                        <div class="uk-input-group">
                                            <span class="uk-input-group-addon"><i class="uk-input-group-icon uk-icon-clock-o"></i></span>
                                            <label for="clndr_event_start_control">Event Start</label>
                                            <input class="md-input" type="text" id="clndr_event_start_control" data-uk-timepicker>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="uk-input-group">
                                            <span class="uk-input-group-addon"><i class="uk-input-group-icon uk-icon-clock-o"></i></span>
                                            <label for="clndr_event_end_control">Event End</label>
                                            <input class="md-input" type="text" id="clndr_event_end_control" data-uk-timepicker>
                                        </div>
                                    </div>
                                </div>
                                <div class="uk-modal-footer uk-text-right">
                                    <button type="button" class="md-btn md-btn-flat uk-modal-close">Close</button><button type="button" class="md-btn md-btn-flat md-btn-flat-primary" id="clndr_new_event_submit">Add Event</button>
                                </div>
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