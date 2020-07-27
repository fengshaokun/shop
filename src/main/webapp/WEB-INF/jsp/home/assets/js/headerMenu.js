new Vue({
    el: '#headerNav',
    data: {
        logoSrc: "",
        menuData: [],
        // current: "",
        currentMenuData: [],
        showdropdown: false,
        menuProducts: [],
        menuShow: true,
        current: "",
        isUp: true,
        url: ""
    },
    created: function () {
        var _this = this;
        $.ajax({
            url: "/home/menuIndex", //请求的url地址
            dataType: "json", //返回格式为json
            async: true, //请求是否异步，默认为异步，这也是ajax重要特性
            data: {}, //参数值
            type: "post", //请求方式
            success: function (req) {
                _this.logoSrc = req.data.logo.src;
                _this.menuData = req.data.menu;
            }
        })
    },
    methods: {
      enter(index){//鼠标移入显示dropdown
        // console.log(index)
           if(index !== undefined){
               this.showdropdown = true;
           } else{
               this.showdropdown = false;
           }
           this.current = index;
          this.currentMenuData = Object.assign({},this.menuData[index]);
          this.currentMenuData.current = 0;
          this.menuTo(0)

      },
        enterclick(){

            var w = document.body.clientWidth;
            console.log(w)
            if(w<780){
                var collapse = document.querySelector(".navbar-toggle");
                collapse.click();
            }


        },
          leaveDropdown(){//移出dropdown消失
              this.showdropdown = false;

          },
        menuTo(index){//移入二级菜单显示三级菜单
            var _this = this;
            if (this.currentMenuData.childMenu==null) return this.showdropdown = false;
            var id = this.currentMenuData.childMenu[index].id;
            this.currentMenuData.current = index;
            $.ajax({
                url: "/home/menuProducts",    //请求的url地址
                dataType: "json",   //返回格式为json
                async: true,//请求是否异步，默认为异步，这也是ajax重要特性
                data: {"id": id},    //参数值
                type: "post",   //请求方式
                success: function (req) {
                    _this.menuProducts = req.data;
                }
            })
        },
        todetail(index){
          var id = this.menuProducts[index].id;
          window.location.href = "/home/productDetails?id="+id;
        },
        isVisible(el) {
            var loopable = true,
                visible = getComputedStyle(el).display != 'none' && getComputedStyle(el).visibility != 'hidden';

            while(loopable && visible) {
                el = el.parentNode;

                if(el && el != document.body) {
                    visible = getComputedStyle(el).display != 'none' && getComputedStyle(el).visibility != 'hidden';
                }else {
                    loopable = false;
                }
            }

            return visible;
        }
    }
 })

