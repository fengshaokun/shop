<%--
  Created by IntelliJ IDEA.
  User: fengshaokun
  Date: 2020/6/22
  Time: 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- 咨询悬浮框 -->
<div class="suspensionBox">
    <!-- 二维码 -->
    <div class="qrCode">
        <img src="/home/assets/images/qrCodeLx.png" alt="">
        <p>微信</p>
        <p>公众号</p>
        <div class="qrCodeHidden">
            <img src="" alt="">
        </div>
    </div>
    <!-- 咨询 -->
    <div class="suspension" data-toggle="modal" data-target="#suspensionModal">
        <img src="/home/assets/images/lianxi.png" alt="">
        <p>咨询</p>
    </div>
    <div class="toTop">
        <img src="/home/assets/images/toTop.png" alt="">
    </div>
</div>
<!-- 隐藏部分 -->
<!-- Modal -->
<div class="modal fade" id="suspensionModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">联系我们</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">
                <p>您的联系方式:</p>
                <div class="contactInfo">
                    <div>
                        <span>姓名:</span>
                        <input type="text" name="name" id="name" value="" class="name" placeholder="姓名..">
                        <span class="name_hint"></span>
                    </div>
                    <div>
                        <span>电话:</span>
                        <input type="text" name="tel" value="" id="tel" class="phone" placeholder="电话..">
                        <span class="phone_hint"></span>
                    </div>
                    <div>
                        <span>邮箱:</span>
                        <input type="text" id="email" name="email" value="" class="emaile" placeholder="邮箱..">
                        <span class="emaile_hint"></span>
                    </div>
                    <div>
                        <span>公司名称:</span>
                        <input type="text" name="company" id="company" value="" class="companyInfo" placeholder="公司名称..">
                        <span class="companyInfo_hint"></span>
                    </div>
                </div>
                <p>咨询内容:</p>
                <div class="contactInfo">
                    <div>
              <textarea name="content" class="contactInfoText" value="" id="content" cols="30" rows="10"
                        placeholder="请输入咨询内容.."></textarea>
                        <span class="contactInfo_hint"></span>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="submit">提交</button>
            </div>
        </div>
    </div>
</div>
<script>
    $(function(){
        // 验证
        var name_Boolean = false;
        var phone_Boolean = false;
        var emaile_Boolean = false;
        var companyInfo_Boolean = false;
        var contactInfo_Boolean = false;
        // 姓名
        $('.name').blur(function () {
            if ($('.name').val()) {
                $('.name_hint').html("√").css("color", "green");
                name_Boolean = true;
            } else {
                $('.name_hint').html("x").css("color", "red");
                name_Boolean = false;
            }
        });
        // 电话
        $('.phone').blur(function () {
            if ((/^(13[0-9]{9}$|14[0-9]{9}|15[0-9]{9}$|18[0-9]{9})$|(^(0\d{10})|^(0\d{2}-\d{8}))$/).test($(".phone").val())) {
                $('.phone_hint').html("√").css("color", "green");
                phone_Boolean = true;
            } else {
                $('.phone_hint').html("x").css("color", "red");
                phone_Boolean = false;
            }
        });
        // 邮箱
        $('.emaile').blur(function () {
            console.log($('.emaile').val())
            if ((/^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/).test($(".emaile").val())) {
                $('.emaile_hint').html("√").css("color", "green");
                emaile_Boolean = true;
            } else {
                $('.emaile_hint').html("x").css("color", "red");
                emaile_Boolean = false;
            }
        });
        // 公司名称
        $('.companyInfo').blur(function () {
            if ($('.companyInfo').val()) {
                $('.companyInfo_hint').html("√").css("color", "green");
                companyInfo_Boolean = true;
            } else {
                $('.companyInfo_hint').html("x").css("color", "red");
                companyInfo_Boolean = false;
            }
        });
        // 咨询内容
        $('.contactInfoText').blur(function () {
            if ($('.contactInfoText').val()) {
                $('.contactInfo_hint').html("√").css("color", "green");
                contactInfo_Boolean = true;
            } else {
                $('.contactInfo_hint').html("x").css("color", "red");
                contactInfo_Boolean = false;
            }
        });
        // click
        $('#submit').click(function () {
            if (name_Boolean && phone_Boolean && emaile_Boolean && companyInfo_Boolean && contactInfo_Boolean == true) {

                upLoad();
                alert("提交成功");
            } else {
                alert("请完善信息");
            }
        });
    })
    function upLoad() {
        var name = $('.name').val();
        var tel = $('#tel').val();
        var email = $('#email').val();
        var company = $('#company').val();
        var content = $('#content').val();
        $.ajax({
            url: "/home/addUserConsult", //请求的url地址
            dataType: "json", //返回格式为json
            async: true,//请求是否异步，默认为异步，这也是ajax重要特性
            data: {
                "name": name,
                "tel": tel,
                "email": email,
                "company": company,
                "content": content
            }, //参数值
            type: "post", //请求方式
            success: function (req) {
                if (req.status == 200) {
                    $('#suspensionModal').modal('hide')
                }
            },
            error: function () {

            }
        });
    }
    





</script>