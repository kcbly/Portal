<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCTrainApplyFormDetail.ascx.cs" Inherits="Zhongsoft.Portal.KMS.UI.Controls.UCTrainApplyFormDetail" %>
<table class="tz-table" runat="server" displaystatus="(23.培训归口部门补充参会信息)(23.参训部门补充参会人员)(23.核实确认)(13.*)"  >
    <tr>
        <td style="text-align: center; font-size: medium">拟参训名单</td>
    </tr>
    <tr id="trSure" runat="server" displaystatus="(23.培训归口部门补充参会信息)(23.核查)">
        <td style="text-align: right">新增<zhongsoft:LightTextBox runat="server" ID="tbInShowNum" Width="50px" regex="^\d+$"
            Style="text-align: right" errmsg="请填写最多两位正整数" MaxLength="2"></zhongsoft:LightTextBox>行	
            <asp:Button EnableTheming="false" runat="server" ID="btnInSure" OnClick="btnInSure_Click" Text="确定" OnClientClick="return checkFillNum()" displaystatus="(23.培训归口部门补充参会信息)(23.核查)" />
        </td>
    </tr>
    <tr>
        <td>
            <zhongsoft:LightPowerGridView ID="gvDetail" runat="server" UseDefaultDataSource="true" AutoGenerateColumns="false" AllowPaging="false" AllowSorting="true" BindGridViewMethod="UserControl.BindDetailData" ShowExport="true" ShowPageSizeChange="true" DataKeyNames="DetailId" PageSize="15" OnRowCommand="gvDetail_RowCommand"  HideFieldOnExport="删除" PermissionStatus="true" OnRowDataBound="gvDetail_RowDataBound" >
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-Width="5%">
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="拟参加部门" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="110px">
                        <ItemTemplate>
                            <zhongsoft:LightObjectSelector runat="server" ID="losJoinDeptName" Field="JoinDeptName"
                                SelectPageMode="Dialog" tablename="KMS_Other_TrainApplyFormDetail" activestatus="(23.培训归口部门补充参会信息)(23.核查)"
                                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" 
                                ResultAttr="name" EnableTheming="false" ShowAttrs="name" Value='<%#Eval("JoinDeptName") %>'
                                IsMutiple="false" ResultForControls="{'hiJoinDeptId':'id'}" PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx" req="1"></zhongsoft:LightObjectSelector>
                            <input type="hidden" runat="server" id="hiJoinDeptId" field="JoinDeptId" value='<%#Eval("JoinDeptId") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="最多参加人数" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="20px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="ltbMaxJoinPersonNumber" tablename="KMS_Other_TrainApplyFormDetail" req="1"  Field="MaxJoinPersonNumber" runat="server" DataType="Integer" Text='<%#Eval("MaxJoinPersonNumber") %>' 
                                activestatus="(23.培训归口部门补充参会信息)(23.核查)"
                                />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="拟参加人员" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="380px">
                        <ItemTemplate>
                            <zhongsoft:LightObjectSelector runat="server" ID="losJoinUserName" SelectPageMode="Dialog" activestatus="(23.参训部门补充参会人员)(23.核查)"
                                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" Width="100px" Field="JoinUserName" tablename="KMS_Other_TrainApplyFormDetail" FilterFunction="filterFuc();" 
                                ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode"  Value='<%#Eval("JoinUserName") %>'
                                IsMutiple="true" ResultForControls="{'hiJoinUserId':'id'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
                            <input type="hidden" runat="server" id="hiJoinUserId" field="JoinUserId" value='<%#Eval("JoinUserId") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>

                    <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除"></zhongsoft:LightButtonField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hideptname"/>
<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
         
        InitHtmlXml();
    }
    function checkFillNum() {
        var fillNum = $("#<%=tbInShowNum.ClientID %>").val();
        if (fillNum == "") {
            alert("请输入要添加的行数");
            return false;
        }
        return true;
    }
    function filterFuc() {
        return "{DeptName:" + "'" + $("#<%=hideptname.ClientID%>").val() + "'" + "}";
    }

    //根据已经选择人员构造选择控件的隐藏域_hixml的数据，弹窗选择就会自动带出人员到选择区域
    function InitHtmlXml() {
       
        $("#<%=gvDetail.ClientID %> [id$=hiJoinUserId]").each(function () {
            var xmlStr = "<root mode=\"m\">";
            var losJoinUserName = $(this).parent('td').parent('tr').find('[id$=losJoinUserName]').val();
            var hiJoinUserId = $(this).parent('td').parent('tr').find('[id$=hiJoinUserId]').val();
            
            var names = losJoinUserName.split(",");
            var ids = hiJoinUserId.split(",");
            for (i = 0; i < ids.length; i++) {

               xmlStr += "<o id =\""+ids[i]+"\" name =\""+names[i]+"\" />";
            }
            xmlStr += "</root>\r\n"; 
            var losJoinUserName_hixml = $(this).parent('td').parent('tr').find('[id$=losJoinUserName_hixml]');//人员控件隐藏xml
            losJoinUserName_hixml.val(xmlStr)
        })
        
         
    }
</script>
