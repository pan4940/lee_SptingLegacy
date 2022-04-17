<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <div id="accountDiv">
    <div id="head" class="col-12 col-lg-8">
    <h3><center>ACCOUNT DETAIL</center></h3>
  </div>
      <div id="center" >
        <div id="left" class="col-6 col-lg-4">
          <h4>account</h4>
          <p>${memberDTO.member_name}</p>
          <input type="button" id="EditBtn" value="회원정보수정"
        		  onclick="location.href='/member/modifyForm'"/>
          <input type="button" class="logoutBtn" value="Logout" />
        </div>

        <div id="right" class="col-6 col-lg-4">
          <h4>summary</h4>
          <ul>
            <!-- <li>
              <label>order</label><br />
              <span>원</span>/<span>숫자</span><br />
            </li> -->

            <li>
              <label>point</label><br />
              <span>${memberDTO.mileage}원</span><br />
            </li>

            <li>
              <label>coupon</label><br />
              <span>0</span>/
              <a id="iden" href="#">조회</a>
            </li>
          </ul>
        </div>
      </div>
    </div>
    

 
