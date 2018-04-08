<!doctype html>
<!--[if lte IE 9]> <html class="lte-ie9" lang="en"> <![endif]-->
<!--[if gt IE 9]><!--> <%@page import="java.util.ArrayList"%>
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

    <title>Insert Batches -Geeks</title>

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
<%
//session code
String user="";
if(session.getAttribute("user")!=null){
	user=(String)session.getAttribute( "user" );
}
else {
	response.sendRedirect("login.jsp?login=sessionDestroy");
}

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

            <h3 class="heading_b uk-margin-bottom">INSERT NEW STUDENTS</h3>

            <div class="md-card">
            
                <div class="md-card-content large-padding">
                    <form id="form_validation" class="uk-form-stacked" method="post" action="StudentsServlet" >
                      <div class="uk-grid" data-uk-grid-margin>
                      <div class="uk-width-medium-1-3">
                    <div class="md-card">
                        <div class="md-card-content">
                            <h3 class="heading_a uk-margin-small-bottom">
                                Upload Student Image (Optional)
                            </h3>
                            <input type="file" id="input-file-a" name="img"  class="dropify" />
                        </div>
                    </div>
                </div>
                </div>
                        <div class="uk-grid" data-uk-grid-margin>
                        
                        
                        
                            <div class="uk-width-medium-1-2">
                                <div class="parsley-row">
                                    <label for="fullname">Name<span class="req">*</span></label>
                                    <input type="text" name="name" required class="md-input" />
                                </div>
                            </div>
                            <div class="uk-width-medium-1-2">
                                <div class="parsley-row">
                                    <label for="fullname">Surname<span class="req">*</span></label>
                                    <input type="text" name="surname" required class="md-input" />
                                </div>
                            </div>
                            
                             
                            
                        </div>
                        <div class="uk-grid" data-uk-grid-margin>
                        
                        <div class="uk-width-medium-1-2">
                                <div class="parsley-row">
                                   
                                    <select id="val_select" name="institude" required data-md-selectize>
                                        <option value="">Select Institude</option>
                                        <option value="Mehran University">Mehran University</option>
                                        <option value="Sindh University">Sindh University</option>
                                        <option value="SZABIST institude">SZABIST Institude</option>
                                        <option value="Others">Others</option>
                                      
                                        
                                    </select>
                                </div>
                            </div>
                            
                            
                             <div class="uk-width-medium-1-2">
                                <div class="parsley-row">
                                   
                                    <select id="val_select" name="department" required data-md-selectize>
                                        <option value="">Select Department</option>
                                        <option value="Software Engineering">Software Engineering</option>
                                        <option value="Computer System Engineering">Computer System Engineering</option>
                                        <option value="Information Technology">Information Technology</option>
                                        <option value="Telecom Engineering">Telecom Engineering</option>
                                        <option value="Others">Others</option>
                                      
                                        
                                    </select>
                                </div>
                            </div>
                            </div>
                            <div class="uk-grid" data-uk-grid-margin>
                             <div class="uk-width-medium-1-2">
                                <div class="parsley-row">
                                    <label for="fullname">Contact no<span class="req">*</span></label>
                                    <input type="text" name="contact" required class="md-input" />
                                </div>
                            </div>
                            
                             
                             <div class="uk-width-medium-1-2">
                                <div class="parsley-row">
                                    <label for="fullname">Email<span class="req">*</span></label>
                                    <input type="text" name="email" required class="md-input" />
                                </div>
                            </div>
                           
                         </div>
                         
                        <div class="uk-grid" data-uk-grid-margin>
                            
                            <div class="uk-width-medium-1-1">
                                <div class="parsley-row">
                                   
         
                                    <select id="val_select" name="batch" required data-md-selectize >
                                        <option value="">Select Batch</option>
                                            <%
      BatchDAO st = new BatchDAOImpl();
 ArrayList<BatchBean> list = new ArrayList <BatchBean>();
 	list = st.viewAllBatch();
 	for (BatchBean b : list){
				%>
                                        <option value="<%=b.getId()%>"><%=b.getName() %></option>
                                         <%}  %>
                                        
                                    </select>
                                </div>
                            </div>


                            		
                            
                           
                        </div>
 
                              <div class="uk-grid">
                            <div class="uk-width-1-2">
                                <button type="submit" class="md-btn md-btn-primary md-btn-block md-btn-wave-light waves-effect waves-button waves-light">Add Student</button>
                            </div>
                        </div>
                    </form>
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