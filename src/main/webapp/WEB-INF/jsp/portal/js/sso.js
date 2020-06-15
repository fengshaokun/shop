$(function () {
    function getCookie(name) {
        var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
        if (arr = document.cookie.match(reg))
            return decodeURI(arr[2]);
        else
            return null;
    }

    var token = getCookie("USER_TOKEN");
    //alert(token)
    $.ajax({
        type: "get",
        dataType: "jsonp",
        url: "http://localhost:8081/user/token/" + token,
        data: {},
        success: function (data) {
            console.info(data)
            if (data.data!=null){
                $("#userInfo").html(data.data.userName + ',' + " 欢迎您！");
            }else {
                $("#needLogin").removeClass("sr-only")
                return false
            }
            if(data.data.roleId == 1) {
                $("#buyerCenter").removeClass("sr-only")
            }else if(data.data.roleId == 2){
                $("#sellerCenter").removeClass("sr-only")
                $("#goods").removeClass("hidden")
            }


        }

    });


})

function loginOut() {
    $.ajax({
        type: "get",
        dataType: "jsonp",
        url: "http://localhost:8081/user/loginOut",
        data: {},
        success: function (data) {
            console.info(data)
            if(data.status==200){
                window.location.href="http://localhost:8087/portal/toMain"
            }
        }
    });
}