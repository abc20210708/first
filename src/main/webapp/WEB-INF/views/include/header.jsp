<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- header -->
<header id="header-container">
    <div class="inner-header">
        <h1 class="logo">
            <a href="/">
                <img src="/image/Title_ex.png" alt="메인 로고 이미지">
            </a>
        </h1>

        <!-- 메인 네비게이션바 -->
        <nav class="gnb">
            <a href="#">신상품</a>
            <a href="#">베스트</a>
            <a href="#">카테고리</a>
        </nav>
        <!-- 검색/찜/장바구니  상품 이름 검색하기 https://kimvampa.tistory.com/175 -->
        <nav class="tnb">
            <a href="#">
                <form action="/product/info" class="search">
                    <label>
                        <span class="lnr lnr-magnifier"></span>
                        <input type="text" placeholder="검색어를 입력하세요" id="search" name="keyword">
                        <i class="fas fa-search"></i>
                    </label>
                </form>
            </a>
            <c:if test="${loginCustomer == null}">
                <a href="#" class="sign-in-up" id="singUpBtn" onclick="javascript:doDisplay()">
                    <span>로그인</span>
                </a>
                <a href="/customer/account" class="sign-in-up">
                    <span>회원가입</span>
                </a>
            </c:if>
            <a href="#"><i class="far fa-heart"></i></a>
            <c:if test="${loginCustomer != null}">
                <a href="/cart/list"><i class="fas fa-cart-plus"></i></a>
            </c:if>
            
            </ul>
        </nav>
    </div>
</header>
<!-- //header -->
<script>


    $(document).scroll(function () {
        var $nav = $("#header-container");
        $nav.toggleClass('scroll', $(this).scrollTop() > $nav.height());
    });

    // onclick="cartList('${loginCustomer}')" 
    function cartList(target) {
        if (target) {
            location.href = "/cart/list";
        } else {
            alert("로그인 후 이용해주세요 :)");
        }
    }

    // 로그인 창 열기
    function doDisplay() {
        document.getElementById("login-popup-container").style.display = "block";
        document.querySelector(".login-popup-box").style.display = "block";
    }

    // 로그인 창 닫기
    function noneDisplay() {
        document.getElementById("login-popup-container").style.display = "none";
        document.querySelector(".login-popup-box").style.display = "none";
    }



    //enter 누를 때 이벤트
    $('input[type="text"]').keydown(function () {
        if (event.keyCode === 13) {
            event.preventDefault();
            if ($('#inputId').val() === '' || $('#inputId').val() === null) {

                //$("#inputId").attr("placeholder", "아이디를 입력하세요");
                //$("#inputId").css("background", "#00B261");
                alert("아이디를 입력하세요");
            }
        }
    });


    $('input[type="password"]').keydown(function () {
        if (event.keyCode === 13) {
            event.preventDefault();
            if ($('#inputPw').val() === '' || $('#inputPw').val() === null) {
                //$("#inputPw").attr("placeholder", "비밀번호를 입력하세요");
                // $("#inputPw").css("background", "#00B261");
                alert("비밀번호를 입력하세요");
            } else {
                $("#loginForm").submit();
            }
        }
    });



    //로그인 클릭 
    $('#loginBtn').click(function () {
        if ($('#inputId').val() === '' || $('#inputId').val() === null) {
            alert("아이디를 입력하세요");
        } else if ($('#inputPw').val() === '' || $('#inputPw').val() === null) {

            alert("비밀번호를 입력하세요");
        } else {
            $("#loginForm").submit();
        }
    });
    
</script>