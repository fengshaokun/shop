<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="assets/css/detail.css" />
  </head>
  <body>
    <div class="banner">
      <img src="assets/images/banner_meeting.png" alt="" />
    </div>
    <div class="play">
      <div class="playbtn">
        <img src="assets/images/playon.png" alt="" />
      </div>
      <div class="playon">播放视频</div>
    </div>
    <div class="video">
      <div class="videodiv">
        <span class="close"></span>
        <video width="520" height="340" controls="controls">
          <source src="assets/images/3.mp4" type="video/mp4" />
        </video>
      </div>
    </div>

    <script src="assets/js/jquery-3.1.1.min.js"></script>
    <script>
      $(".play").on("click", function () {
        $(".video").show();
      });

      $(".play").on("mouseover", function () {
        $(".play").animate({
          right: 0,
        });
      });

      $(".play").on("mouseleave", function () {
        $(".play").animate({
          right: -100,
        });
      });

      $(".close").on("click", function () {
        $(".video").hide();
      });
    </script>
  </body>
</html>
