$(function () {
  // 页面刷新时滚动条在顶部
  // window.scrollTo(0,0);
  // 一级菜单
  $(".header li.headerli_case").on({
    "mouseover": function () {
      $('.case').show();
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

  })

  // 产品二级菜单
  $('.case .left_ul li').on('mouseover', function () {
    var index = $(this).data('to');
    // 添加hover样式
    $(this).addClass('right_li_hover').siblings().removeClass('right_li_hover');

    $('.case div.dropdownNav' + index).show();
    $('.case div.dropdownNav' + index).siblings('div').hide();
  });

  // 返回顶部
  $(window).scroll(function(){
    var h=$(this).scrollTop();//获得滚动条距top的高度
    if(h>400){
      $(".toTop").fadeIn();
  }else{
      $(".toTop").fadeOut();
  }
  $('.toTop').on('click',function(){
    $('html,body').animate({scrollTop:0},500);//回到顶端
  })
});
})