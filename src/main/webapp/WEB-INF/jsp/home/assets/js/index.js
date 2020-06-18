$(function () {
  $(function(){
    $.ajax({
      url:"/home/menuIndex",    //请求的url地址
      dataType:"json",   //返回格式为json
      async:true,//请求是否异步，默认为异步，这也是ajax重要特性
      data:{},    //参数值
      type:"post",   //请求方式
      success:function(req){
        for(var i =0,l = req.length;i<l;i++) {
          $('.header>ul .headerli:nth-last-of-type(2)').before('<li class="headerli headerli_case" data-index="'+i+'">\n' +
              ' <span>' + req[i].principal + '</span>\n' +
              ' <span class="arrow"></span>\n' +
              ' </li>');
        }

        console.log(req);
        //请求成功时处理
        // 一级菜单
        $(".header li.headerli_case").on({
          "mouseover": function () {
            var index = $(this).data('index');
            $('ul.left_ul').empty();
            $('ul.right_ul').empty();
            for(var i =0,l = req[index].childMenu.length;i<l;i++){
              if(i == 0){
                $('ul.left_ul').append('<li data-id="'+req[index].childMenu[i].id+'" data-to="'+i+'" class="right_li right_li_hover">\n' +
                    ' <span>'+req[index].childMenu[i].principal+'</span>\n' +
                    ' </li>')
              }else{
                $('ul.left_ul').append('<li data-id="'+req[index].childMenu[i].id+'" data-to="'+i+'" class="right_li">\n' +
                    ' <span>'+req[index].childMenu[i].principal+'</span>\n' +
                    ' </li>')
              }
            }
            $('.case').show();

            $.ajax({
              url:"/home/menuProducts",    //请求的url地址
              dataType:"json",   //返回格式为json
              async:true,//请求是否异步，默认为异步，这也是ajax重要特性
              data:{"id":req[index].childMenu[0].id},    //参数值
              type:"post",   //请求方式
              success:function(req){
                console.log(req.data)
                if (req.status==200){
                  for(var i =0,l = req.data.length;i<l;i++) {
                    $('ul.right_ul').append('<li>\n' +
                        '<img src="'+req.data[i].icon+'" alt="">\n' +
                        '<p>'+req.data[i].name+'</p>\n' +
                        '<p>'+req.data[i].tag+'</p>\n' +
                        '<!-- <a href="">采集控制</a> -->\n' +
                        '</li>')
                  }
                }
              },
              error:function(){

              }
            });

            $(".case ul.left_ul li").mouseover( function () {
              $('ul.right_ul').empty();
              var index = $(this).data('to');
              var id = $(this).data('id');
                  $.ajax({
                    url:"/home/menuProducts",    //请求的url地址
                    dataType:"json",   //返回格式为json
                    async:true,//请求是否异步，默认为异步，这也是ajax重要特性
                    data:{"id":id},    //参数值
                    type:"post",   //请求方式
                    success:function(req){
                      console.log(req.data)
                   if (req.status==200){
                     for(var i =0,l = req.data.length;i<l;i++) {
                       $('ul.right_ul').append('<li>\n' +
                           '<img src="'+req.data[i].icon+'" alt="">\n' +
                           '<p>'+req.data[i].name+'</p>\n' +
                           '<p>'+req.data[i].tag+'</p>\n' +
                           '<!-- <a href="">采集控制</a> -->\n' +
                           '</li>')
                     }
                   }
                    },
                    error:function(){

                    }
                  });

              // 添加hover样式
              $(this).addClass('right_li_hover').siblings().removeClass('right_li_hover');

              // $('.case div.dropdownNav' + index).show();
              // $('.case div.dropdownNav' + index).siblings('div').hide();
            });
          },
          "mouseleave": function () {
            $('.case').hide();
          }
        });


        $('.case').on({
          "mouseover": function () {
            $('.case').show();
          },
          "mouseleave": function () {
            $('.case').hide();
          },

        });




        // // 产品二级菜单

      },
      error:function(){
        //请求出错处理
        alert(123)
      }
    });

  })

  // 页面刷新时滚动条在顶部
  // window.scrollTo(0,0);
  // 一级菜单
  // $(".header li.headerli_case").on({
  //   "mouseover": function () {
  //     console.log(111)
  //     $('.case').show();
  //   },
  //   "mouseleave": function () {
  //     $('.case').hide();
  //   }
  // });
  // $('.case').on({
  //   "mouseover": function () {
  //     $('.case').show();
  //   },
  //   "mouseleave": function () {
  //     $('.case').hide();
  //   },
  //
  // })
  //
  // // // 产品二级菜单
/*  $('.case .left_ul li').on('mouseover', function () {
    var index = $(this).data('to');
    // 添加hover样式
    $(this).addClass('right_li_hover').siblings().removeClass('right_li_hover');

    $('.case div.dropdownNav' + index).show();
    $('.case div.dropdownNav' + index).siblings('div').hide();
  });*/
//
//   // 返回顶部
//   $(window).scroll(function(){
//     var h=$(this).scrollTop();//获得滚动条距top的高度
//     if(h>400){
//       $(".toTop").fadeIn();
//   }else{
//       $(".toTop").fadeOut();
//   }
//   $('.toTop').on('click',function(){
//     $('html,body').animate({scrollTop:0},500);//回到顶端
//   })
// });
})