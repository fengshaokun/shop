/*建议尺寸提示*/
$(".tips").mouseenter(function () {
    $(this).find(".tooltipDiv").show();
})
$(".tips").mouseleave(function () {
    $(this).find(".tooltipDiv").hide();
})
