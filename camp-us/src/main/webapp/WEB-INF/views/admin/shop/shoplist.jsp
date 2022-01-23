<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt 쓸때 위와 같음. fmt : formatter 형식 맞춰서 표시 -->
<%@ include file="../../includes/adminheader.jsp"%>


         <div class="row mb-5">
            <div class="row">
               <div class="div-1">
                  <div class="col-md-12 mb-5">
                     <div class="float-md-left mb-4">
                        <h2 class="text-black h5">${category}</h2>
                     </div>
                     <div class="div-1">
                        <div class="d-flex">
                           <div class=" mr-1 ml-md-auto">
                              <button type="button" class="btn form-control border-0"
                                 id="registItem">상품등록</button>
                           </div>
                           <!-- <div class="btn-group">
                           <button type="button"
                              class="btn btn-secondary btn-sm dropdown-toggle"
                              id="dropdownMenuReference" data-toggle="dropdown">최신순</button>
                           <div class="dropdown-menu"
                              aria-labelledby="dropdownMenuReference">
                              <a class="dropdown-item" href="#">인기순</a> 
                           </div>
                        </div> -->
                        </div>
                     </div>
                  </div>
               </div> <!-- div-1 -->
               
               <div class="row mb-5">

                  <c:forEach var="item" items="${itemList}">
                     <input id="quantity" name="quantity" type="hidden" value="${item.quantity}">
                     <c:if test="${item.quantity >0}">
                        <div class="col-sm-6 col-lg-4 mb-4" data-aos="fade-up">
                           <div class="block-4 text-center border">
                              <figure class="block-4-image">
                                 <a href="${item.itemcode}" class="move"> <img
                                    src="/resources/images/cloth_1.jpg" alt="Image placeholder"
                                    class="img-fluid"></a>
                              </figure>
                              <div class="block-4-text p-4">
                                 <h3>
                                    <a href="${item.itemcode}" class="move"><c:out
                                          value="${item.itemname}" /></a>
                                 </h3>
                                 <p class="mb-0">
                                    <fmt:formatNumber value="${item.price}" pattern="#,###" />원
                                 </p>
                              </div>
                           </div>
                        </div>
                     </c:if>
                     <!-- 재고가 없을 때 Sold Out 표시 및 하이퍼링크 삭제 -->
                     <c:if test="${item.quantity eq 0}">
                        <div class="col-sm-6 col-lg-4 mb-4" data-aos="fade-up">
                           <div class="block-4 text-center border">
                              <figure class="block-4-image">
                                 <img src="/resources/images/cloth_1.jpg"
                                    alt="Image placeholder" class="img-fluid">
                              </figure>
                              <div class="block-4-text p-4">
                                 <h3>
                                    <c:out value="${item.itemname}" />
                                 </h3>
                                 <p class="mb-0">Sold Out</p>
                              </div>
                           </div>
                        </div>
                     </c:if>
                  </c:forEach>

               </div>
               
               <!-- 페이징처리 -->
               <div class="col-md-12 text-center">
                  <div class="site-block-27">
                     <ul>
                        <c:if test="${pageMaker.prev}">
                           <li class="page-item"><a href="${pageMaker.startPage-1}">&lt;</a></li>
                        </c:if>
                        <c:forEach var="num" begin="${pageMaker.startPage}"
                           end="${pageMaker.endPage}">
                           <li class='page-item ${pageMaker.cri.pageNum==num?"active":""}'><a href="${num}">${num}</a></li>
                        </c:forEach>
                        <c:if test="${pageMaker.next}">
                           <li class="page-item"><a href="${pageMaker.endPage+1}">&gt;</a></li>
                        </c:if>
                     </ul>
                  </div>
               </div>

               <form id="actionForm" action="/shop/itemList" method="get">
                  <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"> 
                  <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                  <input type="hidden" name="category" value="${pageMaker.cri.category}">
               </form>

            </div> <!-- div row -->
         </div> <!-- div row mb-5 -->
      </div> <!-- div container -->
   </div> <!-- div section -->
<script >
$(document).ready(function(){
   $(document).on("click","#registItem",function(){
      window.location.href="/admin/shop/registItem";
   });
});
</script>
<%@ include file="../../includes/adminfooter.jsp"%>

