$(function () {
  // 一级菜单
  $(".header li.headerli_case").on({
    mouseover: function () {
      $(".case").show();
    },
    mouseleave: function () {
      $(".case").hide();
    },
  });
  $(".case").on({
    mouseover: function () {
      $(".case").show();
    },
    mouseleave: function () {
      $(".case").hide();
    },
  });

  // 产品二级菜单
  $(".case .left_ul li").on("mouseover", function () {
    var index = $(this).data("to");
    // 添加hover样式
    $(this).addClass("right_li_hover").siblings().removeClass("right_li_hover");

    $(".case div.dropdownNav" + index).show();
    $(".case div.dropdownNav" + index)
      .siblings("div")
      .hide();
  });

  var data = [
    {
      title: "硬件",
      child: [
        {
          img: "./assets/images/bot_1.png",
          name: "采集控制",
          info: "xxx",
        },
        {
          img: "./assets/images/bot_1.png",
          name: "物联网中间件",
          info: "xxx",
        },
        {
          img: "./assets/images/bot_1.png",
          name: "传感器|计量装置",
          info: "xxx",
        },
        {
          title: "系统",
          child: [
            {
              img: "./assets/images/bot_1.png",
              name: "楼宇",
              info: "xxx",
            },
            {
              img: "./assets/images/bot_1.png",
              name: "工业",
              info: "xxx",
            },
            {
              img: "./assets/images/bot_1.png",
              name: "产品",
              info: "xxx",
            },
          ],
        },
        {
          title: "niagara驱动",
          child: [
            {
              img: "./assets/images/bot_1.png",
              name: "niagara驱动",
              info: "xxx",
            },
            {
              img: "./assets/images/bot_1.png",
              name: "niagara模块",
              info: "xxx",
            },
          ],
        },
      ],
    },
  ];
});
