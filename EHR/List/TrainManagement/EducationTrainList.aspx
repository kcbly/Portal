<%@ Page Title="教育培训台账" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="EducationTrainList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.TrainManagement.EducationTrainList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
    <asp:LinkButton runat="server" ID="lbtnUpdate" EnableTheming="false" AccessLevel="2" OnClientClick="return AddItem()"
        CssClass="subtoolbarlink"> <span>
        <img  src="/Portal/Themes/Images/btn_new.gif"  width="16" height="16"/>新建</span></asp:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
      <span class="filter-block"><span class="filter-block-lb">姓名</span><span>
        <zhongsoft:LightTextBox ID="tbUserName" runat="server" CssClass="kpms-search" EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>     
     <span class="filter-block"><span class="filter-block-lb">所在部门</span><span>
        <zhongsoft:LightTextBox ID="tbDeptName" runat="server" CssClass="kpms-search" EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>   
        <span class="filter-block"><span class="filter-block-lb">培训类别</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlTrainType" EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView AllowPaging="true" PageSize="15" ID="gvList" UseDefaultDataSource="true"
        runat="server" ShowExport="true" HideFieldOnExport="查看,编辑,删除" DataKeyNames="EducationTrainID" BindGridViewMethod="BindData" OnRowCommand="gvList_RowCommand">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="3%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
             <zhongsoft:LightBoundField DataField="UserName" HeaderText="姓名">
            </zhongsoft:LightBoundField>
             <zhongsoft:LightBoundField DataField="DeptName" HeaderText="所在部门">
            </zhongsoft:LightBoundField>
             <zhongsoft:LightBoundField DataField="PostType" HeaderText="职务">
            </zhongsoft:LightBoundField>
             <zhongsoft:LightBoundField DataField="EducationType" HeaderText="学历">
            </zhongsoft:LightBoundField> 
            <zhongsoft:LightBoundField DataField="TrainForm" HeaderText="培训形式">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TrainType" HeaderText="培训类别">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TrainUnits" HeaderText="培训单位">
            </zhongsoft:LightBoundField>  
             <zhongsoft:LightBoundField DataField="TrainContent" HeaderText="培训内容">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="StarDate" HeaderText="开始日期" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="EndDate" HeaderText="结束日期" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField> 
              <zhongsoft:LightBoundField DataField="CertificationAuthority" HeaderText="发证机构">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightButtonField CommandName="ViewData" HeaderText="查看" CausesValidation="false" EditItemClick="ViewItem" DataParamFields="EducationTrainID">
            </zhongsoft:LightButtonField>
            <zhongsoft:LightButtonField CommandName="EditData" HeaderText="编辑" CausesValidation="false" EditItemClick="EditItem" DataParamFields="EducationTrainID">
            </zhongsoft:LightButtonField>
            <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" CausesValidation="false" DeleteText="您确认删除吗？">
            </zhongsoft:LightButtonField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <asp:LinkButton runat="server" Style="display: none" class="searchbtn" ID="btnList" OnClick="btnList_Click"></asp:LinkButton>
    <script type="text/javascript">
        function AddItem() {
            var url = "<%=WebAppPath %>" + "/EHR/List/TrainManagement/EducationTrainEditor.aspx?&actionType=2";
            showDivDialog(url, "", 800, 500, callBack);
            return false;
        }
        function EditItem(bzid) {
            var url = "<%=WebAppPath %>" + "/EHR/List/TrainManagement/EducationTrainEditor.aspx?&actionType=3&bizId=" + bzid;
            showDivDialog(url, "", 800, 500, callBack);
            return false;
        }
        function ViewItem(bzid) {
            var url = "<%=WebAppPath %>" + "/EHR/List/TrainManagement/EducationTrainEditor.aspx?&actionType=1&bizId=" + bzid;
            showDivDialog(url, "", 800, 500, null);
            return false;
        }
        function callBack() {
            <%=Page.GetPostBackEventReference(this.btnList,"") %>;
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
