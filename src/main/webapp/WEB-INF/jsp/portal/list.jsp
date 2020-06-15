<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set value="${pageConext.request.contextPath}" var="ctx"></c:set>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="${ctx}/portal/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${ctx}/portal/assets/css/list.css" />
  </head>
  <body>

  <%-- 页面头部样式开始----------------------------------------------------------%>
  <jsp:include page="header.jsp"/>
  <%-- 页面头部样式结束---------------------------------------------------------%>
    <div class="list">
      <ul>
        <li class="listli">
          <img src="${ctx}/portal/assets/images/aaa.jpg" alt="" />
          <div class="mask">
            <img class="play" src="./assets/images/play.png" alt="" />
          </div>
          <div class="video">
            <div class="videodiv">
              <span class="close"></span>
              <video width="520" height="340" controls="controls">
                <source src="${ctx}/portal/assets/images/3.mp4" type="video/mp4" />
              </video>
            </div>
          </div>
          <a href="detail.jsp">
            <div class="listdetail">
              <div class="detailtt">JACE-8000 控制引擎</div>
              <div class="detaillabel">
                <!-- <div class="labeltt">产品标签</div> -->
                <ul>
                  <li>安全启动</li>
                  <li>可配置的无线模式</li>
                  <li>有电池</li>
                </ul>
              </div>
              <div class="detailinstruction">
                JACE-8000是一款嵌入式物联网（Internet of
                Things）控制引擎及服务器平台，可以用来连接多个设备和子系统，JACE-8000控制引擎提供了集成、监控、数据记录、报警、时间表和网络管理的功能，可以通过以太网或无线局域网远程传输数据和在标准Web浏览器进行图形显示。
              </div>
            </div>
          </a>
        </li>
        <li class="listli">
          <img src="assets/images/q111.jpg" alt="" />
          <div class="mask">
            <img class="play" src="${ctx}/portal/assets/images/play.png" alt="" />
          </div>
          <div class="video">
            <div class="videodiv">
              <span class="close"></span>
              <video width="520" height="340" controls="controls">
                <source src="assets/images/3.mp4" type="video/mp4" />
              </video>
            </div>
          </div>
          <a href="detail.jsp">
            <div class="listdetail">
              <div class="detailtt">JACE-8000 控制引擎</div>
              <div class="detaillabel">
                <!-- <div class="labeltt">产品标签</div> -->
                <ul>
                  <li>安全启动</li>
                  <li>可配置的无线模式</li>
                  <li>有电池</li>
                </ul>
              </div>
              <div class="detailinstruction">
                JACE-8000是一款嵌入式物联网（Internet of
                Things）控制引擎及服务器平台，可以用来连接多个设备和子系统，JACE-8000控制引擎提供了集成、监控、数据记录、报警、时间表和网络管理的功能，可以通过以太网或无线局域网远程传输数据和在标准Web浏览器进行图形显示。
              </div>
            </div>
          </a>
        </li>
        <li class="listli">
          <img src="${ctx}/portal/assets/images/ccc.jpg" alt="" />
          <a href="detail.jsp">
            <div class="listdetail">
              <div class="detailtt">JACE-8000 控制引擎</div>
              <div class="detaillabel">
                <!-- <div class="labeltt">产品标签</div> -->
                <ul>
                  <li>安全启动</li>
                  <li>可配置的无线模式</li>
                  <li>有电池</li>
                </ul>
              </div>
              <div class="detailinstruction">
                JACE-8000是一款嵌入式物联网（Internet of
                Things）控制引擎及服务器平台，可以用来连接多个设备和子系统，JACE-8000控制引擎提供了集成、监控、数据记录、报警、时间表和网络管理的功能，可以通过以太网或无线局域网远程传输数据和在标准Web浏览器进行图形显示。
              </div>
            </div>
          </a>
        </li>
        <li class="listli">
          <img src="${ctx}/portal/assets/images/680822.jpeg" alt="" />
          <a href="detail.jsp">
            <div class="listdetail">
              <div class="detailtt">JACE-8000 控制引擎</div>
              <div class="detaillabel">
                <!-- <div class="labeltt">产品标签</div> -->
                <ul>
                  <li>安全启动</li>
                  <li>可配置的无线模式</li>
                  <li>有电池</li>
                </ul>
              </div>
              <div class="detailinstruction">
                JACE-8000是一款嵌入式物联网（Internet of
                Things）控制引擎及服务器平台，可以用来连接多个设备和子系统，JACE-8000控制引擎提供了集成、监控、数据记录、报警、时间表和网络管理的功能，可以通过以太网或无线局域网远程传输数据和在标准Web浏览器进行图形显示。
              </div>
            </div>
          </a>
        </li>
        <li class="listli">
          <img src="${ctx}/portal/assets/images/aaa.jpg" alt="" />
          <div class="mask">
            <img class="play" src="assets/images/play.png" alt="" />
          </div>
          <div class="video">
            <div class="videodiv">
              <span class="close"></span>
              <video width="520" height="340" controls="controls">
                <source src="assets/images/3.mp4" type="video/mp4" />
              </video>
            </div>
          </div>
          <a href="detail.jsp">
            <div class="listdetail">
              <div class="detailtt">JACE-8000 控制引擎</div>
              <div class="detaillabel">
                <!-- <div class="labeltt">产品标签</div> -->
                <ul>
                  <li>安全启动</li>
                  <li>可配置的无线模式</li>
                  <li>有电池</li>
                </ul>
              </div>
              <div class="detailinstruction">
                JACE-8000是一款嵌入式物联网（Internet of
                Things）控制引擎及服务器平台，可以用来连接多个设备和子系统，JACE-8000控制引擎提供了集成、监控、数据记录、报警、时间表和网络管理的功能，可以通过以太网或无线局域网远程传输数据和在标准Web浏览器进行图形显示。
              </div>
            </div>
          </a>
        </li>
        <li class="listli">
          <img src="${ctx}/portal/assets/images/q111.jpg" alt="" />
          <div class="mask">
            <img class="play" src="assets/images/play.png" alt="" />
          </div>
          <div class="video">
            <div class="videodiv">
              <span class="close"></span>
              <video width="520" height="340" controls="controls">
                <source src="assets/images/3.mp4" type="video/mp4" />
              </video>
            </div>
          </div>

          <a href="detail.jsp">
            <div class="listdetail">
              <div class="detailtt">JACE-8000 控制引擎</div>
              <div class="detaillabel">
                <!-- <div class="labeltt">产品标签</div> -->
                <ul>
                  <li>安全启动</li>
                  <li>可配置的无线模式</li>
                  <li>有电池</li>
                </ul>
              </div>
              <div class="detailinstruction">
                JACE-8000是一款嵌入式物联网（Internet of
                Things）控制引擎及服务器平台，可以用来连接多个设备和子系统，JACE-8000控制引擎提供了集成、监控、数据记录、报警、时间表和网络管理的功能，可以通过以太网或无线局域网远程传输数据和在标准Web浏览器进行图形显示。
              </div>
            </div>
          </a>
        </li>
        <li class="listli">
          <img src="${ctx}/portal/assets/images/ccc.jpg" alt="" />

          <a href="detail.jsp">
            <div class="listdetail">
              <div class="detailtt">JACE-8000 控制引擎</div>
              <div class="detaillabel">
                <!-- <div class="labeltt">产品标签</div> -->
                <ul>
                  <li>安全启动</li>
                  <li>可配置的无线模式</li>
                  <li>有电池</li>
                </ul>
              </div>
              <div class="detailinstruction">
                JACE-8000是一款嵌入式物联网（Internet of
                Things）控制引擎及服务器平台，可以用来连接多个设备和子系统，JACE-8000控制引擎提供了集成、监控、数据记录、报警、时间表和网络管理的功能，可以通过以太网或无线局域网远程传输数据和在标准Web浏览器进行图形显示。
              </div>
            </div>
          </a>
        </li>
        <li class="listli">
          <img src="${ctx}/portal/assets/images/680822.jpeg" alt="" />
          <a href="">
            <div class="listdetail">
              <div class="detailtt">JACE-8000 控制引擎</div>
              <div class="detaillabel">
                <!-- <div class="labeltt">产品标签</div> -->
                <ul>
                  <li>安全启动</li>
                  <li>可配置的无线模式</li>
                  <li>有电池</li>
                </ul>
              </div>
              <div class="detailinstruction">
                JACE-8000是一款嵌入式物联网（Internet of
                Things）控制引擎及服务器平台，可以用来连接多个设备和子系统，JACE-8000控制引擎提供了集成、监控、数据记录、报警、时间表和网络管理的功能，可以通过以太网或无线局域网远程传输数据和在标准Web浏览器进行图形显示。
              </div>
            </div>
          </a>
        </li>
      </ul>
    </div>
    <div>
      <div class="pagebox">
        <div aria-label="Page navigation example">
          <ul class="pagination">
            <li class="page-item"><a class="page-link" href="#">第一页</a></li>
            <li class="page-item"><a class="page-link" href="#">上一页</a></li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">下一页</a></li>
            <li class="page-item">
              <a class="page-link" href="#">最后一页</a>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <script src="assets/js/jquery-3.1.1.min.js"></script>
    <script>
      $(".mask").on("click", function () {
        var hasvideo = $(this).parents(".listli").has(".video");
        if (hasvideo) {
          $(this).parents(".listli").find(".video").show();
        }
      });
      $(".close").on("click", function () {
        $(".video").hide();
      });
    </script>
  </body>
</html>
