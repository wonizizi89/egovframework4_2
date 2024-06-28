<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<t1>⭐👍🍎🍎🍎🍎🍎🍎🍎</t1>

    <div>
    <input type = "text" id = "seachCond"/>
    <input type = "text" id = "seachWord"/>
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
                    <th scope="col">&nbsp;</th>
                    <th scope="col">No</th>
                    <th scope="col">제목</th>
                    <th scope="col">글쓴이</th>
                    <th scope="col">날짜</th>
                    <th scope="col">조회수</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="frm"><input type="checkbox" name="" id="chk_sel" value=""><label for="chk_sel">선택</label></td>
                        <td class="num">10</td>
                        <td class="title"><a href="#">새로운 게시판 글쓰기 새로운 게시판 글쓰기 새로운 게시판 글쓰기 새로운 게시판 글쓰기 새로운 게시판 글쓰기 새로운 게시판 글쓰기</a></td>
                        <td><a href="#">네이버맨</a></td>
                        <td class="date">2008/02/14</td>
                        <td class="hit">1234</td>
                    </tr>
                        <tr class="reply">
                        <td class="frm"><input type="checkbox" name="" id="chk_sel2" value=""><label for="chk_sel2">선택</label></td>
                        <td class="num">&nbsp;</td>
                        <td class="title" style="padding-left:10px;"><a href="#">블로그 개편 답글</a></td>
                        <td><a href="#">네이버맨</a></td>
                        <td class="date">2008/02/14</td>
                        <td class="hit">1234</td>
                    </tr>
                        <tr class="reply">
                        <td class="frm"><input type="checkbox" name="" id="chk_sel3" value=""><label for="chk_sel3">선택</label></td>
                        <td class="num">&nbsp;</td>
                        <td class="title" style="padding-left:20px;"><a href="#">블로그 개편 답글</a></td>
                        <td><a href="#">네이버맨</a></td>
                        <td class="date">2008/02/14</td>
                        <td class="hit">1234</td>
                    </tr>
                        <tr class="reply">
                        <td class="frm"><input type="checkbox" name="" id="chk_sel4" value=""><label for="chk_sel4">선택</label></td>
                        <td class="num">&nbsp;</td>
                        <td class="title" style="padding-left:30px;"><a href="#">블로그 개편 답글</a> <img src="img/ic_pic.gif" width="13" height="12" alt="첨부이미지" class="pic"> <a href="#" class="comment">[5]</a> <img src="img/ic_new.gif" width="10" height="9" alt="새글" class="new"></td>
                        <td><a href="#">네이버맨</a></td>
                        <td class="date">2008/02/14</td>
                        <td class="hit">1234</td>
                        </tr>
                        <tr>
                        <td class="frm"><input type="checkbox" name="" id="chk_sel5" value=""><label for="chk_sel5">선택</label></td>
                        <td class="num">9</td>
                        <td class="title"><a href="#">블로그 개편 작업 일정 1</a></td>
                        <td><a href="#">UIT랩</a></td>
                        <td class="date">2008/02/14</td>
                        <td class="hit">12345</td>
                    </tr>
                    <tr>
                        <td class="frm"><input type="checkbox" name="" id="chk_sel6" value=""><label for="chk_sel6">선택</label></td>
                        <td class="num">8</td>
                        <td class="title"><a href="#">블로그 개편 작업 일정 1</a></td>
                        <td><a href="#">UIT랩</a></td>
                        <td class="date">2008/02/14</td>
                        <td class="hit">12345</td>
                        </tr>

                </tbody>
        </table>
    </div>

</body>
</html>