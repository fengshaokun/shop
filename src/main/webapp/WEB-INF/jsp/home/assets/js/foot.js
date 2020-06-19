$(function () {
    $.ajax({
        url:"/home/footIndex",    //请求的url地址
        dataType:"json",   //返回格式为json
        async:true,//请求是否异步，默认为异步，这也是ajax重要特性
        data:{},    //参数值
        type:"post",   //请求方式
        success:function(req) {
            if (req.status==200){
                $('.companyIntroduction .c1').after(req.data.leftText)
                $('.companyMessage .c2').after(req.data.rightText)
                console.log(req.data)
            }
        },
        error:function () {

        }

});})

