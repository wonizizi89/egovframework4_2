(function (W,D,$){
  // bjlee, IE 10 부터 지원하는 strict mode 선언. 안전하지 않은 액션들에 대해 예외를 발생시킴
    'use strict';

    W.$post = W.$post || {};

    $(document).ready(function(){
        $post.ui.pageLoad();
        $post.event.setUIEvent();

    });

    $post.ui = {
        pageLoad: function(){
            console.log("start");
        },



    };

    $post.event = {

        setUIEvent: function(){
            $("#search_btn1").on("click",function(){
               $("#cardBox").css("display","block");
            });


           $("#testTbody").on("click",function(e){
               var selectedRow = e.target.closest('tr');
               var boardNo = Number( selectedRow.querySelector('.num').textContent);
               $post.event.detailView(boardNo);
            });

           $("#postSave_poppup_btn").on("click",function(){
             $("#postBox").css("display","block");
            });

           $("#postSave_btn").on("click",function(){
                var boardTitle = $('#boardTitle').val();
                var boardContent = $('#boardContent').val();
                var username = $('#username').val();
                var param = {
                             boardTitle : boardTitle,
                             boardContent : boardContent,
                             username : username,
                }
               console.log("contextPath",contextPath);
               ajax(true,contextPath+'os/postSave',param,function(data){
                    var data = data.message;
                    alert(data);
                    $post.event.closePopup();
                    location.reload();
               });
           });
        },



        detailView: function(boardNo){
            $("#cardBody").empty();
            var param = {boardNo:boardNo};
            ajax(true,contextPath+"/os/detailView",param,function(data){
            var data = data.data;
            console.log("data",data);
            var boardDate = convertUnixToDate(data.boardDate);
            $("#cardBox").css("display","block");
            $("#cardBody").append(`
                <h5 class="card-title">제목 : ${data.boardTitle}</h5>
                <p class="card-text" >내용 : ${data.boardContent}</p>
                <p class="card-text" >작성일자: ${boardDate}</p>
                <a href="#" class="btn btn-primary">이름 : ${data.userName}</a>
            `);
          });
        },

        closePopup: function(){
              $('#boardTitle').val('');
              $('#boardContent').val('');
              $('#username').val('');
              $("#postBox").css("display","none");
        },

    };


}(window,document,jQuery))