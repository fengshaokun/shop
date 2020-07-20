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
        current: ""
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
          var collapse = document.querySelector(".navbar-toggle");
          var navbar = document.querySelector(".navbar-toggle");
          navbar.removeAttribute("aria-expanded")
          collapse.click();
      },
        collapseDown(){
          var navbar = document.querySelector(".navbar-toggle");
          var dropdown = document.querySelector(".dropdown");
          var isDrop = navbar.getAttribute("aria-expanded");
          // console.log(navbar.classList.contains('collapsed'))
          //   console.log(isDrop)
            console.log(this.menuData)
            console.log(this.current)
            console.log(this.menuData[this.current])
            // console.log(this.menuData[this.current].childMenu)
            if(this.current != "" && this.menuData[this.current].childMenu !== null && !navbar.classList.contains('collapsed')){
                console.log("没有展开")
                dropdown.style.display = "block";
            }else{
                dropdown.style.display = "none";
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
        }
    }
 })

