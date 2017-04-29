(function($){
$.fn.extend({
        Scroll:function(opt,callback){
                //参数初始化
                if(!opt) var opt={};
                var _this=this.eq(0).find("ul:first");
                var        lineH=_this.find("li:first").height(), //获取行高
                        line=opt.line?parseInt(opt.line,10):parseInt(this.height()/lineH,10), 
                        speed=opt.speed?parseInt(opt.speed,10):500, //卷动速度，数值越大，速度越慢（毫秒）
                        timer=opt.timer?parseInt(opt.timer,10):3000; // 滚动的时间间隔（毫秒）锛?
                if(line==0) line=1;
                var upHeight=0-line*lineH;
                //滚动函数
                scrollUp=function(){
                        _this.animate({
                                marginTop:upHeight
                        },speed,function(){
                                for(i=1;i<=line;i++){
                                        _this.find("li:first").appendTo(_this);
                                }
                                _this.css({marginTop:0});
                        });
                }
                //鼠标事件绑定
                _this.hover(function(){
                        clearInterval(timerID);
						var objLength = $(this).eq(0).find("li a:first").text().length;
						//var objWidth = $(this).eq(0).find("li a:first").width();
						//alert(objWidth);
			  			if(objLength > 19){
							$(".rollingnews").css("background-position","2px -42px").css("height","44px");
							$("#rolling").css("height","42px");
							$("#rolling li").css("height","42px");	
					}
                },function(){
                        timerID=setInterval("scrollUp()",timer);
						$(".rollingnews").css("background-position","2px -2px").css("height","21px");
						$("#rolling").css("height","21px");
						$("#rolling li").css("height","21px");
                }).mouseout();
        }       
})
})(window.jQuery);

(function() {
    $filterBox = $(".filterBox")
    $filterBoxFun = function() {
        var st = $(document).scrollTop(), winh = $(window).height();  
        //IE6下的定位
        if (!window.XMLHttpRequest) {
            $filterBox.css("top", st + winh - 240);    
        }
    };
    $(function() { $filterBoxFun(); });
})(window.jQuery);