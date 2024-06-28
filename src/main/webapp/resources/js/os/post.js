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
            })

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

    };


}(window,document,jQuery))