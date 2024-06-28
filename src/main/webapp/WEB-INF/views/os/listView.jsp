<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

 <c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="${contextPath}/resources/js/cmmn/commonUtil.js" ></script>
    <script src="${contextPath}/resources/js/os/post.js" ></script>
    <script type="text/javascript" charset="utf-8">
         sessionStorage.setItem("contextPath", '${contextPath}');
    </script>

<title>Insert title here</title>

<style>

.tbl_type,.tbl_type th,.tbl_type td{border:0}
.tbl_type a{color:#383838;text-decoration:none}
.tbl_type{width:100%;border-bottom:1px solid #999;color:#666;font-size:12px;table-layout:fixed}
.tbl_type caption,.tbl_type .frm label{display:none}
.tbl_type th{padding:5px 0 4px;border-top:solid 1px #999;border-bottom:solid 1px #b2b2b2;background-color:#f1f1f4;color:#333;font-weight:bold;line-height:18px;vertical-align:top}
.tbl_type td{padding:8px 0 5px;border-bottom:solid 1px #d2d2d2;text-align:center}
.tbl_type .frm{padding:0;text-align:center}
.tbl_type .frm input{margin:0}
.tbl_type .num,.tbl_type .date,.tbl_type .hit{padding:0;font-family:Tahoma;font-size:11px;line-height:normal}
.tbl_type .title{text-align:left}
.tbl_type .title .pic,.tbl_type .title .new{margin:0 0 2px;vertical-align:middle}
.tbl_type tr.reply .title a{padding-left:12px;background:url(img/ic_reply.gif) 0 1px no-repeat}
.tbl_type tr.reply td a.comment{padding:0;background:none;color:#f00;font-size:12px;font-weight:bold}


</style>
</head>
<body>


    <img src="${contextPath}/images/egovframework/cmmn/apeach2.png" alt="카카오톡" class="tit_icon">

    <div>
        <form action="/os/search" method="post" id="searchForm" enctype="application/x-www-form-urlencoded">
            <select name="searchType">
                <option value="">검색구분</option>
                <option value="boardTitle">제목</option>
                <option value="userName">글쓴이</option>
            </select>
            <input type="text" name="searchWord" id="searchWord" placeholder="입력해주세요." />
            <button type="submit" id="search_btn">검색</button>
        </form>
    </div>
    <div id = "list-table">
        <table cellspacing="0" border="1" summary="게시판의 글제목 리스트" class="tbl_type">
            <caption>게시판 리스트</caption>
                <colgroup>
                    <col width="30"><col width="80"><col>
                    <col width="115"><col width="85"><col width="60">
                </colgroup>
                <thead>
                    <tr>
                    <th scope="col">No</th>
                    <th scope="col">제목</th>
                    <th scope="col">글쓴이</th>
                    <th scope="col">날짜</th>
                    <th scope="col">조회수</th>
                    </tr>
                </thead>
                <tbody>
                     <c:forEach var = "post" items = "${postList}">
                        <tr>
                            <td class="num">${post.boardNo}</td>
                            <td class="title" onclick = $post.event.detailView(${post.boardNo}) >${post.boardTitle}</td>
                            <td class="username" >${post.userName}</td>
                            <td class="date">${post.boardDate}</td>
                            <td class="hit">1234</td>
                        </tr>
                     </c:forEach>
                </tbody>
        </table>
    </div>
        <div>
            <br>
            <br>


            <div class="card" id = "cardBox" style="width: 18rem;display:none">
              <img src="${contextPath}/images/egovframework/cmmn/kakao.png" alt="카카오톡" class="tit_icon">
              <div class="card-body" id = "cardBody"></div>
            </div>

        </div>


</body>
</html>