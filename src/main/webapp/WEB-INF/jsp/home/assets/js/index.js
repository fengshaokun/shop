$(function () {



  $(window).scroll(function () {
    var h = $(this).scrollTop();//获得滚动条距top的高度
    if (h > 400) {
      $(".toTop").fadeIn();
    } else {
      $(".toTop").fadeOut();
    }
    $('.toTop').on('click', function () {
      // $('html').animate({scrollTop:0},500);//回到顶端
      // return false;
      window.scrollTo(0, 0)
    })
  })



  $(function () {
    var val = $('#searchParam').val();
    $('#param').val(val);
  })

})


