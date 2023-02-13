<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
.rollingbanner{
    position: relative;
    width: 250px;
    height: 38px;
    font-size: .875rem;
    letter-spacing: -1px;
    padding: 7px 15px;
    box-sizing: border-box;
    background-color: #EEEEEE;
    border-radius: 6px;
    margin-right: 10px;
    
}
/* 타이틀 */
.rollingbanner > .title{
    font-weight: bold;
    float: left;
    padding-right: 10px;
    border-right: 1px solid black;
}
/* 롤링 배너 */
.rollingbanner > .wrap{
    position: relative;
    width: auto;
    height: 100%;
    box-sizing: border-box;
    overflow: hidden;
}        
.rolling ul{
    list-style: none;
}
.rollingbanner li{
    position: absolute;
    top: -36px;
    left: 0;
}
/* 이전, 현재, 다음 롤링 배너 표시 */
.rollingbanner li.prev{
    top: 36px;
    transition: top 0.5s ease;
}
.rollingbanner li.current{
    top: 0;
    transition: top 0.5s ease;
}
.rollingbanner li.next{
    top: -36px;
}
.rollingbanner a{
	padding-left:10px;
    display: block;
    display: -webkit-box;
    text-decoration: none;
    -webkit-line-clamp: 1;
    -webkit-box-orient:vertical;
    overflow: hidden;
    color: #000;
    
}
.rollingbanner a{
    display: block;
    display: -webkit-box;
    text-decoration: none;
    -webkit-line-clamp: 1;
    -webkit-box-orient:vertical;
    overflow: hidden;
    color: #000;
}

.donghae{
	color: white;
}
</style>

<title>술공장</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	
	<script>	/* 실시간검색 */
        document.addEventListener('DOMContentLoaded', ()=>{
            var interval = window.setInterval(rollingCallback, 3000);
        })
        function rollingCallback(){
            //.prev 클래스 삭제
            document.querySelector('.rollingbanner .prev').classList.remove('prev');

            //.current -> .prev
            let current = document.querySelector('.rollingbanner .current');
            current.classList.remove('current');
            current.classList.add('prev');

            //.next -> .current
            let next = document.querySelector('.rollingbanner .next');
            //다음 목록 요소가 널인지 체크
            if(next.nextElementSibling == null){
                document.querySelector('.rollingbanner ul li:first-child').classList.add('next');
            }else{
                //목록 처음 요소를 다음 요소로 선택
                next.nextElementSibling.classList.add('next');
            }
            next.classList.remove('next');
            next.classList.add('current');
        }
    </script>
	
</head>
<body>

<!-- header -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="<%=request.getContextPath() %>"  id="top">술공장</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">로그인<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="#">회원가입<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="#">장바구니<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item dropdown">
        <a  style="color: white;" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          마이페이지
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">주문조회</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">내가쓴글</a>
        </div>
      </li>
    </ul>


<!-- 실시간 주류 -->
<div class="rollingbanner ">
    <div class="title">인기 주류 TOP5 </div>
    <div class="wrap">
        <ul>
            <li class="current"><a href="#"> 1등 : 맥주</a></li>
            <li class="next"><a href="#"> 2등 : 소주</a></li>
            <li><a href="#"> 3등 : 양주</a></li>
            <li><a href="#"> 4등 : 와인</a></li>
            <li class="prev"><a href="#"> 5등 : 막걸리</a></li>
        </ul>
    </div>
</div>
    <form class="form-inline my-2 my-lg-0" action="get">
      <input class="form-control mr-sm-2" type="search" placeholder="검색" aria-label="Search" name = "ssearch">
     <button type="button" class="btn btn-outline-light">검색</button>
    </form>
  </div>
  
</nav>



<!-- nav -->
<div class="sticky-top">
<ul class="nav justify-content-center">
      <li class="nav-item dropdown">
        <a style="color: #424242;" class="nav-link dropdown-toggle"  href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          발효주
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">과실주</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">막걸리</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">청주</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a style="color: #424242;" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          증류주
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">브랜디</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">소주</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">위스키</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a style="color: #424242;" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          커뮤니티
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">공지사항</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">상품후기</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">QnA</a>
        </div>
      </li>

</ul>
</div>
<br>
<hr>
<br>





<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>