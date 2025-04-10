<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BorrowMoneySelector.aspx.cs"
    Inherits="Zhongsoft.Portal.FM.Obsolete.BorrowMoneySelector" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    Title="选择借款单" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                借款人 <zhongsoft:LightTextBox ID="tbUserName" runat="server" Width="120px"></zhongsoft:LightTextBox>
                借款事由<zhongsoft:LightTextBox ID="tbLoanPurpose" runat="server" Width="120px"></zhongsoft:LightTextBox>
                借款部门
                <zhongsoft:LightTextBox ID="tbDept" runat="server" Width="120px"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvDriver" AllowPaging="true"
        PageSize="8" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
        BindGridViewMethod="DoSelectByFilter" OnJsonClick="addObject" JsonClickMode="onclick"
        DataKeyNames="BorrowMoneyFormId" ShowJsonRowColName="true">
        <Columns>
               <zhongsoft:LightBoundField HeaderText="借款单号" DataField="BorrowNo">
            </zhongsoft:LightBoundField>
             <zhongsoft:LightBoundField HeaderText="部门" DataField="ApplyDeptName" Width="70">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="借款人" DataField="ApplyUserName">
            </zhongsoft:LightBoundField> 
              <zhongsoft:LightBoundField HeaderText="借款金额（元）" DataField="BorrowMoney"   SortExpression="BorrowMoney"  ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
             </zhongsoft:LightBoundField>
                <zhongsoft:LightBoundField HeaderText="借款日期" DataField="ApplyDate"  SortExpression="ApplyDate"   DataFormatString="{0:yyyy-MM-dd}"
                Width="70">
            </zhongsoft:LightBoundField>
                <zhongsoft:LightBoundField HeaderText="预计回款日期" DataField="PlanBackDate" SortExpression="PlanBackDate" DataFormatString="{0:yyyy-MM-dd}"
                Width="70">
            </zhongsoft:LightBoundField>
             <zhongsoft:LightBoundField HeaderText="累计已到款（元）" DataField="SumBackMoney" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
             </zhongsoft:LightBoundField>
             <zhongsoft:LightBoundField HeaderText="剩余未还款（元）" DataField="NoPayMoney" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
             </zhongsoft:LightBoundField> 
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
