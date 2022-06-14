<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>The dishes Mall - 장바구니</title>
    <!-- reset css -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

    <!-- fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">

    <!-- custom css -->
    <link rel="stylesheet" href="/css/main.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>

<body>
    <div class="wrap">

        <!-- header -->
        <header class="">
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

                <!-- 검색/찜/장바구니 -->
                <nav class="tnb">
                    <a href="#">
                        <form action="/search" class="search">
                            <label>
                                <span class="lnr lnr-magnifier"></span>
                                <input type="text" placeholder="검색어를 입력하세요" id="search">
                                <i class="fas fa-search"></i>
                            </label>
                        </form>
                    </a>
                    <a href="#" class="sign-in-up">
                        <span>로그인</span>
                    </a>
                    <a href="#" class="sign-in-up">
                        <span>회원가입</span>
                    </a>
                    <a href="#"><i class="far fa-heart"></i></a>
                    <a href="#"><i class="fas fa-cart-plus"></i></a>
                    </ul>
                </nav>
            </div>
        </header>
        <!-- //header -->

        <!-- section content > page banner -->
        <!-- 배너 자리 -->
        <section id="page-banner-container" class="basket-bn">
            <div class="page-banner-img">
                <div class="page-banner-text">
                    <p>장바구니</p>
                    <p>Shopping basket</p>
                </div>
                <img src="/image/basket.png" alt="카테고리 배너 이미지">
            </div>
        </section>
        <!-- //section content > page banner -->

        <!-- section content > basket list -->
        <section id="basket-list-container">
            <div class="basket-list-title">
                <ul class="basket-select-all">
                    <li><input type="checkbox" class="allcheck" id="check_all" onclick="checkAll();"></li>
                    <li>전체선택</li>
                </ul>
                <ul class="basket-delete">
                    <li class="basket-delete-btn">
                        <button type="button" onclick="allDelete()">전체삭제</button>
                    </li>
                    <li>
                        &nbsp;
                    </li>
                    <li class="basket-delete-btn">
                        <button type="button" class="checkDel" onclick="checkDelete()">선택삭제</button>
                    </li>
                </ul>
            </div>
            <table class="basket-list">
                <tbody class="basket-list-pd">
                    <c:forEach var="c" items="${cart}" varStatus="status">
                        
                    <tr class="basket-pd-info">
                       
                        <td>
                            <input type="checkbox" value="${c.cartCode}" name="cartChecked" onclick="calcGoodsPrice('${product[status.index].prPrice}', this, '${c.cartAmount}')"  id="input_check">
                        </td>
                        <td class="basket-pd-img">
                            <img src="/product/list/${product[status.index].prThumb}" alt="상품 이미지">
                        </td>
                        
                        
                        <td>
                            <p>${product[status.index].prName}</p>
                            <p>색상: 메이플</p>
                        </td>
                       
                        <td>
                            <span id="prPrice"><fmt:formatNumber value="${product[status.index].prPrice}" pattern="#,###"/></span>
                            <span>원</span>
                            
                        </td>
                        <td>
                            <form action="/cart/modify" method="post" class="modCartForm">

                                <input type="hidden" name="cartCode" value="${c.cartCode}">  
                                <input type="hidden" name="csId" value="${loginCustomer.csId}"> 
                            

                                <input type="number" name="cartAmount" id="cart_Amount" value="${c.cartAmount}" min="1">
                                <button type="submit" class="modCart">변경</button>
                             </form>
                        </td>
                        <td>
                            <a href="/cart/delete?cartCode=${c.cartCode}" onclick="return confirm('정말 삭제하시겠습니까?');"><i class="fas fa-times"></i></a>
                        </td>
                       
                    </tr>
                    </c:forEach>
                
                      <!--
                    <tr class="basket-pd-info">
                        <td>
                            <input type="checkbox" name="basket" checked>
                        </td>
                        <td class="basket-pd-img">
                            <img src="./image/dishes3.png" alt="상품 이미지">
                        </td>
                        <td>
                            <p>도트무늬 공기</p>
                            <p>색상: 블루 도트</p>
                        </td>
                        <td>
                            <p>10,000원</p>
                        </td>
                        <td>
                            <input type="number" name="basket" value="1">
                            <button type="submit">변경</button>
                        </td>
                        <td>
                            <i class="fas fa-times"></i>
                        </td>
                    </tr> -->
                </tbody>
            </table>
            <div class="basket-sum">
            </div>
        </section>
        <!-- //section content > basket list -->

        <!-- section content > basket total -->
        <section id="basket-total-container">
            <div>
            <table class="basket-total-box">
                <tbody class="basket-total">
                    <tr>
                        <th>
                            상품금액
                        </th>
                        <td>
                            <span class="pr_Price">0</span>
                            <span>원</span>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            배송비
                        </th>
                        <td>
                            <span class="delivery">0</span>
                            <span>원</span>
                        </td>
                    </tr>
                    <tr class="bk-total">
                        <th>
                            결제예정금액
                        </th>
                        <td>
                            <span class="orderPrice">0</span>
                            <span>원</span>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="bk-btn-box">
                <button type="submit" class="bk-btn">전체주문</button>
                <button type="submit" class="bk-btn">선택주문</button>
            </div>
            
        </div>
        </section>
        <!-- //section content > basket total -->

        <!-- footer -->
        <footer style="clear: both;">
            <div id="site-map">
                <div>
                    <span>회사 소개</span>
                    <span>이용약관</span>
                    <span>개인정보 처리방침</span>
                    <span>공지사항</span>
                    <span>고객센터</span>
                </div>
            </div>cart_Amount
            <div id="copyright">
                <div>Copyright ⓒ2022 All rights reserved │ </div>
            </div>
            <p class="goTop">
                ▲ <br> TOP
            </p>
        </footer>
        <!-- //footer -->
    </div>

    <script>

        

       
                

        let totalPrice = 0;
        let sum = 0;
        let total = document.querySelector(".orderPrice").textContent;
        let amount = document.getElementById('cart_Amount').value;
        let price = document.querySelector('#prPrice').textContent;
        let input = document.getElementById('input_check');
        let plus_btn = document.getElementById('plus');

        function delivery() {
             /* 배송비 결정 */
             if(sum == 0){
                dv = 0;
                $(".delivery").text("+"+dv.toString());
            } else if(sum >= 30000){
                dv = 0;
                $(".delivery").text("+"+dv.toString());
            } else {
                dv = 3000;	
                $(".delivery").text("+"+dv.toString());
            }

        }

         // 체크박스 개별선택, 해제 
         function calcGoodsPrice(prPrice, obj, cartAm) {

            let result = Number(cartAm) * Number(prPrice);
            let chks = document.getElementsByName("cartChecked");
            
            if(chks.length == 0) sum = 0; dv =0;

            if (obj.checked == true) {
                sum += result;   
            } else {
                sum -= result;

            }

            delivery();
            totalPrice = sum + dv;
            $(".pr_Price").text(sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));  
            $(".orderPrice").text(totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));  
        }

        


            
            /*  $(document).ready(function(){
                let link =  document.location.href;          //현재 페이지 url 를 가지고 옵니다.    
                if (link.match('cart')) {                          //가지고온 url 중에 cart(장바구니)이 있는지 확인합니다.
                        $( "input[type=checkbox]" ).each(function(){       //확인됐으면 모든 체크박스에 체크를 해줍니다.
                                $(this).attr('checked', true);
                        });
                }
             });*/

            
        /* 체크박스 전체선택, 해제 */
        let fSum = 0;
        function checkAll() {
            if($("#check_all").is(":checked")) {
                $("input[name=cartChecked]").prop("checked", true);
                let arr = new Array();
                let chks = document.getElementsByName("cartChecked");
                let cart = document.getElementsByName("cartAmount");
                for(let i = 0; chks.length; i++) {
                    console.log("parentElement: " +chs[i].parentElement);
                    str = chks[i].parentElement.nextElementSibling.nextElementSibling.
                    nextElementSibling.firstElementChild.textContent;
                    n = parseInt(str.replace(/,/g,""));
                    arr[i] = n;
                    fSum = arr[i] * cart[i].value;
                    sum += fSum;
                    console.log("sum:" +sum);
                }

                /* 배송비 결정 */
                delivery();
            } else {
                $("input[name=cartChecked]").prop("checked", false);
                sum = 0;
                dv = 0;
                    $(".delivery").text("+"+dv.toString());
            }
            $(".pr_Price").text(sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));  
            $(".orderPrice").text(sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));  
        }

            


        //선택삭제
        function checkDelete() {
            let url = "/cart/checkDelete";
            let valueArr = new Array();
            let list = $("input[name='cartChecked']");

            for(let i = 0; i < list.length; i++) {
                if(list[i].checked) {
                    //선택되어 있으면 배열에 값들을 저장함
                    console.log(list[i].value);
                    valueArr.push(list[i].value);
                }
            }
            
            if(valueArr.length === 0) {
                alert("선택된 상품이 없습니다.");
            } else {
                let chk = confirm("정말 삭제하시겠습니까?");
                $.ajax({
                    url : url, //전송 URL
                    type: 'POST',
                    traditional: true,
                    data: {
                        valueArr : valueArr //보내고자하는 data 변수 설정
                    },
                    success: function(jdata) {
                        if(jdata = 1) {
                            alert("삭제했습니다.");
                            location.replace("/cart/list"); //페이지 새로고침
                        } else {
                            alert("삭제 실패!");
                        }
                    }
                });
            }
        }

          

    </script>

</body>

</html>