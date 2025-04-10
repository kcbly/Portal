<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCCarUseApplyFormDetail.ascx.cs" Inherits="Zhongsoft.Portal.KMS.UI.Controls.UCCarUseApplyFormDetail" %>
<table class="tz-table">
    <tr>
        <td style="text-align: center; font-size: medium">用车申请明细</td>
    </tr>
    <tr id="trSure" runat="server" displaystatus="(23.填写用车情况)">
        <td style="text-align: right">新增<zhongsoft:LightTextBox runat="server" ID="tbInShowNum" Width="50px" regex="^\d+$"
            Style="text-align: right" errmsg="请填写最多两位正整数" MaxLength="2"></zhongsoft:LightTextBox>行	
            <asp:Button EnableTheming="false" runat="server" ID="btnInSure" OnClick="btnInSure_Click" Text="确定" OnClientClick="return checkFillNum()" displaystatus="(23.填写用车情况)" />
        </td>
    </tr>
    <tr>
        <td>
            <zhongsoft:LightPowerGridView ID="gvDetail" runat="server" UseDefaultDataSource="true" AutoGenerateColumns="false" AllowPaging="false" AllowSorting="true" BindGridViewMethod="BindData" ShowExport="true" ShowPageSizeChange="true" DataKeyNames="DetailId" PageSize="15" OnRowCommand="gvDetail_RowCommand" OnRowDataBound="gvDetail_RowDataBound" HideFieldOnExport="删除" PermissionStatus="true" >
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-Width="5%">
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="乘车代表" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="180px">
                        <ItemTemplate>
                            <zhongsoft:LightObjectSelector runat="server" ID="losCarMainUserName" SelectPageMode="Dialog" activestatus="(23.填写用车情况)"     PageHeight="650px"   
                                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" Width="100px" Field="CarMainUserName" Value='<%#Eval("CarMainUserName") %>'
                                ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode" req="1"
                                IsMutiple="false" ResultForControls="{'hdnCarMainUserId':'id','txtCarMainDeptName':'DEPTNAME','hdnCarMainDeptId':'DEPTID'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
                            <input type="hidden" runat="server" id="hdnCarMainUserId" field="CarMainUserId" value='<%#Eval("CarMainUserId") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="部门" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="180px">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText ID="txtCarMainDeptName" Field="CarMainDeptName" activestatus="(23.填写用车情况)" Value='<%#Eval("CarMainDeptName") %>'
                                class="kpms-textbox" runat="server" readonly="readonly" />
                            <input type="hidden" runat="server" id="hdnCarMainDeptId" field="CarMainDeptId" value='<%#Eval("CarMainDeptId") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="人数" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="180px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="ltbPersonCnt" Field="PersonCnt" runat="server" regex="^[1-9]\d*$"
                        errmsg="请输入正整数" Text='<%#Eval("PersonCnt") %>' onblur="autoComputeRateShareKM();autoComputeRate()" activestatus="(23.填写用车情况)" MaxLength="100" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="分摊公里数" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="180px">
                        <ItemTemplate>
                               <zhongsoft:XHtmlInputText ID="ltbShareKM" Field="ShareKM" activestatus="(23.填写用车情况)" Value='<%#Eval("ShareKM") %>'
                                class="kpms-textbox" runat="server" readonly="readonly" /> 
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="分摊费用" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="180px">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText ID="txtShareMoney" Field="ShareMoney" activestatus="(23.填写用车情况)" Value='<%#Eval("ShareMoney") %>'
                                class="kpms-textbox" runat="server" readonly="readonly" />  
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除"></zhongsoft:LightButtonField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
       
    }
    function checkFillNum() {
        var fillNum = $("#<%=tbInShowNum.ClientID %>").val();
        if (fillNum == "") {
            alert("请输入要添加的行数");
            return false;
        }
        return true;
    }
    //计算人数
    function autoComputeTotal() {
        var sum = 0;
        $("#<%=gvDetail.ClientID %> [id$=ltbPersonCnt]").each(function () {
            sum += intParse($(this).val());
        });
         //只有填写用车情况时才计算
        var isEnabled = '<%=Enabled%>'
            if (isEnabled.toLowerCase() == "true") {
                 $("#ctl10_txtSumPeopleNum").val(sum);
            }
       
    }

    //计算收费金额
    function autoComputeTotalMoney() {
        var sum = 0;
        $("#<%=gvDetail.ClientID %> [id$=txtShareMoney]").each(function () {
            sum += floatParse($(this).val());
        });
        $("#ctl10_txtFactCost").val(sum);
    }

    //计算实际里程
    function autoComputeTotalKM() {
        var sum = 0;
        $("#<%=gvDetail.ClientID %> [id$=ltbShareKM]").each(function () {
            sum += floatParse($(this).val());
        });
        $("#ctl10_txtFactOdograph").val(sum);
    }
    //自动计算分摊公里数
    function autoComputeRateShareKM() {
         
        var factKM = $("#ctl10_txtFactOdograph").val();
        var SumPerson = $("#ctl10_txtSumPeopleNum").val();
        var onePerson = accDivLeaveNum(factKM, SumPerson, 6);
      
        $("#<%=gvDetail.ClientID %> [id$=ltbShareKM]").each(function () {
            var PersonCnt = $(this).parent('td').parent('tr').find('[id$=ltbPersonCnt]').val();
            $(this).parent('td').parent('tr').find('[id$=ltbShareKM]').val(accMulLeaveNum(floatParse(onePerson), PersonCnt, 2));
        });
    }
    //列表填写数量和单价后计算当行合计
    function autoComputeRate() {
        autoComputeTotal();
        autoComputeRateShareKM();
        var price = $("#ctl10_txtCollectFeesKm").val();
        $("#<%=gvDetail.ClientID %> [id$=txtShareMoney]").each(function () {

            var PersonCnt = $(this).parent('td').parent('tr').find('[id$=ltbPersonCnt]').val();
            var shareKm = $(this).parent('td').parent('tr').find('[id$=ltbShareKM]').val();

            //floatParse 解决类型不一致，导致floatParse(1 + costRate)计算结果不正确 
            $(this).parent('td').parent('tr').find('[id$=txtShareMoney]').val(accMulLeaveNum(floatParse(shareKm), floatParse(price), 2));
        });

        // autoComputeTotalMoney();
        //autoComputeTotalKM();
    }
</script>
