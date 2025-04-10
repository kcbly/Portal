<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserTransferNoticeList.aspx.cs"
    Title="院内调配通知单台帐" MasterPageFile="~/UI/Master/ObjectList.Master" Inherits="Zhongsoft.Portal.EHR.List.UserChange.UserTransferNoticeList" %>

<asp:Content runat="server" ID="content1" ContentPlaceHolderID="toolBar">
</asp:Content>
<asp:Content runat="server" ID="content2" ContentPlaceHolderID="listGrid">
    <div style="width: 100%; text-align: left;">
        <table class="kpms-seniorsearchtable" style="width: 100%">
            <tr align="left">
                <td>
                    变动原因
                    <asp:DropDownList ID="ddlChangeReason" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlChangeReason_SelectedIndexChanged" Width="60px">
                    </asp:DropDownList>
                    制单日期
                    <asp:CheckBox runat="server" ID="cbDate" Checked="true" />
                    <input type="text" runat="server" id="txtStartDate" class="kpms-textbox-comparedate"
                        compare="1" readonly="readonly" />-
                    <input type="text" runat="server" id="txtEndDate" class="kpms-textbox-comparedate"
                        compare="1" readonly="readonly" />
                    <asp:LinkButton runat="server" ID="btnSearch" CssClass="searchbtn bluecolor" OnClick="btnSearch_Click">
                        <span content="searchResult">查找</span>
                    </asp:LinkButton>
                    <asp:LinkButton runat="server" ID="btnReset" CssClass="searchbtn" OnClick="btnReset_Click">
                        <span>重置</span>
                    </asp:LinkButton>
                </td>
            </tr>
        </table>
    </div>
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" DataKeyNames="USERTRANSFERNOTICEID"
        AutoGenerateColumns="False" AllowPaging="True" OnRowCommand="gvList_RowCommand"
        AllowSorting="true" OnSorting="gvList_Sorting" OnExport="gvList_Export" ShowExport="true">
        <Columns>
            <asp:TemplateField HeaderText="序号" ItemStyle-Width="40px">
                <ItemTemplate>
                    <asp:Label runat="server" ID="RowNum" Text='<%#Container.DataItemIndex+1 %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ProcessInstanceName" HeaderText="标题" SortExpression="ProcessInstanceName" />
            <asp:BoundField DataField="MakeDate" HeaderText="制单日期" SortExpression="MakeDate"
                DataFormatString="{0:yyyy-MM-dd}" ItemStyle-Width="80px" />
                    <asp:BoundField HeaderText="流程状态" DataField="WFlag" SortExpression="WFlag" />
         <%--   <asp:TemplateField HeaderText="办理单" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnDetailPrint" EnableTheming="false">
                        <img alt="" src="../../../Themes/Images/subtoolbarprint.gif"onclick='return Print("<%#Eval("USERTRANSFERNOTICEID") %>","<%#Eval("ProcessInstanceId") %>");' />
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>--%>
            <asp:TemplateField HeaderText="查看">
                <ItemStyle HorizontalAlign="Center" Width="40px"></ItemStyle>
                <ItemTemplate>
                    <asp:LinkButton ID="lbView" runat="server" CommandName="viewdata" EnableTheming="false">
						<img alt="" onclick='return ViewFlow("<%#Eval("ProcessInstanceId")%>","<%#Eval("FormId")%>");' src="../../../Themes/Images/btn_dg_view.gif" />
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        //打开流程页面
        function ViewFlow(processInstanceId, formId) {
            var url;
            url = "<%=WebAppPath %>/Sys/Workflow/FormDetail.aspx?actionType=1&formID=" + formId + "&prcInstId=" + processInstanceId;
            window.open(url)
            return false;
        }

        function Print(bizId, wfId) {
            url = "<%=WebAppPath %>/EHR/List/UserChange//UserTransferNoticePrint.aspx?ProcessInstanceId=" + wfId + "&bizId=" + bizId;
            window.open(url, '_blank');
            return false;
        }
    </script>
</asp:Content>
