<%@ Page Title="部门合并" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true" CodeBehind="OrganizationMergerEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.Organization.OrganizationMergerEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"
    TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
       <table class="tz-table">
        <tr>
            <td class="td-l">
                合并部门<span class="req-star">*</span>
            </td>
            <td class="td-r" colspan="3"> 
                <zhongsoft:LightObjectSelector runat="server" ID="lbsMergerDeptName" IsMutiple="true"
                    ResultForControls="{'hiMergerDeptId':'id'}" EnableTheming="false" Text="选择部门"    PageUrl="~/EHR/Obsolete/OrganizationSelector.aspx" ShowJsonRowColName="true" ResultAttr="name" SelectPageMode="Dialog"
                    activestatus="(23.*)"  PageHeight="550" PageWidth="700"  req="1"/>
                <input type="hidden" id="hiMergerDeptId" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                合并后部门编号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                  <input type="hidden" runat="server" id="hiOrganizationID" field="OrgUnitId" tablename="OrganizationOfficial" />
                <zhongsoft:LightTextBox runat="server" ID="tbOrganizationCode" CssClass="kpms-textbox"
                    MaxLength="20" req="1" field="OrgUnitCode" tablename="OrganizationOfficial" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                合并后部门名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbOrganizationName" CssClass="kpms-textbox"
                    MaxLength="64" req="1" field="OrgUnitName" tablename="OrganizationOfficial" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
           <tr id="trType" runat="server">
            <td class="td-l">
                 合并后部门分类<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlOrgType" field="OrgType" tablename="OrganizationOfficial"
                    activestatus="(23.*)" req="1">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                合并后部门等级<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlOrganizationLevel" field="OrgUnitLevel"
                    req="1" tablename="OrganizationOfficial" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                合并后上级部门<span runat="server" id="spanStar" class="req-star">*</span>
            </td>
            <td class="td-r">
                <input type="hidden" runat="server" id="hiParentID" field="ParentID" tablename="OrganizationOfficial" />
                <zhongsoft:XHtmlInputText runat="server" ID="txtParentName" readonly="readonly" class="kpms-textbox"
                    style="width: 150px" activestatus="(23.*)" />
                <asp:ImageButton runat="server" ID="ibtnSelectParentOrg" ImageUrl="../../../Themes/Images/btn_select.gif"
                    ToolTip="选择" TabIndex="1"  CausesValidation="False" OnClientClick="return SelectParentOrg()"
                    ActiveStatus="(23.*)" DisplayStatus="(23.*)" /><br />
                <span id="spanParent" runat="server" class="req-star">请先选择部门等级再选择上级部门,"一级部门"不能选择上级部门,"二、三级部门"必须选择上级部门</span>
             
            </td>
        </tr>
        <tr>
            <td class="td-l">
                成立日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtSetUpDate" class="kpms-textbox-comparedate" compare="1"
                    field="SetUpDate" tablename="OrganizationOfficial" activestatus="(23.*)" readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                撤销日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtUndoDate" class="kpms-textbox-comparedate" compare="1"
                    field="UndoDate" tablename="OrganizationOfficial" activestatus="(23.N)" readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                部门职责
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbORGDUTY" TextMode="MultiLine"
                    CssClass="kpms-textarea" EnableTheming="false" Maxtext="512" field="ORGDUTY"
                    tablename="OrganizationOfficial" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                职责文件
            </td>
            <td class="td-m" colspan="3">
                <span id="span1" runat="server" displaystatus="(2.*)" style="cursor: hand; height: 16px;"
                    class="req-star">请先保存在上传职责文件</span>
                <zhongsoft:LightFileUploader ID="ibtnAttach" runat="server" CssClass="kpms-btn" EnableTheming="false"
                    OnClick="ibtnAttach_Click" DisplayStatus="(3.*)">
                                <img src="../../../Themes/Images/btn_dg_upfile.gif" />
                                <span>上传职责文件</span>
             </zhongsoft:LightFileUploader>
                <uc1:AttachmentView ID="AttachmentView1" runat="server" RepeatColumns="1" ShowDelete="true"
                    ShowDeleteBySelf="true" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                部门排序
            </td>
            <td class="td-l" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="txtSort" field="Sort" tablename="OrganizationOfficial"
                    CssClass="kpms-textbox-money" EnableTheming="false" MaxLength="3" regex="^\d+$"
                    errmsg="请填写最多三位正整数" Width="30px" />
            </td>           
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiOrgType" field="OrgType" tablename="OrganizationOfficial" />
    <input type="hidden" runat="server" id="hiFlag" field="Flag" tablename="OrganizationOfficial"  value="1"/>
    <input type="hidden" runat="server" field="OrganizationTypeId" tablename="OrganizationUnit" id="hiUnitType" value="1" />
    <input type="hidden" runat="server" field="OrganizationCode" tablename="OrganizationUnit"   id="hiUnitCode" />
    <input type="hidden" runat="server" field="OrganizationName" tablename="OrganizationUnit"   id="hiUnitName" />
    <input type="hidden" runat="server" field="OrganizationId" tablename="OrganizationUnit"     id="hiUnitId" />
    <script type="text/javascript">
        function initCustomerPlugin() {
          setHideorShow();
            checkRegex();
            checkMaxLength();
        }
        $("#<%=ddlOrgType.ClientID %>").change(function () {
            $("#<%=hiOrgType.ClientID %>").val($("#<%=ddlOrgType.ClientID %>").val());
        })
         function SelectParentOrg() {
            var param = new InputParamObject("s");
            var level = $("#<%=ddlOrganizationLevel.ClientID %>").val(); 
            var json = { OrganizationLevel: (level - 1) };
            var re = getOrgsNew("", param, json);
            if (re != null) {
                $("#<%=hiParentID.ClientID %>").val(re.buildAttrJson("o", "id"));
                $("#<%=txtParentName.ClientID %>").val(re.buildAttrJson("o", "name"));
            }
            return false;
        }
         $("#<%=ddlOrganizationLevel.ClientID %>").live("change", function() {
            setHideorShow();
            $("#<%=hiParentID.ClientID %>").val("");
            $("#<%=txtParentName.ClientID %>").val("");

        })
         function setHideorShow() {
            var level = $("#<%=ddlOrganizationLevel.ClientID %>").val();
            if ("<%=ActionType %>" == "Read") {
                $("#<%=ibtnSelectParentOrg.ClientID %>").hide();
                $("#<%=spanParent.ClientID%>").hide();
                if (level == "1" || level == "") {
                    $("#<%=spanStar.ClientID%>").hide();
                }
                else {
                    $("#<%=spanStar.ClientID%>").show();
                }
            }
            else {
                if (level == "1" || level == "") {
                    $("#<%=ibtnSelectParentOrg.ClientID %>").hide();

                    $("#<%=spanStar.ClientID%>").hide();
                    $("#<%=txtParentName.ClientID %>").removeAttr("req");
                }
                else {
                    $("#<%=ibtnSelectParentOrg.ClientID%>").show();
                    $("#<%=spanStar.ClientID%>").show();
                    $("#<%=txtParentName.ClientID %>").attr("req", "1");
                }
            }
        }
    </script>
</asp:Content>
