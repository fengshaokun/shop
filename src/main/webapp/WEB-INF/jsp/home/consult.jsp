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
        <p>联系我们</p>
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
<!-- Modal -->
<div class="modal fade" id="suspensionModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">联系我们</h4>
<%--                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
            </div>
            <div class="modal-body">
                <p>您的联系方式:</p>
                <div class="contactInfo">
                    <input type="text" placeholder="姓名.." id="name">
                    <input type="text" placeholder="电话.." id="tel">
                    <input type="text" placeholder="邮箱.." id="email">
                    <input type="text" placeholder="公司名称.." id="company">
                </div>
                <p>咨询内容:</p>
                <div class="consultInfo">
                    <textarea name="" id="content" cols="30" rows="10" placeholder="请输入咨询内容.."></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" onclick="upLoad()">提交</button>
            </div>
        </div>
    </div>
</div>

<script>
    function upLoad() {
        var name = $('#name').val();
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
                    toastr.success("提交成功")
                    $('#suspensionModal').modal('hide')
                }
            },
            error: function () {

            }
        });
    }
</script>