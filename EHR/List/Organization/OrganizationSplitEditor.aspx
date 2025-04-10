<%@ Page Title="部门分离" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true" CodeBehind="OrganizationSplitEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.Organization.OrganizationSplitEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                分离部门<span class="req-star">*</span>
            </td>
            <td class="td-r" >
                <div style="width:50%">
                    <zhongsoft:LightObjectSelector runat="server" ID="lbsSplitDeptName" IsMutiple="false"
                        ResultForControls="{'hiOrgUnitId':'id'}" EnableTheming="false" Text="选择部门" PageUrl="~/EHR/Obsolete/OrganizationSelector.aspx" ShowJsonRowColName="true" ResultAttr="name" SelectPageMode="Dialog" 
                       PageHeight="550" PageWidth="700"  OnClick="lbsSplitDeptName_Click" activestatus="(23.*)" req="1"/>
                    <input type="hidden" runat="server" id="hiOrgUnitId"  />
                </div>
                  
            </td>  
        </tr> 
        <tr>
            <td style="text-align: right" class="td-m" colspan="4">
                <asp:Label ID="lblNum" runat="server" Text="新增部门条数："></asp:Label>
                <asp:TextBox ID="tbNumber" runat="server" Width="50px">2</asp:TextBox>
                <asp:Button ID="btnAddNewRow" runat="server" Text="确认新增" OnClientClick="return check();"
                    OnClick="btnAddNewRow_Click" displaystatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td style="text-align: center" class="td-m" colspan="4">
                <h3>
                    分离后部门列表</h3>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <span runat="server" class="req-star">
                    请先选择部门等级再选择上级部门,"一级部门"不能选择上级部门,"二、三级部门"必须选择上级部门
                </span>
                <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false"
                    UseDefaultDataSource="true" DataKeyNames="OrgUnitId" OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand">
                    <Columns>
                        <asp:TemplateField HeaderText="序号">
                            <ItemTemplate>
                                <%#Container.DisplayIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="部门编号<span class='req-star'>*</span>">
                            <ItemTemplate> 
                                <zhongsoft:LightTextBox ID="tbOrgUnitCode" runat="server" Text='<%#Eval("OrgUnitCode") %>'  activestatus="(23.*)" req="1"></zhongsoft:LightTextBox>
                                 <input type="hidden" runat="server" id="hiOrganizationID" value='<%#Eval("OrgUnitId") %>'/> 
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="部门名称<span class='req-star'>*</span>">
                            <ItemTemplate> 
                                <zhongsoft:LightTextBox ID="tbOrgUnitName" runat="server" Text='<%#Eval("OrgUnitName") %>' activestatus="(23.*)" req="1">
                                </zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="部门分类<span class='req-star'>*</span>">
                            <ItemTemplate>
                                  <zhongsoft:LightDropDownList runat="server" ID="ddlOrgType" activestatus="(23.*)" req="1">
                                 </zhongsoft:LightDropDownList>
                                <input type="hidden" runat="server" id="hiOrgType" value='<%#Eval("OrgType") %>' />    
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="部门等级">
                            <ItemTemplate>
                                <zhongsoft:LightDropDownList runat="server" ID="ddlOrgUnitLevel"  flag="OrgUnitLevel" tdid='<%#Eval("OrgUnitId") %>' ></zhongsoft:LightDropDownList> 
                                <input type="hidden" runat="server" id="hiOrgUnitLevel" value='<%#Eval("OrgUnitLevel") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                          <asp:TemplateField HeaderText="上级部门">
                            <ItemTemplate>
                                <input type="hidden" runat="server" id="hiParentID"  parentid='<%#Eval("OrgUnitId") %>'/>
                                <zhongsoft:XHtmlInputText runat="server" ID="txtParentName" readonly="readonly" class="kpms-textbox"
                                    style="width: 150px" activestatus="(23.*)"   parentName='<%#Eval("OrgUnitId") %>'  value='<%#Eval("ParentName") %>'/>
                                <asp:ImageButton runat="server" ID="ibtnSelectParentOrg" ImageUrl="../../../Themes/Images/btn_select.gif"
                                    ToolTip="选择" TabIndex="1" CausesValidation="False"    ActiveStatus="(23.*)" DisplayStatus="(23.*)"  imgId='<%#Eval("OrgUnitId") %>'
                                     flag="btnImg" />                             
                            </ItemTemplate>
                        </asp:TemplateField>
                        <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" CausesValidation="false" DeleteText="确定要删除该部门吗？">
                        </zhongsoft:LightButtonField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <script type="text/javascript">
        function initCustomerPlugin()
        {
            setHiddenImg();
        }
        function check() {
            if (!checkReqField()) {
                return false;
            }
            return true;            
        }
        function setHiddenImg()
        {
            $('[flag="OrgUnitLevel"]').each(function () {
                $(this).live("change", function ()
                {
                    var id = $(this).attr("tdid");
                    var $level = $("[tdid='" + id + "']")
                    var $img = $("[imgId='" + id + "']");
                    var $parentName = $("[parentName='" + id + "']");
                    var $parentId = $("[parentid='" + id + "']"); 
                    if (intParse($level.find("option:selected").val()) > 1)
                    {
                        $img.show();
                        $parentName.attr("req", "1");
                    } else
                    {
                        $img.hide();
                        $parentName.removeAttr("req");
                    }
                })
            })
        }
        $('[flag="btnImg"]').each(function ()
        {
            $(this).live("click", function ()
            {
                var id = $(this).attr("imgId"); 
                var $level = $("[tdid='" + id + "']")
                var $parentName = $("[parentName='" + id + "']");
                var $parentId = $("[parentid='" + id + "']");

                var param = new InputParamObject("s");
                var json = { OrganizationLevel: (intParse($level.val()) - 1) }; 
                var re = getOrgsNew("", param, json);
                if (re != null) {
                    $parentId.val(re.buildAttrJson("o", "id"));
                    $parentName.val(re.buildAttrJson("o", "name"));
                }
                return false;
            })
        })
        //选择流程角色
        function ChoosePositionRole(hiRoleId, txtRoleName, hiOrganizationID) {
            var param = new InputParamObject("s");
            var re = getRoles("re", param, null);
            if (re != null) {
                $("#" + hiRoleId).val(re.buildAttrJson("o", "id"));
                $("#" + txtRoleName).val(re.buildAttrJson("o", "name"));
                $("#" + hiOrganizationID).val(re.buildAttrJson("o", "att4"));
            }
            return false;
        }         
    </script>
</asp:Content>

