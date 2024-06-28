
var contextPath = sessionStorage.getItem("contextPath");


function ajax (isLoadingBool,url,ajaxParam,fn_success,fn_complete){

//            var header = $("meta[name='_csrf_header']").attr("content");
//            var token = $("meta[name = '_csrf']").attr.("content");/// 여기서 부터

        $.ajax({
            url : url,
            type : 'POST',
            contentType : "application/json; charset=UTF-8",
            data : JSON.stringify(ajaxParam),
            dataType : "json",
            beforeSend:function(xhr){
                            $('body').append(`
                                             <div id = "ajax_load_img" style = "position:fixed; top: 45%; left: 45%; ">
                                                <img src= "${contextPath}/images/egovframework/cmmn/loading1.gif" alt="로딩중" class="tit_icon">
                                             </div>
                                `)
            },
            success : function(data){
                if(fn_success != null || fn_success != undefined){
                     fn_success(data);
                }

            },
           error: function(request,status, error){
                   alert("code:"+request.status+ "\n"+"message:"+request.responseText+"\n"+"error:"+error);
           },
//            error: function(xhr,textStatus){
//                if(xhr.status == 401){
//                    alert("권한이 없습니다. 사용자 인증이 필요합니다." );
//                }else if(xhr.status == 403){
//                    alert("세션이 만료되었습니다. 다시 로그인 하세요. \n"+textStatus);
//                    location.href = '/';
//                }else{
//                    alert("처리 중 에러가 발생하였습니다.");
//                }
//            },
            complete: function(xhr){
                if(isLoadingBool){
                    $('#ajax_load_img').remove();
                }
                if(fn_complete != null || fn_complete != undefined){
                    fn_complete(xhr);
                }
            }
        });
}


function SyncAjax(url,data){
    $.ajax({
        url:url,
        async:"false",
        type:"post",
        dataType : "json",
        contentType: "application/json",
        data: data,
        timeout:10000,
        beforeSend:function(){
        },
        success : function(data){
            console.log("data",data);
        },
        error: function(request,status, error){
            alert("code:"+request.status+ "\n"+"message:"+request.responseText+"\n"+"error:"+error);
        },
        complete: function(){

        }
    });
}


function convertUnixToDate(unixTime){
    var date = new Date(unixTime);
    var year = date.getFullYear();
    var month = String(date.getMonth()+1).padStart(2,'0');
    var day = String(date.getDate()).padStart(2,'0');
    var DateTime = year + "-" + month + "-" + day ;
    return DateTime;
}
