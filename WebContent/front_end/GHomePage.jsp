<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<!DOCTYPE html>
<html lang="zh-cn-en">

<head>

<!--     <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content=""> -->

    <title>這是標題</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS --><!--幻燈片-->
    <link href="css/modern-business.css" rel="stylesheet">
    <!--幻燈片速度-->
    <script>
    $('.carousel').carousel({
        interval: 5000 //changes the speed
    })
    </script>

    <!-- Custom Fonts -->
    <link rel="stylesheet" href="assets/css/font-awesome.min.css" />
    
    <!--[if IE 7]>
    <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
    <![endif]-->

    <!-- page specific plugin styles -->

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
    <!-- jQuery --><!--訪客navbar動畫-1-->
    <script src="js/jquery.js"></script>
    
    <!-- Script to Activate the Carousel -->
    <!-- Bootstrap Core JavaScript --><!--訪客navbar動畫-2-->
    <script src="js/bootstrap.min.js"></script>

    <!-- ace settings handler -->

    
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
    <![endif]-->
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="assets/js/html5shiv.js"></script>
    <script src="assets/js/respond.min.js"></script>
    <![endif]-->
    <!--button樣式-->
    <link rel="stylesheet" href="assets/css/ace.min.css" />

<style>
    body{
        background-image: url("../ManagaerUI/images/bg-img.png");
    }
    nav.navbar{
        background-color: black;
    }
    div.ranking{
        background-color: #E8E8D0;

    }
</style>

</head>


<body>

    <!-- 導覽列 -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">這是logo</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="index.html">首頁</a>
                    </li>

                     <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">服務介紹 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="about.html">關於我們</a>
                            </li>
                            <li>
                                <a href="#">公告消息</a>
                            </li>
                            <li>
                                <a href="knowledge.html">健身知識</a>
                            </li>
                            <li>
                                <a href="#">找教練</a>
                            </li>
                            <li>
                                <a href="#">找場地</a>
                            </li>
                            <li>
                                <a href="#">找課程</a>
                            </li>
                        </ul>
                    </li>
                            
                    <li>
                        <a href="#">討論專區</a>
                    </li>
                    <li>
                        <a href="#">直播專區</a>
                    </li>
                   
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">客服專區 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="faq.html">常見問題</a>
                            </li>
                            <li>
                                <a href="contact.html">聯絡我們</a>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">會員專區 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="login.html">請先登入會員!</a>
                            </li>
                        </ul>
                    </li>
                </ul>

                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#"><span class="glyphicon glyphicon-user"></span> 註冊</a></li>
                    <li><a href="login.html"><span class="glyphicon glyphicon-log-in"></span> 登入</a></li>
                </ul>

            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    

    <!-- Header Carousel -->
    <header id="myCarousel" class="carousel slide">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner">
            <div class="item active">
                <div class="fill" style="background-image:url('http://read.html5.qq.com/image?src=forum&q=5&r=0&imgflag=7&imageUrl=http://mmbiz.qpic.cn/mmbiz_jpg/SIibjgXQ9tE6siaCe7khsCQfuxwHq6pJyM04w3nH6Rhg7tQlibdHfrsIaPOctwibteCAPYOCOqFtSCKWSzpK5YaMqA/0');"></div>
                <div class="carousel-caption">
                    <h2>圖片 1 1900*1080</h2>
                </div>
            </div>
            <div class="item">
                <div class="fill" style="background-image:url('http://www.cn.katathani.com/images/1900x1080/facilities-services.slide.56.jpg');"></div>
                <div class="carousel-caption">
                    <h2>圖片 2</h2>
                </div>
            </div>
            <div class="item">
                <div class="fill" style="background-image:url('http://www.cordishotels.com/cdn-465d5dfb/globalassets/cordis/cd-hongkong/promotions/wellness/cdhkg-wellness-health-club-fitness-studio-1680-660.jpg');"></div>
                <div class="carousel-caption">
                    <h2>圖片 3</h2>
                </div>
            </div>
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="icon-prev"></span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="icon-next"></span>
        </a>
    </header>

    <!-- Page Content -->
    <div class="container">

        <!-- 找XX -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header"></h1>
            </div>
            <div class="col-md-4">
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <h4><center><i class="icon-bell-alt"></i>找教練?</center></h4>
                    </div>
                    <div class="panel-body">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Itaque, optio corporis quae nulla aspernatur in alias at numquam rerum ea excepturi expedita tenetur assumenda voluptatibus eveniet incidunt dicta nostrum quod?</p>
                        <center><a href="#"><span class="btn btn-success btn-lg tooltip-success" data-rel="tooltip" data-placement="bottom" title="訊息">立刻預定教練</span></a></center>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-warning">
                    <div class="panel-heading">
                        <h4><center><i class="icon-bell-alt"></i> 找場地?</center></h4>
                    </div>
                    <div class="panel-body">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Itaque, optio corporis quae nulla aspernatur in alias at numquam rerum ea excepturi expedita tenetur assumenda voluptatibus eveniet incidunt dicta nostrum quod?</p>
                        <center><a href="#"><span class="btn btn-warning btn-lg tooltip-warning" data-rel="tooltip" data-placement="bottom" title="訊息">立刻預定場館</span></a></center>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h4><center><i class="icon-bell-alt"></i> 找課程?</center></h4>
                    </div>
                    <div class="panel-body">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Itaque, optio corporis quae nulla aspernatur in alias at numquam rerum ea excepturi expedita tenetur assumenda voluptatibus eveniet incidunt dicta nostrum quod?</p>
                        <center><a href="#"><span class="btn btn-info btn-lg tooltip-info" data-rel="tooltip" data-placement="bottom" title="訊息">立刻預定課程</span></a></center>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.row -->

        <!-- P教練排行榜 -->
        <div class="row">
            <div class="col-xs-12 col-md-12">
                <h2 class="page-header"><center>教練熱門排行榜<small>Ranking700*450</small></center></h2>
            </div>
            <div class="col-xs-4 col-sm-4 ranking">
                <a href="portfolio-item.html">
                    <img class="img-responsive img-portfolio img-hover" src="http://down.epchina.com/portal/201509/08/154457pee2rumj27f145bu.jpg" alt="">
                </a>
            </div>
            <div class="col-md-4 col-md-4 col-sm-6 ranking">
                <a href="portfolio-item.html">
                    <img class="img-responsive img-portfolio img-hover" src="http://read.html5.qq.com/image?src=forum&q=5&r=0&imgflag=7&imageUrl=http://mmbiz.qpic.cn/mmbiz_jpg/1Q9gBZyvRPcwo08VUwMtqibnAPq9nYjb53k4Ubv6rQLuHlFKKnibxHmOeFe1hxMxu8iaDw6tO7HKzhvx4HctuibwVg/0" alt="">
                </a>
            </div>
            <div class="col-md-4 col-md-4 col-sm-6 ranking">
                <a href="portfolio-item.html">
                    <img class="img-responsive img-portfolio img-hover" src="http://shihuo.hupucdn.com/ucditor/20170204/781x502_3fe937fb4e879d52234ec297868d0a21.jpeg?imageMogr2/format/jpg%7CimageView2/2/w/700/interlace/1" alt="">
                </a>
            </div>
        </div>
        <!-- /.row -->
        <br>

        <!-- 最新消息 -->
        <div class="row">
            <div class="col-xs-12 col-md-12">
                <h2 class="page-header">最新消息<small>News</small></h2>
            </div>
            
            <!--table開始-->
            <div class="col-xs-12 col-md-8 feature">
                <div class="row">
                    <div class="col-xs-12 col-sm-12">
                        <div class="table-responsive">
                            <table id="sample-table-1" class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th class="center">類型</th>
                                        <th>標題</th>
                                        <th>更新日期</th>
                                        <th>保留</th>
                                     </tr>
                                </thead>

                                <tbody>

                                    <tr>
                                        <td class="center"><span class="label label-xs label-warning arrowed-in">公告</span></td>
                                        <td><a href="#">文章11111111111111111111111111111111111111111111111111</a></td>
                                        <td>17.07.18</td>
                                        <td>保留</td>
                                    </tr>

                                    <tr>
                                        <td class="center"><span class="label label-xs label-success arrowed-in">公告</span></td>
                                        <td><a href="#">文章22222222222222222222222222222222222222222222222222</a></td>
                                        <td>17.07.18</td>
                                        <td>保留</td>
                                    </tr>

                                    <tr>
                                        <td class="center"><span class="label label-xs label-info arrowed-in">公告</span></td>
                                        <td><a href="#">文章33333333333333333333333333333333333333333333333333</a></td>
                                        <td>17.07.18</td>
                                        <td>保留</td>
                                    </tr>

                                    <tr>
                                        <td class="center"><span class="label label-xs label-inverse arrowed-in">公告</span></td>
                                        <td><a href="#">文章44444444444444444444444444444444444444444444444444</a></td>
                                        <td>17.07.18</td>
                                        <td>保留</td>
                                    </tr>

                                    <tr>
                                        <td class="center"><span class="label label-xs label-primary arrowed-in">公告</span></td>
                                        <td><a href="#">文章55555555555555555555555555555555555555555555555555</a></td>
                                        <td>17.07.18</td>
                                        <td>保留</td>
                                    </tr>

                                 </tbody>
                                
                                </table>
                        </div><!-- /.table-responsive -->
                    </div><!-- /col-sm-12 -->
                </div><!-- /row -->
            </div>
            <!--table結束-->
            
            <!--廣告圖-->
            <div class="col-xs-12 col-md-4">
                <img class="img-responsive" src="http://beautiful666.com/images/05/24-b.jpg" alt="">
            </div>
        </div>
        <!-- /.row -->


        <!-- Features Section -->
        <div class="row">
            <div class="col-xs-12 col-md-12">
                <h2 class="page-header">討論專區<small>Whatever</small></h2>
                    
                    <ul id="myTab" class="nav nav-tabs nav-justified">
                        <li class="active"><a href="#service-one" data-toggle="tab"><i class="icon-check"></i> 最新文章</a>
                        </li>
                        <li class=""><a href="#service-two" data-toggle="tab"><i class="icon-check"></i> 文章排行</a>
                        </li>
                        <li class=""><a href="#service-three" data-toggle="tab"><i class="icon-check"></i> 論壇排行</a>
                    </ul>
                    
                    <!--內容1-->
                    <div id="myTabContent" class="tab-content aaaaaa">
                    <div class="tab-pane fade active in" id="service-one">
                    <p></p>
                        <div class="panel-group" id="accordion">
                            
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a href="#">討論版1</a>
                                    </h4>
                                </div>    
                            </div>
                            <!-- /.panel -->

                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a href="#">討論版2</a>
                                    </h4>
                                </div>    
                            </div>
                            <!-- /.panel -->
                        </div>
                        <!-- /.panel-group -->
                    </div>
                    
                    <!--內容2-->
                    <div class="tab-pane fade" id="service-two">
                     <p></p>
                        <div class="panel-group" id="accordion">
                            
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a href="#">爽快版1</a>
                                    </h4>
                                </div>    
                            </div>
                            <!-- /.panel -->

                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a href="#">爽快版2</a>
                                    </h4>
                                </div>    
                            </div>
                            <!-- /.panel -->
                        </div>
                        <!-- /.panel-group -->
                    </div>

                     <!--內容3-->
                    <div class="tab-pane fade" id="service-three">
                     <p></p>
                        <div class="panel-group" id="accordion">
                            
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a href="#">黑皮版1</a>
                                    </h4>
                                </div>    
                            </div>
                            <!-- /.panel -->

                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a href="#">黑皮版2</a>
                                    </h4>
                                </div>    
                            </div>
                            <!-- /.panel -->
                        </div>
                        <!-- /.panel-group -->
                    </div>

            </div><!--col-lg-12-->
        </div>
        <!-- /.row -->
            
        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-xs-12 col-md-12">
                    <p>Copyright &copy; HelloWorld Web Site 2017</p>
                </div>
            </div>
        </footer>
        
    </div>
    <!-- /.container -->

</body>

<!--按鈕產生對話框-->
<script type="text/javascript">
    jQuery(function($) {
        $('[data-rel=tooltip]').tooltip();
    });
</script>

</html>

</html>