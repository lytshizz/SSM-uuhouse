<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div id="selection" style="z-index: 17;">
	<div class="relative relative_show">
		<dl class="secitem" id="region">
			<dt>区域：</dt>
			<dd>
				<a
					href="${pageContext.request.contextPath}/house_findByPage.action?page=1">全西安</a>
				<!-- 所有区域名称 -->
				<input type="checkbox" name="village" id="village" value="雁塔">雁塔
				<input type="checkbox" name="village" id="village" value="碑林">碑林
				<input type="checkbox" name="village" id="village" value="莲湖">莲湖
				<input type="checkbox" name="village" id="village" value="莲湖">新城
				<input type="checkbox" name="village" id="village" value="莲湖">未央
				<input type="checkbox" name="village" id="village" value="莲湖">临潼
				<input type="checkbox" name="village" id="village" value="莲湖">高新区
				<input type="checkbox" name="village" id="village" value="莲湖">曲江新城
				<input type="checkbox" name="village" id="village" value="莲湖">杨凌
				<input type="checkbox" name="village" id="village" value="莲湖">西安周边
			</dd>
		</dl>



		<!-- 按总价 -->
		<dl class="secitem" id="price_secitem1" style="">
			<dt>总价：</dt>
			<dd>
				<input type="radio" name="countprice" id="countprice" value="-1" checked="checked">不限
				<input type="radio" name="countprice" id="countprice" value="30">30万以下
				<input type="radio" name="countprice" id="countprice" value="50">30-50万
				<input type="radio" name="countprice" id="countprice" value="80">50-80万
				<input type="radio" name="countprice" id="countprice" value="100">80万以上
				<input type="radio" name="countprice" id="countprice" value="-2">其他
				<span class="text text2"><input
						type="text" name="price1" muti="1" min="0" max="999999"
						name="b_q" autocomplete="off"></span><span class="dev"> -
				</span><span class="text text2"><input type="text"
						name="price2" muti="1" min="0" max="999999" name="b_q"
						autocomplete="off"></span><span class="dev">万</span><span
					class="btn btn2" style="display:none"><input type="button"
						value="价格筛选"></span></span>
			</dd>
		</dl>

		<!-- 按单价 -->
		<dl class="secitem" id="price_secitem2" style="display:none">
			<dt>总价：</dt>
			<dd>
				<a href="/ershoufang/e4k3/"
					onclick="clickLog('from=fc_esflist_xa_price_');">不限</a> <a
					href="/ershoufang/e4i10k3/"
					onclick="clickLog('from=fc_esflist_xa_price_0_100');">100万以下</a> <a
					href="/ershoufang/e4i11k3/"
					onclick="clickLog('from=fc_esflist_xa_price_100_150');">100-150万</a>
				<a href="/ershoufang/e4i12k3/" class="select" name="b_link"
					para="paras" ck="i12"
					onclick="clickLog('from=fc_esflist_xa_price_150_200');">150-200万</a>
				<a href="/ershoufang/e4i13k3/"
					onclick="clickLog('from=fc_esflist_xa_price_200_300');">200-300万</a>
				<a href="/ershoufang/e4i14k3/"
					onclick="clickLog('from=fc_esflist_xa_price_300_400');">300-400万</a>
				<a href="/ershoufang/e4i15k3/"
					onclick="clickLog('from=fc_esflist_xa_price_400_550');">400-550万</a>
				<a href="/ershoufang/e4i16k3/"
					onclick="clickLog('from=fc_esflist_xa_price_550_700');">550-700万</a>
				<a href="/ershoufang/e4i17k3/"
					onclick="clickLog('from=fc_esflist_xa_price_700_900');">700-900万</a>
				<a href="/ershoufang/e4i18k3/"
					onclick="clickLog('from=fc_esflist_xa_price_900_99999');">900万以上</a>
			</dd>
		</dl>
		<script type="text/javascript">
			(function($) {
				$.getUrlParams = function() {
					var ret = {},
						seg = window.location.search.replace(/^\?/, '').replace(/%7C/g, '|').split('&'),
						len = seg.length,
						i = 0,
						s;
					for (; i < len; i++) {
						if (!seg[i]) {
							continue;
						}
						s = seg[i].split('=');
						ret[s[0]] = s[1];
					}
					return ret;
				}
			})(jQuery);
		
			(function() {
				var url_pars = $.getUrlParams();
				if (url_pars['huansuan']) {
					$('#price_secitem2').show();
				} else {
					$('#price_secitem1').show();
				}
			})();
		
			var mutexs = [ {
				searchitem : /i\d+/,
				params : [ "minprice" ],
				searthname : '总价'
			} ];
			boot.require('util.uri', function(Frame, uri) {
				for (var i = 0, leni = mutexs.length; i < leni; i++) {
					var mutex = mutexs[i];
					var pobj = {};
					for (var j = 0, lenj = mutex.params.length; j < lenj; j++) {
						pobj[mutex.params[j]] = null;
					}
		
					for (var l = 0, lenl = mutex.params.length; l < lenl; l++) {
						var pitem = $("#selection .secitem dt:contains(" + mutex.searthname + ")").parent();
						if (window.location.search.indexOf(mutex.params[l]) != -1) {
							pitem.find(".select").removeClass("select");
						}
		
						pitem.find("a").each(function() {
							var o = {};
							o[mutex.params] = null;
							// this.href = (new uri(this.href)).setQuery(o);
							var pricehref = (new uri(this.href)).setQuery(o);
							var host = '';
							(pricehref.port.length == 0) ? (host = pricehref.hostname) : (host = pricehref.hostname + ':' + pricehref.port);
							if (host) {
								var inx = host.length + this.href.indexOf(host);
								this.href = this.href.substr(inx);
							}
						});
		
					}
				}
			});
		</script>

		<dl class="secitem" id="mianji">
			<dt>面积：</dt>
			<dd>

				<input type="radio" name="area" id="area" value="-1" checked="checked">不限
				<input type="radio" name="area" id="area" value="50">50m²以下
				<input type="radio" name="area" id="area" value="70">50-70m²
				<input type="radio" name="area" id="area" value="90">70-90m²
				<input type="radio" name="area" id="area" value="100">90m²以上
			</dd>
		</dl>

		<dl class="secitem" id="houseType">
			<dt>厅室：</dt>
			<dd>
			<input type="radio" name="shitingwei" id="shitingwei" value="-1" checked="checked">不限
			<input type="radio" name="shitingwei" id="shitingwei" value="-2">其他
			<span
					class="prifilter" id="tingshi_filter">
					<span class="text text2">
					<input type="text" name="shi" min="0" max="10" name="b_q" combine="tingshi" autocomplete="off"></span>
					<span class="dev">室 </span>
					<span class="text text2">
					<input type="text" name="ting" min="0" max="10" name="b_q" combine="tingshi" autocomplete="off"></span>
					<span class="dev">厅 </span>
					<span class="text text2">
					<input type="text" name="wei" min="0" max="10" name="b_q" combine="tingshi" autocomplete="off"></span>
					<span class="dev">卫 </span>
					<span class="btn btn2" style="display:none"><input type="button"
						value="厅室筛选"></span></span>
			</dd>
		</dl>
		<script type="text/javascript">
			$(function() {
				//限时急售筛选
				function showjishouhouse() {
					var showpinpai = $("#xianshijishou");
					if (showpinpai) {
						// 选中品牌房源
						if (location.href.indexOf("jishou=1") > -1) {
							showpinpai.attr("checked", "true");
						}
						showpinpai.click(function() {
							var pinpai = "jishou=1",
								url = location.href;
							if (showpinpai.attr("checked")) {
								var sUpara = "";
								if (url.indexOf(pinpai) == -1) {
									sUpara = url.indexOf("?") == -1 ? "?" : "&";
									location.href = url + sUpara + pinpai;
								}
							} else {
								if (url.indexOf(pinpai) != -1) {
									if (url.indexOf("?jishou=1&") != -1) {
										url = url.replace("jishou=1&", "");
									}
									url = url.replace("?param9310=1", "").replace("&jishou=1", "").replace("jishou=1", "");
									location.href = url;
								}
							}
		
						});
					}
				}
		
			});
		</script>


		<script type="text/javascript">
			$('.fake_select_item').each(function(ind, ele) {
				var sel_ele = $(ele).find('.select_lst_cn a.icon_check_on,.select_lst_cn a.select');
				if (sel_ele) {
					$(ele).find('.select_title span').text(sel_ele.text());
				}
			});
			var par_old_zindex;
			$('.more_filter_cn .fake_select_item').bind('mouseenter', function() {
				$(this).addClass('open');
				var par = $('#selection'),
					filter = $('#filter'),
					zindex = parseInt(filter.css('z-index'));
				par_old_zindex = parseInt(par.css('z-index')) || 1;
				par.css('z-index', zindex + 1);
		
			}).bind('mouseleave', function() {
				$(this).removeClass('open');
				$(this).find('.select_lst_cn a[status="select"]').addClass('select');
				$(this).find('.select_lst_cn a[status="icon_check_on"]').addClass('icon_check_on');
				$('#selection').css('z-index', par_old_zindex);
			});
			$('.select_lst_cn a').bind('mouseenter', function() {
				$(this).siblings('.icon_check_on').removeClass('icon_check_on').attr('status', 'icon_check_on');
				$(this).siblings('.select').removeClass('select').attr('status', 'select');
			});
		</script>

	</div>



</div>