<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- header -->
        <header id="header-container">
            <div class="inner-header">
                <h1 class="logo">
                    <a href="#">
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
                    <a href="#" class="sign-in-up" id="singUpBtn" onclick="javascript:doDisplay()">
                        <span>로그인</span>
                    </a>
                    <a href="/customer/account" class="sign-in-up">
                        <span>회원가입</span>
                    </a>
                    <a href="#"><i class="far fa-heart"></i></a>
                    <a href="/cart/list"><i class="fas fa-cart-plus"></i></a>
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
        </script>