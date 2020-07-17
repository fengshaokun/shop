new Vue({
    el: '#headerNav',
    data: {
        logoSrc: "",
        menuData: [],
        // current: "",
        currentMenuData: [],
        showdropdown: false,
        menuProducts: []
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
                console.log(req)
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
          this.currentMenuData = Object.assign({},this.menuData[index]);
          this.currentMenuData.current = 0;

           this.menuTo(0)
      },
      leaveDropdown(){//移出dropdown消失
          this.showdropdown = false;

      },
        menuTo(index){//移入二级菜单显示三级菜单
            var _this = this;
            console.log(this.currentMenuData.childMenu)
            var id = this.currentMenuData.childMenu[index].id;
            this.currentMenuData.current = index;
            $.ajax({
                url: "/home/menuProducts",    //请求的url地址
                dataType: "json",   //返回格式为json
                async: true,//请求是否异步，默认为异步，这也是ajax重要特性
                data: {"id": id},    //参数值
                type: "post",   //请求方式
                success: function (req) {
                    console.log(req)
                    _this.menuProducts = req.data;
                }
            })
        }
    }
 })

