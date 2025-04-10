<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="BusinessPassportBatchEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.ExternalAffaris.BusinessPassportBatchEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                是否借出<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <asp:RadioButtonList ID="rblIsLoan" runat="server" activestatus="(23.*)" RepeatDirection="Horizontal"
                    req="1">
                </asp:RadioButtonList>
            </td>
            <%-- <td class="td-l">
                借出日期 
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtLoanDate" runat="server" readonly="readonly"
                    class="kpms-textbox-date">
                </zhongsoft:XHtmlInputText>
            </td>--%>
            <td class="td-m" colspan="2">
                <table>
                    <tr class="trloan">
                        <td class="td-l">
                            借出日期<span class="req-star">*</span>
                        </td>
                        <td class="td-r">
                            <zhongsoft:XHtmlInputText ID="txtLoanDate" runat="server" readonly="readonly" class="kpms-textbox-date"
                                activestatus="(23.*)">
                            </zhongsoft:XHtmlInputText>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <br />
            </td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: right">
                <asp:LinkButton runat="server" ID="lbnSelect" OnClick="lbnSelect_Click" OnClientClick="return selectPassport();">
                <span>选择因公护照</span>
                </asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td class="td-l" style="text-align: center; font-weight: bold" colspan="4">
                护照列表
            </td>
        </tr>
        <tr>
            <td class="td-l" colspan="4" style="text-align: center">
                <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false"
                    UseDefaultDataSource="true" AllowPaging="true" PageSize="10" DataKeyNames="TechQualifID"
                    OnRowCommand="gvList_RowCommand">
                    <Columns>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiPassport" />
    <script type="text/javascript">
        function selectPassport() {
            var param = new InputParamObject("m");
            var re = getPassport("<%=hiPassport.ClientID%>", param, "");
            if (re != null)
                return true;
            else
                return false;
        }

        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();

            $('#<%=rblIsLoan.ClientID %>').live("change", function () {
                accessOfReDisply();

            });
            accessOfReDisply();
        }

        //控制是否显示借出日期
        function accessOfReDisply() {
            var isRight = $('#<%=rblIsLoan.ClientID%> :checked').val();
            if (isRight == "是") {
                $('.trloan').show();
                $('#<%=txtLoanDate.ClientID %>').attr('req', '1');
            }
            else {
                $('.trloan').hide();
                $('#<%=txtLoanDate.ClientID %>').removeAttr('req');
                $('#<%=txtLoanDate.ClientID %>').val("");
            }
        }
    </script>
</asp:Content>
