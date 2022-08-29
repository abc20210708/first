<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <title>The dishes Mall - 장바구니</title>
    <%@ include file="../include/static-head.jsp" %>
</head>

<body>
    <div class="wrap">

        <!-- header -->
        <%@ include file="../include/header.jsp" %>
  
        <!-- //header -->

        <!-- section content > page banner -->
        <!-- 배너 자리 -->
        
    <c:forEach var="ord" items="${ord}">
        <section id="page-banner-container" class="basket-bn">
            <div class="page-banner-img">
                <div class="page-banner-text">
                    <p>${loginCustomer.csName}님</p>
                    <p>주문내역</p>
                </div>
                <img src="/image/basket.png" alt="카테고리 배너 이미지">
            </div>
        </section>
        <!-- //section content > page banner -->

        
        <!-- section content > basket list -->
        <section id="basket-list-container">
   
            <table class="basket-list"> <!-- 장바구니가 비어있을 시 hide클래스 추가 -->
                <tbody class="basket-list-pd">
      

                        <tr class="basket-pd-info">

                            <td>
                                <input type="checkbox" value="${c.cartCode}" name="cartChecked"
                                    onclick="calcGoodsPrice('${product[status.index].prPrice}', this, '${c.cartAmount}')" id="input_check">
                            </td>
               


                            <td>
                                <p>주문코드  : <span>${ord.orderCode}</span></p>
                                <p>주문자명  : <span>${loginCustomer.csName}</span></p>
                                <p>연락처  : <span>${ord.csPhone}</span></p>
                                <p>우편번호  : <span>${ord.postCode}</span></p>
                                <p>도로명주소  : <span>${loginCustomer.roadAddr}</span></p>
                                <p>지번주소  : <span>${loginCustomer.lotNumAddr}</span></p>
                                <p>상세주소  : <span>${loginCustomer.extraAddr}</span></p>
                                <p>상품  : <span>${ord.prName}</span></p>
                                <p>색상  : <span>${ord.prColor}</span></p>
                                <p>사이즈  : <span>${ord.prSize}</span></p>
                                <p>구매수량  : <span>${ord.orderAmount}</span></p>
                                <p>주문날짜  : <span>${ord.orderDate}</span></p>
                                <p>배송비  : <span>${ord.deliPrice}</span></p>
                                
                            </td>

                            <td>
                                <p>주문총금액  : <fmt:formatNumber value="${ord.orderTotalPrice}" pattern="#,###" />원</span></p>
                            </td>
                            <td>
         
                            </td>
                           

                        </tr>
                    

            
                </tbody>
            </table>
            
            <div class="basket-sum">
            </div>
        </section>
        <!-- //section content > basket list -->

        <!-- section content > basket empty -->
        <div class="basket-empty"> <!-- 장바구니에 하나라도 담겨있을 시 hide클래스 추가 -->
            <p>장바구니에 담은 상품이 없습니다.</p>
            <button onclick="location.href='/'">상품 담으러 가기</button>
        </div>
        <!-- //section content > basket empty -->
        
        <!-- section content > basket total -->
        <section id="basket-total-container">

        
            <div class="" id="basket-box"> 
            
                
                <div class="bk-btn-box">
                  
                </div> 
            </div>

        </section>
    </c:forEach>
        <!-- //section content > basket total -->

        <!-- footer -->
        <%@ include file="../include/footer.jsp" %>
        <!-- //footer -->
    </div>

    <script>

          

    </script>

</body>

</html>