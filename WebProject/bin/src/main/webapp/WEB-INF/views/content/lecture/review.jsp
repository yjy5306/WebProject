<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">


    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" >
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
    <!--별점-->
    <link rel="stylesheet" href="./css/rating/rateit.css">
    <link rel="stylesheet" href="./css/review.css">
    <link rel="stylesheet" media="screen and (min-device-width: 320px) and (max-device-width: 1100px)" href="./css/review_responsive.css">
    
    <!-- vue.js cdn
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="js/review.vue"></script> -->

    <!--차트-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js" charset="utf-8"></script>
    <!--차트-->
    <script src="./js/data_chart.js" charset="utf-8"></script>
   
    <!-- jQuery library -->
    <!-- Latest compiled JavaScript -->
    <!--별점-->
    <script src="./js/rating/jquery.rateit.js"></script>
    <script src="./js/review.js" charset="utf-8"></script>
   
    <title>My Chart.js Chart</title>

</head>
<body onload="starting_function()">
    <!-- 평균 점수 ${average}로 불러옴-->
    
            <div id="content_header">
                <h3>[00000]무슨 강의</h3>
            </div>
            <div id ="content_top">
                
            </div>
            
            <div id="content_middle">
                <div id="left_chart">
                    <canvas id ="myChart" ></canvas>
                </div>
                
                <div class="average">
                    
                   <h5>평균 평점 :<span> ${average}</span> </h5>
                  
                   <div data-productid="312" class="rateit" data-rateit-mode="font" style="" 
                   data-rateit-value="2.5" data-rateit-ispreset="true" data-rateit-readonly="true"
                   ></div>
                   
                   <!-- 평가 -->
                  	
                    
                </div>
                
                <!-- 로그인된 아이디가 이 학교 아이디이면  나타남.-->
                <div id="write_review_wrapper" >
                	<button>평가하기</button>
                	<%@include file="write_review.jsp" %>
            	</div>
            </div>
            
    
    <script>
            //차트 만드는 것 -- 후에 파라미터에 json array
            getChart();
    </script>
    <script>
    
    </script>
</body>
