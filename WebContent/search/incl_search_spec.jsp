<%@page contentType="text/html;charset=utf-8"%>
<%@ page import="com.estarcom.cnis.cssn.salesystem.trssearch.BIssuerHelp" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>

<%@ page import="com.saas.Interface.UseInterface"%>
<%@ page import="cn.gov.cnis.cssn.wssort.*"%>
<%
//String idomain = request.getParameter("domain");
//String isubType = request.getParameter("stype");

String idomain = null;
String isubType = null;

//ArrayList li  = null;
//if(request.getSession().getAttribute ("dowmList")!= null){
//	li = (ArrayList)request.getSession().getAttribute ("dowmList");
//}      
String domain_sub;
if(isubType==null)
	domain_sub=idomain;
else
	domain_sub=idomain+"-"+isubType;
UseInterface get2 = new UseInterface();
StandardSort[] rs2=get2.getStandardSortList(domain_sub);  
int length2=rs2.length;
//rs = help.findA102ByBIssuer();

Map mgb = new HashMap();
Map mhb = new HashMap();
Map mdb = new HashMap();
Map mfgb = new HashMap();
Map mfxh = new HashMap();
Map mfgj = new HashMap();


String icode=null;
String name = null;
String domain = null;
String subType = null;
String secrecy = null;
String showcode=null;
int i1=0;
if (rs2 != null){
	while( i1<length2){
		icode = rs2[i1].getId();
		name = rs2[i1].getDescription()==null?"":rs2[i1].getDescription();
		domain = rs2[i1].getDomain()==null?"":rs2[i1].getDomain();
		subType = rs2[i1].getSubType()==null?"": rs2[i1].getSubType();
/* 		secrecy =rs[i].g==null?"":rs.getObject("SECRECY").toString();
		showcode = rs.getObject("ORGCODE")==null?"":rs.getObject("ORGCODE").toString(); */
		
		if("ST_N_SBTS".equals(subType)){
			mgb.put(icode, name);
		}
		if("ST_N_DB".equals(subType)){
			mdb.put(icode, name);
		}
		if("ST_N_CSIC".equals(subType)){
			mhb.put(icode, name);
		}
		if("ST_F_INTER".equals(subType)){
			mfgj.put(icode, name);
		}
		if("ST_F_NATIONAL".equals(subType)){
			mfgb.put(icode, name);
		}
		if("ST_F_INSTITUTE".equals(subType)){
			mfxh.put(icode, name);
		}
		i1++;
	}

}

if(rs2 != null) 
rs2 = null;
%>





				<div class="tab-pane" id="professional">
					<h3>检索公式</h3>
					<form class="form-horizontal" action="" name="specForm" method="post">
					<fieldset>
						<div id="searchCondition">
							<div class="control-group" id="pannel_1">
								<select class="w100" id="select_field_1" name="select_field_1">
									<option value="all">全部字段</option>
									<option value="literature_id">标准号</option>
									<option value="cn_superscription">中文标题</option>
									<option value="en_superscription">英文标题</option>
									<option value="formerly_superscription">原文标题</option>
									<option value="chn_standard_typenum">中国标准分类号</option>
									<option value="in_stan_typenum">国际标准分类号</option>
									<option value="cn_thematic">中文主题词</option>
									<option value="en_thematic">英文主题词</option>
									<option value="formerly_thematic">原文主题词</option>
									<option value="literature_replace">代替标准</option>
									<option value="by_replace_literature">被代替标准</option>
									<option value="citation_literature">引用标准</option>
									<option value="amend">修改件</option>
									<option value="byamend">被修改件</option>
									<option value="reinforce">补充件</option>
									<option value="by_reinforce">被补充件</option>
									<option value="apply_range">适用范围</option>

								</select>
								<input type="text" class="input-xlarge" id="input_keyword_1" name="input_keyword_1">
								<select class="w60" id="select_jqmh_1"  name="select_jqmh_1">
									<option value="1">精确</option>
									<option value="0">模糊</option>
								</select>
								<span class="btn-group">
									<a class="btn" style="padding:6px 5px;" href="javascript:void(0)"><i class="icon-plus-sign"></i></a>
								</span>
							</div>


							<div class="control-group" id="pannel_2">
								<select class="w50" id="select_andor_2" name="select_andor_2">
									<option value="and">与</option>
									<option value="or">或</option>
								</select>
								<input type="button" class="btn" style="font-weight:bold;" data-toggle="buttons-button" value="(" id="left_bracket_2">
								<input type="hidden" name="h_left_bracket_2" id="h_left_bracket_2" value="0">
								<select class="w100" id="select_field_2" name="select_field_2">
									<option value="all">全部字段</option>
									<option value="literature_id">标准号</option>
									<option value="cn_superscription">中文标题</option>
									<option value="en_superscription">英文标题</option>
									<option value="formerly_superscription">原文标题</option>
									<option value="chn_standard_typenum">中国标准分类号</option>
									<option value="in_stan_typenum">国际标准分类号</option>
									<option value="cn_thematic">中文主题词</option>
									<option value="en_thematic">英文主题词</option>
									<option value="formerly_thematic">原文主题词</option>
									<option value="literature_replace">代替标准</option>
									<option value="by_replace_literature">被代替标准</option>
									<option value="citation_literature">引用标准</option>
									<option value="amend">修改件</option>
									<option value="byamend">被修改件</option>
									<option value="reinforce">补充件</option>
									<option value="by_reinforce">被补充件</option>
									<option value="apply_range">适用范围</option>

								</select>
								<input type="text" class="input-xlarge" id="input_keyword_2" name="input_keyword_2">
								<select class="w60" id="select_jqmh_2" name="select_jqmh_2">
									<option value="1">精确</option>
									<option value="0">模糊</option>
								</select>
								<input type="button" class="btn" style="font-weight:bold;" data-toggle="buttons-button" value=")" id="right_bracket_2">
								<input type="hidden" name="h_right_bracket_2" id="h_right_bracket_2" value="0">
								<span class="btn-group">
									<a class="btn" style="padding:6px 5px;" href="javascript:void(0)"><i class="icon-plus-sign"></i></a>
									<a class="btn" style="padding:6px 5px;" href="javascript:void(0)"><i class="icon-minus-sign"></i></a>
								</span>
							</div>

							<div class="control-group" id="pannel_none" style="display:none">
								<select class="w50" id="select_andor_2" name="select_andor_2">
									<option value="and">与</option>
									<option value="or">或</option>
								</select>
								<input type="button" class="btn" style="font-weight:bold;" data-toggle="buttons-button" value="(" id="left_bracket_2">
								<input type="hidden" name="h_left_bracket_2" id="h_left_bracket_2" value="0">
								<select class="w100" id="select_field_2" name="select_field_2">
									<option value="all">全部字段</option>
									<option value="literature_id">标准号</option>
									<option value="cn_superscription">中文标题</option>
									<option value="en_superscription">英文标题</option>
									<option value="formerly_superscription">原文标题</option>
									<option value="chn_standard_typenum">中国标准分类号</option>
									<option value="in_stan_typenum">国际标准分类号</option>
									<option value="cn_thematic">中文主题词</option>
									<option value="en_thematic">英文主题词</option>
									<option value="formerly_thematic">原文主题词</option>
									<option value="literature_replace">代替标准</option>
									<option value="by_replace_literature">被代替标准</option>
									<option value="citation_literature">引用标准</option>
									<option value="amend">修改件</option>
									<option value="byamend">被修改件</option>
									<option value="reinforce">补充件</option>
									<option value="by_reinforce">被补充件</option>
									<option value="apply_range">适用范围</option>

								</select>
								<input type="text" class="input-xlarge" id="input_keyword_2" name="input_keyword_2">
								<select class="w60" id="select_jqmh_2" name="select_jqmh_2">
									<option value="1">精确</option>
									<option value="0">模糊</option>
								</select>
								<input type="button" class="btn" style="font-weight:bold;" data-toggle="buttons-button" value=")" id="right_bracket_2">
								<input type="hidden" name="h_right_bracket_2" id="h_right_bracket_2" value="0">
								<span class="btn-group">
									<a class="btn" style="padding:6px 5px;" href="javascript:void(0)"><i class="icon-plus-sign"></i></a>
									<a class="btn" style="padding:6px 5px;" href="javascript:void(0)"><i class="icon-minus-sign"></i></a>
								</span>
							</div>


						</div>

						<!-- 标准品种 -->
						<h3>标准品种</h3>
						<p class="help-block">请选择以下发布单位进行筛选。</p>
         				<div class="accordion" id="accordion1">
							<div class="accordion-group">
								<div class="accordion-heading">
									<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseOne1">
										中国国家标准
									</a>
								</div>
								<div id="collapseOne1" class="accordion-body collapse in">
									<!--div class="accordion-inner"-->
									<ul class="standardVariety">
<%
//System.out.println(mgb.size());
Iterator it = mgb.keySet().iterator();
int i=0;
while(it.hasNext()){
	icode = (String)it.next();
	name = (String)mgb.get(icode);
%>
										<li>
											<input type="checkbox" name="ckbox" id="ckbox_<%=i%>" value="<%=icode%>" valueName="<%=name%>"><%=name%>
										</li>
<%
	i++;
}
%>
									</ul>
									<!--/div-->
								</div>
							</div>

							<div class="accordion-group">
								<div class="accordion-heading">
									<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseTwo1">
										中国行业标准
									</a>
								</div>
								<div id="collapseTwo1" class="accordion-body collapse">
									<ul class="standardVariety">
<%
it = mhb.keySet().iterator();

while(it.hasNext()){
	icode = (String)it.next();
	name = (String)mhb.get(icode);
%>
										<li>
											<input type="checkbox" name="ckbox" id="ckbox_<%=i%>" value="<%=icode%>" valueName="<%=name%>"><%=name%>
										</li>
<%
	i++;
}
%>
									</ul>
								</div>
							</div>
							<div class="accordion-group">
								<div class="accordion-heading">
									<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseThree1">
										中国地方标准
									</a>
								</div>
								<div id="collapseThree1" class="accordion-body collapse">
									<ul class="standardVariety">
<%
it = mdb.keySet().iterator();

while(it.hasNext()){
	icode = (String)it.next();
	name = (String)mdb.get(icode);
%>
										<li>
											<input type="checkbox" name="ckbox" id="ckbox_<%=i%>" value="<%=icode%>" valueName="<%=name%>"><%=name%>
										</li>
<%
	i++;
}
%>
									</ul>
								</div>
							</div>

							<div class="accordion-group">
								<div class="accordion-heading">
									<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseFour1">
										国外国家标准
									</a>
								</div>
								<div id="collapseFour1" class="accordion-body collapse">
									<ul class="standardVariety">
<%
it = mfgb.keySet().iterator();

while(it.hasNext()){
	icode = (String)it.next();
	name = (String)mfgb.get(icode);
%>
										<li>
											<input type="checkbox" name="ckbox" id="ckbox_<%=i%>" value="<%=icode%>" valueName="<%=name%>"><%=name%>
										</li>
<%
	i++;
}
%>

									</ul>
								</div>
							</div>
							
							<div class="accordion-group">
								<div class="accordion-heading">
									<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseFive1">
										国外学协会标准
									</a>
								</div>
								<div id="collapseFive1" class="accordion-body collapse">
									<ul class="standardVariety">
<%
it = mfxh.keySet().iterator();

while(it.hasNext()){
	icode = (String)it.next();
	name = (String)mfxh.get(icode);
%>
										<li>
											<input type="checkbox" name="ckbox" id="ckbox_<%=i%>" value="<%=icode%>" valueName="<%=name%>"><%=name%>
										</li>
<%
	i++;
}
%>

									</ul>
								</div>
							</div>
			
							<div class="accordion-group">
								<div class="accordion-heading">
									<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseSix1">
										国际标准
									</a>
								</div>
								<div id="collapseSix1" class="accordion-body collapse">
									<ul class="standardVariety">
<%
it = mfgj.keySet().iterator();

while(it.hasNext()){
	icode = (String)it.next();
	name = (String)mfgj.get(icode);
%>
										<li>
											<input type="checkbox" name="ckbox" id="ckbox_<%=i%>" value="<%=icode%>" valueName="<%=name%>"><%=name%>
										</li>
<%
	i++;
}
%>
									</ul>
								</div>
							</div>

							<!---------------->
						</div>
						<!-- 标准品种 -->
						<!--提示区2-->
						<div class="alert">
							您已选择的标准品种有：
							<div id="choice_show" class="clearfix">
							</div>
						</div>
						<!--提示区2结束-->
						<!--提示区1-->
						<div class="alert" id="div_condition_show">
							您的查询条件为：
							<p>
							</p>
						</div>
						<!--提示区1结束-->
						<div class="form-actions" style="padding-left:30px;">
							<button type="button" class="btn btn-primary" onclick ="dosubmit()"; id="professionalSearch"><i class="icon-search icon-white"></i> 搜 索</button>
							<button type="reset" class="btn" onclick="resetSpec();">重 置</button>
						</div>
					</fieldset>
					<input type="hidden" name="choiced_bz" id="choiced_bz" value=""/>
					<input type="hidden" name="sqlerror" id="sqlerror" value="trssqlerror"/>
					<input type="hidden" name="cloneSortNum" id="cloneSortNum" value="4">
					</form>
				</div>
<SCRIPT LANGUAGE="JavaScript">
<!--
function dosubmit(){
	document.specForm.submit();
}

function resetSpec(){
	document.getElementById("choice_show").innerHTML = "";
}
//-->
</SCRIPT>
