<!doctype html>
<!--[if lte IE 9]> <html class="lte-ie9" lang="en"> <![endif]-->
<!--[if gt IE 9]><!--> <%@page import="fms.model.BatchBean"%>
<%@page import="java.util.ArrayList"%>
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

    <title>Batch Management -Geeks</title>

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
    
    
    
    <%
    String notify="hidden";
String name="", course="", timing="" , start="", end="", fees="";
String mode="INSERT NEW BATCH";    
String method="post";    

String phpchecked="",corechecked="",javaeechecked="";

    
    
    int batch_id=0;
if(request.getParameter("batch_id")!=null){
	method="get";
	BatchDAO bd = new BatchDAOImpl();
	ArrayList <BatchBean>list = new ArrayList<BatchBean>();
	batch_id = Integer.parseInt(request.getParameter("batch_id"));
	list=bd.getBatch(batch_id);
	mode="EDIT BATCH";
	for (BatchBean b : list){
		name= b.getName();
		course= b.getCourse();
		timing=b.getTime();
		start=b.getStart();
		end=b.getEnd();
		fees=b.getFees();
		
		if(course.equals("PHP")){
			phpchecked="checked";
			
		}
		else if(course.equals("Java EE")){
			javaeechecked="checked";
			
		}
		else if(course.equals("Core Java")){
			corechecked="checked";
			
		}
				
		
	}
	
}
String status="";

if(request.getParameter("status")!=null){
	status=request.getParameter("status");
	if(status.equals("successfully")){
		notify="visible";
	}
	
	
}
%>
    
    
    
    
    
   
   <div id="page_content">
        <div id="page_content_inner">

            <h3 class="heading_b uk-margin-bottom"><%=mode %> </h3>

            <div class="md-card">
            
                <div class="md-card-content large-padding">
                    <form id="form_validation" class="uk-form-stacked" method="<%=method %>" action="BatchServlet" >
                        <div class="uk-grid" data-uk-grid-margin>
                        
                            <div class="uk-width-medium-1-2">
                                <div class="parsley-row">
                                    <label for="fullname">Batch Name<span class="req">*</span></label>
                                    <input type="text" name="name" value="<%=name %>"  required class="md-input" />
                                </div>
                                
                            </div>
                            <div class="uk-width-medium-1-2">
                                <div class="parsley-row">
                                   
                                    <input type="text" name="batch_id" value="<%=batch_id %>"  required class="md-input" style="visibility: hidden;" />
                                </div>
                                
                            </div>
                            
                        </div>
                        <div class="uk-grid" data-uk-grid-margin>
                            <div class="uk-width-medium-1-2">
                                <div class="parsley-row uk-margin-top">
                                    <label for="val_birth">Stating Date<span class="req">*</span></label>
                                    <input type="text" name="start" id="val_birth" value="<%=start %>" required class="md-input" data-parsley-americandate data-parsley-americandate-message="This value should be a valid date (MM.DD.YYYY)" data-uk-datepicker="{format:'MM.DD.YYYY'}" />
                                </div>
                            </div>
                            <div class="uk-width-medium-1-2">
                                <div class="parsley-row uk-margin-top">
                                    <label for="val_birth">Ending Date<span class="req"> (optional)</span></label>
                                    <input type="text" value="<%=end %>" name="end" id="val_birth" required class="md-input" data-parsley-americandate data-parsley-americandate-message="This value should be a valid date (MM.DD.YYYY)" data-uk-datepicker="{format:'MM.DD.YYYY'}" />
                                </div>
                            </div>
                            <div class="uk-width-medium-1-1">
                                <div class="uk-form-row parsley-row">
                                    <label for="gender" class="uk-form-label">Courses<span class="req">*</span></label>
                                    <span class="icheck-inline">
                                        <input type="radio" name="course" id="val_radio_male" value="Core Java" data-md-icheck required <%=corechecked %> />
                                        <label for="val_radio_male" class="inline-label">Core Java</label>
                                    </span>
                                    <span class="icheck-inline">
                                        <input type="radio" name="course" id="val_radio_female" value="Java EE" data-md-icheck <%=javaeechecked %> />
                                        <label for="val_radio_female" class="inline-label">Java EE</label>
                                    </span>
                                    <span class="icheck-inline">
                                        <input type="radio" name="course" id="val_radio_female" value="PHP" data-md-icheck <%=phpchecked %> />
                                        <label for="val_radio_female" class="inline-label">PHP</label>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="uk-grid" data-uk-grid-margin>
                            
                            <div class="uk-width-medium-1-2">
                                <div class="parsley-row">
                                    <label for="val_select" class="uk-form-label">Class Timing*</label>
                                    <select id="val_select" name="time" required data-md-selectize >
                                    <option value="<%=timing%>"><%=timing%></option>
                                        <option value="">Select..</option>
                                       
                                        <option value="9am-11am">9am-11am</option>
                                        <option value="11am-1pm">11am-1pm</option>
                                        <option value="1pm-3pm">1pm-3pm</option>
                                        <option value="2pm-5pm">2pm-5pm</option>
                                        <option value="5pm-7pm">5pm-7pm</option>
                                        <option value="7pm-9pm">7pm-9pm</option>
                                    </select>
                                </div>
                            </div>

							 <div class="uk-width-medium-1-2">
                                <div class="parsley-row">
                                    <label for="val_select" class="uk-form-label">Fees* (ruppees per month)</label>
                                    <select id="val_select" name="fees" required data-md-selectize>
                                    <option value="<%=fees%>"><%=fees%></option>
                                        <option value="">Select..</option>
                                        <option value="2500">2500</option>
                                        <option value="2700">2700</option>
                                        <option value="3000">3000</option>
                                        <option value="3300">3300</option>
                                        <option value="3500">3500</option>
                                        
                                    </select>
                                </div>
                            </div>
                            		
                            
                           
                        </div>
 
                              <div class="uk-grid">
                            <div class="uk-width-1-2">
                                <button type="submit" class="md-btn md-btn-primary md-btn-block md-btn-wave-light waves-effect waves-button waves-light">  <%=mode %> </button>
                            </div>
                            <div class="uk-width-1-2">
                         <h2 style="border: 3px solid green;color:green;visibility:<%=notify%> "><%=mode %> SUCCESSFULLY</h2>
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