<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <title>The dishes Mall - 상품이름</title>
    <%@ include file="../include/static-head.jsp" %>
    </head>

<body>
    <div class="wrap">
        <!-- header -->
        <%@ include file="../include/header.jsp" %>
        <!-- //header -->


        <!-- 상세페이지 컨테이너 -->
        <section class="product-detail-container common-style">

            <!-- 상세페이지 콘텐츠 부분 -->
            <div class="pd-content-wrap">

                <!-- 카테고리 경로 -->
                <p class="category-text">
                    <a href="#">전체</a>
                    &nbsp;&gt;&nbsp;<a href="#">컵</a>
                    &nbsp;&gt;&nbsp;<a href="#">유리컵</a>
                </p>

                <!-- 해당 상품 이미지/텍스트 상자 -->
                <div class="pd-detail-wrap">
                    <!-- 상세 메인 이미지 상자 -->
                    <!-- 클래스 active 설정 https://www.11st.co.kr/products/2823218247 -->
                    <div class="pd-detail-img-wrap">
                        <div class="main-img">
                            <img src="/product/list/${p.prThumb}" class="m-img" alt="상품 메인 이미지">
                        </div>
                        <ul class="add-img">
                            <li>
                                <img src="/product/list/${p.prThumb}"  class="d-image" alt="상품 부가 이미지">
                            </li>
                            <li>
                                <img src="/product/list/${p.prImg1}"  class="d-image" alt="상품 부가 이미지">
                            </li>
                            <li>
                                <img src="/product/list/${p.prImg2}"  class="d-image" alt="상품 부가 이미지">
                            </li>
                            <li>
                                <img src="/product/list/${p.prImg3}"  class="d-image" alt="상품 부가 이미지">
                            </li>
                        </ul>
                    </div>

                    <!-- 상세 메인 상품 가격, 옵션 정보 상자 -->
                    <div class="pd-detail-info-wrap">

                        <!-- 상품 상세 정보 섹션 -->
                        <div class="pd-info">
                            <h2 class="pd-title">${p.prName}</h2>
                            <div class="pd-price">
                                <fmt:formatNumber value="" pattern="#,###" />
                            </div>
                            <div class="pd-dc-price">
                                <fmt:formatNumber value="${p.prPrice}" pattern="#,###" />원 <span>[2%]</span></div>
                        </div>

                        <!-- 배송 정보 / 수량 및 옵션 선택 / 총 주문금액 섹션 -->
                        <div class="pd-optionform-btn">
                            <table class="pd-option-wrap">
                                <tbody>
                                    <!-- 배송 안내 -->
                                    <tr>
                                        <th>
                                            배송 구분
                                        </th>
                                        <td>
                                            <p>일반배송 3,000원</p>
                                            <p>(30,000원 이상 구매시 무료배송)</p>
                                        </td>
                                    </tr>
                                    <!-- 주문 수량 설정 -->
                                    <tr>
                                        <th>
                                            주문 수량
                                        </th>

                                        <!-- 장바구니 / 바로구매 버튼 섹션 -->
                                        <form action="/cart/add" method="post">
                                            <td class="sale-amount">
                                                <select name="cartAmount" id="amount" size="1">
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5">5</option>
                                                </select>
                                            </td>

                                         <!-- 장바구니 / 바로구매 버튼 섹션 -->
                                    <form action="/cart/add" method="post">
                                        <td class="sale-amount">
                                            <select name="cartAmount" id="amount" size="1">
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                            </select>
                                        </td>

                                    </tr>
                                    
                                        <tr>
                                            <th>
                                                옵션 선택 - 1
                                            </th>
                                            <td class="sale-option">
                                                <select name="prColor" id="option1" size="1">
                                                    <option value="">색상</option>
                                                    <c:forEach var="opt" items="${opt}">
                                                        <c:if test="${!empty opt.prColor}">
                                                            <option value="${opt.prColor}">${opt.prColor}</option>
                                                        </c:if>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                            <th>
                                                옵션 선택 - 2
                                            </th>
                                            <td class="sale-option">
                                                <select name="prSize" id="option2" size="1">
                                                    <option value="">사이즈</option>
                                                    <c:forEach var="opt" items="${opt}">
                                                        <c:if test="${!empty opt.prSize}">
                                                            <option value="${opt.prSize}">${opt.prSize}</option>
                                                        </c:if>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        </tr>
                                   
                                    <!-- 총 주문 금액 -->

                                    <tr class="total-sum">

                                      <!--<tr class="total-sum">

                                        <th class="total-text">총 주문 금액</th>
                                        <td class="total-price">
                                            <span class="total-amount"> 총 수량 <span>1</span> 개</span>
                                            <span>9,800</span>원
                                        </td>

                                    </tr>

                                    </tr>  -->

                                </tbody>
                            </table>



                            <input type="hidden" name="csId" value="${loginCustomer.csId}">
                            <input type="hidden" name="prCode" value="${p.prCode}">

                            <div class="sale-basket-btn">
                                <button id="opbtn01" type="submit">장바구니</button>
                                <button id="opbtn02" type="submit">바로구매</button>
                            </div>

                                <input type="hidden" name="csId" value="${loginCustomer.csId}"> 
                                <input type="hidden" name="prCode" value="${p.prCode}">   
                                 

                                <div class="sale-basket-btn">
                                    <button id="opbtn01" type="image.png">장바구니</button>
                                    <button id="opbtn02" type="submit">바로구매</button>
                                </div> 

                            </form>
                        </div>
                    </div>
                </div>



                <!-- 상품 TAB -->
                <div class="product-tab-wrap">
                    <ul class="product-tab">
                        <li id="tab01" class="current"><a href="#explain">상품 설명</a></li>
                        <li id="tab02"><a href="#review">상품 후기</a></li>
                        <li id="tab03"><a href="#qna">상품 문의</a></li>
                    </ul>
                </div>
                <!-- 해당 상품 상세 설명 상자 -->
                <div class="pd-detail-explains-wrap" id="explain">
                    <!-- 상품 상세 설명 -->
                    <div class="pd-detail-explain">
                        <h2>상품 설명</h2>
                        <img src="/product/list/${p.prThumb}" alt="상품 상세 설명 이미지">
                    </div>

                    <table class="pd-essential-info">
                        <tbody>
                            <tr>
                                <th>품명</th>
                                <td>카페 유리컵</td>
                            </tr>
                            <tr>
                                <th>재질</th>
                                <td>상세페이지 참조</td>
                            </tr>
                            <tr>
                                <th>구성품</th>
                                <td>상세페이지 참조</td>
                            </tr>
                            <tr>
                                <th>크기</th>
                                <td>상세페이지 참조</td>
                            </tr>
                            <tr>
                                <th>동일모델의 출시년월</th>
                                <td>상세페이지 참조</td>
                            </tr>
                            <tr>
                                <th>제조자(수입여부)</th>
                                <td>상세페이지 참조</td>
                            </tr>
                            <tr>
                                <th>제조국</th>
                                <td>상세페이지 참조</td>
                            </tr>
                            <tr>
                                <th>수입식품안전관리특별법에 따른 수입 기구,용기 여부</th>
                                <td>수입식품안전관리특별법에 따른 수입신고를 필함</td>
                            </tr>
                            <tr>
                                <th>품질보증기준</th>
                                <td>상세페이지 참조</td>
                            </tr>
                            <tr>
                                <th>A/S 책임자/전화번호</th>
                                <td>080-0000-0000</td>
                            </tr>
                        </tbody>
                    </table>
                    <!-- 해당 상품과 관련있는 상품 목록 상자 -->
                    <div class="together-pd-wrap">
                        <div class="together-pd-title">
                            <p>이 상품과 비슷한 상품</p>
                        </div>
                        <ul class="products-list">
                            <c:forEach var="a" items="${articles}">
                                <li class="product">
                                    <a href="/product/info?prCode=${a.prCode}">
                                        <img src="/product/list/${a.prThumb}" alt="상품1">
                                        <div class="box-info">
                                            <span class="pd_nm">${a.prName}</span>
                                            <span class="pd_price">
                                                <fmt:formatNumber value="${a.prPrice}" pattern="#,###" />원</span>
                                        </div>
                                    </a>
                                </li>
                            </c:forEach>
                            <!--  <li class="product">
                                <a href="#">
                                    <img src="http://via.placeholder.com/200" alt="상품2">
                                    <div class="box-info">
                                        <span class="pd_nm" class="pd_nm">product2</span>
                                        <span class="pd_price">10,000원</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product">
                                <a href="#">
                                    <img src="http://via.placeholder.com/200" alt="상품3">
                                    <div class="box-info">
                                        <span class="pd_nm">product3</span>
                                        <span class="pd_price">10,000원</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product">
                                <a href="#">
                                    <img src="http://via.placeholder.com/200" alt="상품4">
                                    <div class="box-info">
                                        <span class="pd_nm">product4</span>
                                        <span class="pd_price">10,000원</span>
                                    </div>
                                </a>
                            </li> -->
                        </ul>
                    </div>
                    <!-- 상품 리뷰(후기) -->
                    <div class="pd-reviews" id="review">
                        <div class="review-header">
                            <h2>리뷰</h2>
                            <span class="review-total-num">3</span>
                        </div>
                        <div class="review-feed">
                            <!-- 리뷰 정렬 필터 부분 -->
                            <div class="review-feed-filter">
                                <div class="all-photo-btn">
                                    <a href="#">전체</a>
                                    <a href="#">포토</a>
                                </div>
                                <select name="review-filter" id="rv-filter">
                                    <option value="latest">최신순</option>
                                    <option value="best">인기순</option>
                                </select>
                            </div>

                            <!-- 리뷰 목록 부분 -->
                            <div class="review-feed-list">
                                <!-- 리뷰 하나 -->
                                <div class="reviews">
                                    <div class="reviews-text-box">
                                        <div class="rv-info">
                                            <div class="rv-id-box">
                                                <div class="rv-id">gildong236</div>
                                                <div class="rv-stars">★★★★★</div>
                                            </div>
                                            <div class="rv-date">2022/02/17</div>
                                        </div>
                                        <p class="rv-text">
                                            리뷰내용 후기내용 리뷰내용 후기내용 <br>
                                            리뷰내용 후기내용 리뷰내용 후기내용 <br>
                                            리뷰내용 후기내용 리뷰내용 후기내용
                                        </p>
                                    </div>
                                    <div class="reviews-img">
                                        <img src="http://via.placeholder.com/500" alt="후기 사진">
                                    </div>
                                </div>
                                <!-- 리뷰 둘 -->
                                <div class="reviews">
                                    <div class="reviews-text-box">
                                        <div class="rv-info">
                                            <div class="rv-id-box">
                                                <div class="rv-id">lee777</div>
                                                <div class="rv-stars">★★★★★</div>
                                            </div>
                                            <div class="rv-date">2022/02/22</div>
                                        </div>
                                        <p class="rv-text">
                                            리뷰내용 후기내용 리뷰내용 후기내용리뷰내용 후기내용 리뷰내용 후기내용리뷰내용 후기내용 리뷰내용 후기내용리뷰내용 후기내용 리뷰내용
                                            후기내용리뷰내용 후기내용 리뷰내용 후기내용
                                        </p>
                                    </div>
                                    <div class="reviews-img">
                                        <img src="http://via.placeholder.com/500" alt="후기 사진">
                                    </div>
                                </div>
                                <!-- 리뷰 셋 -->
                                <div class="reviews">
                                    <div class="reviews-text-box">
                                        <div class="rv-info">
                                            <div class="rv-id-box">
                                                <div class="rv-id">kimmm89</div>
                                                <div class="rv-stars">★★★★★</div>
                                            </div>
                                            <div class="rv-date">2022/03/15</div>
                                        </div>
                                        <p class="rv-text">
                                            리뷰내용 후기내용 리뷰내용 후기내용 <br>
                                            리뷰내용 후기내용 리뷰내용 후기내용 <br>
                                            리뷰내용 후기내용 리뷰내용 후기내용
                                        </p>
                                    </div>
                                    <div class="reviews-img">
                                        <img src="http://via.placeholder.com/500" alt="후기 사진">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 상품 문의 -->
                    <div class="pd-qna" id="qna">
                        <!-- 게시판 형식 -->
                    </div>

                    <!-- 상품 배송/환불 -->
                    <div class="pd-delivery_refund">
                        <table class="delivery-info">
                            <tbody>
                                <tr>
                                    <th>배송</th>
                                    <td>일반배송</td>
                                </tr>
                            </tbody>
                        </table>
                        <table class="refund-as-info">

                        </table>
                    </div>

                </div>
            </div>
        </section>
        <!-- //section product container fin -->

        <!-- footer -->
        <%@ include file="../include/footer.jsp" %>
        <!-- //footer -->
    </div>

    <script>

        
        //가격에 ,(콤마) 생성하는 함수
        function product(a){
            let result =  parseInt(a) + parseInt(a*0.02);


            return result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원"
        }

        document.querySelector('.pd-price').textContent = product('${p.prPrice}');



        //상품 이미지 클릭시 함수
        $(".d-image").click(function(){
            let imgSrc = $(this).attr("src");
            console.log(imgSrc);
            $(".m-img").attr("src", imgSrc); //메인 이미지 img src 변경
            /*참고 블로그 https://solbel.tistory.com/1070 */
            });


    </script>


</body>

</html>