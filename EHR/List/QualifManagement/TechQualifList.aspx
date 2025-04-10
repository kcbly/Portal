<%@ Page Title="专业技术资格管理" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master"
    AutoEventWireup="true" CodeBehind="TechQualifList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.QualifManagement.TechQualifList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <script type="text/javascript" src="../../UI/Script/EHRGeneralScript.js"></script>
    <span class="filter-block"><span>
        <zhongsoft:DropCheckBoxList runat="server" ID="dcbDept" TitleName="部门" SearchBtnId="btnOrg"
            RepeatColumns="3" RepeatDirection="Horizontal" />
        <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:LinkButton runat="server" ID="btnOrg" Style="display: none" OnClick="btnOrg_Click"></asp:LinkButton>
                <zhongsoft:DropCheckBoxList runat="server" ID="dcbOrg" TitleName="科室" RepeatColumns="2"
                    RepeatDirection="Horizontal" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">登录号/姓名/简拼</span><span>
        <asp:TextBox ID="tbPersonnel" runat="server" MaxLength="20" CssClass="kpms-textboxsearch" Width="120px"
            EnableTheming="false">
        </asp:TextBox></span></span> <span class="filter-block"><span class="filter-block-lb">人员状态</span><span>
            <zhongsoft:LightDropDownList ID="ddlState" runat="server" class="kpms-ddlsearch" Width="80px" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true"
                EnableTheming="false">
            </zhongsoft:LightDropDownList>
        </span></span>
    <br />
    <span class="filter-block"><span class="filter-block-lb">取得专业技术资格名称</span><span>
        <zhongsoft:LightDropDownList ID="ddlTechQualifName" runat="server" class="kpms-ddlsearch" Width="120px" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">专业技术资格系列</span><span>
        <zhongsoft:LightDropDownList ID="ddlTechQualifSeries" runat="server" class="kpms-ddlsearch" Width="80px" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">专业技术资格等级</span><span>
        <zhongsoft:LightDropDownList ID="ddlTechQualifLevel" runat="server" class="kpms-ddlsearch" Width="80px" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">聘任日期</span><span><asp:CheckBox
        Text="" ID="cbApplyDate" runat="server" />
        <zhongsoft:XHtmlInputText runat="server" ID="txtBeginDate" class="kpms-textbox-comparedate"
            compare="1" readonly="readonly">
        </zhongsoft:XHtmlInputText>
        至
         <zhongsoft:XHtmlInputText runat="server" ID="txtEndDate" class="kpms-textbox-comparedate"
             compare="1" readonly="readonly">
         </zhongsoft:XHtmlInputText>
    </span></span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
    <asp:LinkButton ID="btnNewBatch" runat="server" OnClick="btnNewBatch_Click" OnClientClick="return techQualifItemBatch('','2')">
      <span>批量新增</span>
    </asp:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvTech" runat="server" AutoGenerateColumns="false"
        AllowPaging="true" PageSize="15" UseDefaultDataSource="true" BindGridViewMethod="BindTechGrid"
        HideFieldOnExport="全选,资格" DataKeyNames="USERID"
        ShowExport="true" AllowSorting="true" RowStyle-Wrap="false">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="50px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightBoundField HeaderText="登录号" DataField="USERCODE" HeaderStyle-Width="50px" SortExpression="USERCODE">
            </zhongsoft:LightBoundField>
            <asp:TemplateField HeaderText="姓名" ItemStyle-HorizontalAlign="left" SortExpression="USERNAME">
                <ItemTemplate>
                    <a onclick="return ViewLink('<%#Eval("USERID")%>');" style="color: Blue;">
                        <%#Eval("USERNAME")%>
                    </a>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightBoundField HeaderText="所属部门" DataField="ORGUNITNAME" SortExpression="ORGUNITNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="专业技术资<br/>格系列" DataField="TECHQUALIFSERIES"
                HtmlEncode="false" SortExpression="TECHQUALIFSERIES">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="专业技术资<br/>格名称" DataField="TECHQUALIFNAME"
                HtmlEncode="false" SortExpression="TECHQUALIFNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="专业技术资<br/>格等级" DataField="TECHQUALIFLEVEL"
                HtmlEncode="false" SortExpression="TECHQUALIFLEVEL">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="专业技术资<br/>格证书编号" DataField="QUALIFICATIONCODE"
                HtmlEncode="false" SortExpression="QUALIFICATIONCODE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="取得资格日期" DataField="QUALIFYINGTIME" DataFormatString="{0:yyyy-MM-dd}" SortExpression="QUALIFYINGTIME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="最高等<br/>级标识" DataField="ISHIGHEST2" HtmlEncode="false" SortExpression="ISHIGHEST2">
            </zhongsoft:LightBoundField>
            <asp:TemplateField HeaderText="备注" SortExpression="MEMO">
                <ItemTemplate>
                    <asp:Label ID="lbMemo" Text='<%#gvTech.GetSubString(Eval("MEMO"), 6)%>' ToolTip='<%#Eval("MEMO") %>' runat="server"></asp:Label>
                    <input type="hidden" id="hidTechQyalifID" runat="server" value='<%#Eval("TECHQUALIFID") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightButtonField CommandName="ViewData" HeaderText="资格" CausesValidation="false"
                ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40px" EditIdField="UserID"
                EditPageWidth="800px" EditPageHeight="600px" EditPageUrl="~/EHR/List/QualifManagement/AllQualifList.aspx">
            </zhongsoft:LightButtonField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        function initCustomerPlugin() {
            $("#ctl00_subToolBar_dlButtons_ctl03_btn").hide();
            $("#ctl00_subToolBar_dlButtons tr").find("a").eq(2).hide();
        }
        $gridCheckedClientID = "<%=gvTech.CheckedClientID %>";
        function techQualifItemBatch(bizId, acType) {
            var stringFeatures = "dialogHeight:600px; dialogWidth: 1000px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
            var url = "";
            if (acType == "2") {
                url = "/Portal/EHR/List/QualifManagement/TechQualifBatchEditor.aspx?&actionType=" + acType;
            }
            else {
                url = "/Portal/EHR/List/Qu  alifManagement/TechQualifBatchEditor.aspx?&actionType=" + acType + "&bizId=" + bizId;
            }
            if (window.showModalDialog(url, null, stringFeatures) == undefined) {
                return false;
            }
            return true;
        }
        function ViewLink(id) {
            url = buildQueryUrl("EHR/List/QualifManagement/TechQualifEditor.aspx", { actionType: "1", bizId: id });
            ViewCustomListLink(url);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
