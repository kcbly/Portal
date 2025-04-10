<%@ Page Language="C#" Title="会议纪要文件编号维护台账" MasterPageFile="~/UI/Master/ObjectWhList.Master" AutoEventWireup="true" CodeBehind="MeetFileCodeSetList.aspx.cs" Inherits="Zhongsoft.Portal.KMS.List.Meet.MeetFileCodeSetList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server"></asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
   
    <span class="filter-block">
        <span class="filter-block-lb">会议类型</span>
        <span>
           <zhongsoft:LightDropDownList ID="ddlMeetingType"  runat="server" Width="128px" >
                     </zhongsoft:LightDropDownList>    

        </span>
    </span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" BindGridViewMethod="BindData"
        ShowExport="true" ShowPageSizeChange="true" DataKeyNames="MeetFileCodeSetId" PageSize="15">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField> 
            <zhongsoft:LightBoundField HeaderText="会议类型" DataField="MeetingTypeText" Width="80px" />
            <zhongsoft:LightBoundField HeaderText="编号前缀" DataField="CodePrefix" Width="100px" />
             <zhongsoft:LightBoundField HeaderText="创建日期" DataField="CreateDate" Width="80px" DataFormatString="{0:yyyy-MM-dd}" /> 
            <zhongsoft:LightBoundField HeaderText="备注" DataField="Remark" Width="100px" /> 
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        $gridCheckedClientID ="<%=gvList.CheckedClientID %>";
        $KeyUrl = "/KMS/List/Meet/MeetFileCodeSetEditor.aspx";
        $isFlow = "0";
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>


