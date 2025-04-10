<%@ Page Language="C#" AutoEventWireup="true" Title="流动人员信息跟踪台帐" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="StaffTransferTraceList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.UserChange.StaffTransferTraceList" %>
    <asp:Content ID="Content5" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">

                    <span class="filter-block"><span><zhongsoft:DropCheckBoxList runat="server" ID="dcbDept" TitleName="部门" SearchBtnId="btnOrg"
                        RepeatColumns="3" RepeatDirection="Horizontal" />
                    <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:LinkButton runat="server" ID="btnOrg" Style="display: none" OnClick="btnOrg_Click"></asp:LinkButton>
                            <zhongsoft:DropCheckBoxList runat="server" ID="dcbOrg" TitleName="科室" SearchBtnId="btnList"
                                RepeatColumns="2" RepeatDirection="Horizontal" />
                        </ContentTemplate>
                    </asp:UpdatePanel></span></span> 
                    <span class="filter-block"><span class="filter-block-lb">工号/姓名/简拼</span><span>
                    <asp:TextBox ID="tbPer" runat="server" EnableTheming="false"></asp:TextBox></span></span> 
                    <span class="filter-block"><span class="filter-block-lb">变动原因</span><span>
                    <asp:DropDownList runat="server" ID="ddlTransferReason" AutoPostBack="True" OnSelectedIndexChanged="ddlTransferReason_SelectedIndexChanged" EnableTheming="false">
                        <asp:ListItem Text="全部" Value=""></asp:ListItem>
                        <asp:ListItem Text="调入" Value="调入"></asp:ListItem>
                        <asp:ListItem Text="调出" Value="调出"></asp:ListItem>
                        <asp:ListItem Text="离职(含死亡)" Value="离职(含死亡)"></asp:ListItem>
                        <asp:ListItem Text="退休" Value="退休"></asp:ListItem>
                    </asp:DropDownList></span></span> 
                    <span class="filter-block"><span class="filter-block-lb">办理日期</span><span>
                    <asp:CheckBox ID="cbDate" runat="server"   />
                    <input type="text" id="txtDateStart" runat="server" class="kpms-textbox-comparedate"
                        compare="1" readonly="readonly" />
                    -
                    <input type="text" id="txtDateEnd" runat="server" class="kpms-textbox-comparedate"
                        compare="1" readonly="readonly" /></span></span> 

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="toolBtn" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">

            <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true"
                AutoGenerateColumns="false" AllowPaging="true" PageSize="15" OnRowCommand="gvList_RowCommand"
                ShowExport="true" OnExport="gvList_Export" DataKeyNames="USERTRANSFERTRACEID"
                AllowSorting="true" OnSorting="gvList_Sorting">
                <Columns>
                    <asp:BoundField HeaderText="工号" DataField="USERCODE" SortExpression="USERCODE" />
                    <asp:BoundField HeaderText="姓名" DataField="USERNAME" SortExpression="USERNAME" />
                    <asp:BoundField HeaderText="部门" DataField="DEPTNAME" SortExpression="DEPTNAME" />
                    <asp:BoundField HeaderText="联系方式" DataField="MobilePhone" SortExpression="DEPTNAME" />
                    <asp:BoundField HeaderText="变动原因" DataField="CHANGEREASON" SortExpression="CHANGEREASON" />
                    <asp:BoundField HeaderText="调入（出）单位名称" DataField="CHANGECORP" SortExpression="CHANGECORP" />
                    <asp:BoundField HeaderText="办理日期" DataField="DealDate" DataFormatString="{0:yyyy-MM-dd}"
                        ItemStyle-Width="70px" SortExpression="DealDate" />
                    
                    <asp:BoundField HeaderText="流程状态" DataField="WFlag" SortExpression="WFlag" />
                 <%--   <asp:TemplateField HeaderText="办理单" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnDetailPrint" EnableTheming="false">
                        <img alt="" src="../../../Themes/Images/subtoolbarprint.gif"onclick='return Print("<%#Eval("USERTRANSFERTRACEID") %>");' />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                    <asp:TemplateField HeaderText="查看" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnDetail" EnableTheming="false">
                        <img alt="" src="../../../Themes/Images/btn_dg_view.gif"onclick='return DetailItem("<%#Eval("FId") %>","<%#Eval("PId") %>");' />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        //查看流程页面
        function DetailItem(FId, PId) {
            var urlStr = "<%=WebAppPath %>/Sys/Workflow/FormDetail.aspx?actionType=1&formId=" + FId + "&prcInstId=" + PId;
            window.open(urlStr);
            return false;
        }

        function Print(bizId) {
            url = "<%=WebAppPath %>/EHR/List/UserChange/StaffTransferTracePrint.aspx?bizId=" + bizId;
            window.open(url, '_blank');
            return false;
        }

    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
