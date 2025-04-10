<%@ Page Language="C#" AutoEventWireup="true" Title="复转军人信息" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="SoldierEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.Form.SoldierEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">

    <script type="text/javascript" src="../UI/Script/EHRGeneralScript.js"></script>

    <table width="100%">
        <tr>
            <td class="kpms-fim-l">
                院号<span class="kpms-star">*</span>
            </td>
            <td class="kpms-fim-r">
                <input type="text" id="tbPersonnelCode" runat="server" readonly="readonly" class="kpms-textbox"
                    field="PersonnelCode" tablename="EHR_SoldierInfoTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                    status="0" fieldname="院号" />
            </td>
            <td class="kpms-fim-l">
                姓名
            </td>
            <td class="kpms-fim-r">
                <input type="text" id="tbPersonnelName" runat="server" readonly="readonly" class="kpms-textbox"
                    field="PersonnelName" tablename="EHR_SoldierInfoTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                    status="0" fieldname="姓名" />
            </td>
        </tr>
        <tr>
            <td class="kpms-fim-l">
                所属部门<span class="kpms-star">*</span>
            </td>
            <td class="kpms-fim-m" colspan="3">
                <input type="text" id="tbDept" runat="server" readonly="readonly" class="kpms-textbox"
                    field="OrganizationName" tablename="EHR_SoldierInfoTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                    status="0" fieldname="所属部门" style="width: 34%" />
            </td>
        </tr>
        <asp:Panel runat="server" ID="pnlData">
            <tr>
                <td class="kpms-fim-l">
                    行政区划<span class="kpms-star">*</span>
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbSdministrativeArea" field="SdministrativeArea"
                        tablename="EHR_SoldierInfoTemp" MaxLength="64" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="行政区划" req="1"></asp:TextBox>
                </td>
                <td class="kpms-fim-l">
                    退役证号<span class="kpms-star">*</span>
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbRetiredNo" field="RetiredNo" tablename="EHR_SoldierInfoTemp"
                        MaxLength="20" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="退役证号" req="1"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="kpms-fim-l">
                    入伍日期<span class="kpms-star">*</span>
                </td>
                <td class="kpms-fim-r">
                    <input type="text" readonly="readonly" runat="server" id="tbEnlistDate" class="kpms-textbox-date"
                        field="EnlistDate" tablename="EHR_SoldierInfoTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="入伍日期" req="1" />
                </td>
                <td class="kpms-fim-l">
                    退役日期<span class="kpms-star">*</span>
                </td>
                <td class="kpms-fim-r">
                    <input type="text" readonly="readonly" runat="server" id="tbRetiredDate" class="kpms-textbox-date"
                        field="RetiredDate" tablename="EHR_SoldierInfoTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="退役日期" req="1" />
                </td>
            </tr>
            <tr>
                <td class="kpms-fim-l">
                    健康与伤残情况
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbHealth" field="Health" tablename="EHR_SoldierInfoTemp"
                        MaxLength="64" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="健康与伤残情况"></asp:TextBox>
                </td>
                <td class="kpms-fim-l">
                    安置方式
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbPlacement" field="Placement" tablename="EHR_SoldierInfoTemp"
                        MaxLength="64" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="安置方式"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="kpms-fim-l">
                    原大单位
                </td>
                <td class="kpms-fim-m" colspan="3">
                    <asp:TextBox runat="server" ID="tbOrgUnit" field="OrgUnit" tablename="EHR_SoldierInfoTemp"
                        class="kpms-textbox" MaxLength="128" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="原大单位"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="kpms-fim-l">
                    原部别
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbOrgLevel" field="OrgLevel" tablename="EHR_SoldierInfoTemp"
                        MaxLength="32" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="原部别"></asp:TextBox>
                </td>
                <td class="kpms-fim-l">
                    职务名称
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbPositionName" field="PositionName" tablename="EHR_SoldierInfoTemp"
                        MaxLength="32" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="职务名称"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="kpms-fim-l">
                    原职务（技术）等级
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbPositionLevel" field="PositionLevel" tablename="EHR_SoldierInfoTemp"
                        MaxLength="20" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="原职务（技术）等级"></asp:TextBox>
                </td>
                <td class="kpms-fim-l">
                    军衔文职级
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbRankLevel" field="RankLevel" tablename="EHR_SoldierInfoTemp"
                        MaxLength="20" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="军衔文职级"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="kpms-fim-l">
                    奖励情况
                </td>
                <td class="kpms-fim-m" colspan="3">
                    <asp:TextBox runat="server" ID="tbPrize" field="Prize" tablename="EHR_SoldierInfoTemp"
                        Maxtext="128" CssClass="kpms-textarea" EnableTheming="false" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="奖励情况" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="kpms-fim-l">
                    处分情况
                </td>
                <td class="kpms-fim-m" colspan="3">
                    <asp:TextBox runat="server" ID="tbPunish" field="Punish" tablename="EHR_SoldierInfoTemp"
                        Maxtext="128" CssClass="kpms-textarea" EnableTheming="false" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="处分情况" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="kpms-fim-l">
                    六类人员（10年以上）
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbSixPerson" field="SixPerson" tablename="EHR_SoldierInfoTemp"
                        MaxLength="32" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="六类人员（10年以上）"></asp:TextBox>
                </td>
                <td class="kpms-fim-l">
                    参加党组织生活情况
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbPartyLife" field="PartyLife" tablename="EHR_SoldierInfoTemp"
                        MaxLength="64" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="参加党组织生活情况"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="kpms-fim-l">
                    家庭住址
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbFamilyAddress" field="FamilyAddress" tablename="EHR_SoldierInfoTemp"
                        MaxLength="64" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="家庭住址"></asp:TextBox>
                </td>
                <td class="kpms-fim-l">
                    联系电话
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbPhone" field="Phone" tablename="EHR_SoldierInfoTemp"
                        MaxLength="20" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="联系电话"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="kpms-fim-l">
                    档案管理部门
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbFileManage" field="FileManage" tablename="EHR_SoldierInfoTemp"
                        MaxLength="32" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="档案管理部门"></asp:TextBox>
                </td>
                <td class="kpms-fim-l">
                    再就业情况
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbReEmployment" field="ReEmployment" tablename="EHR_SoldierInfoTemp"
                        MaxLength="32" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="再就业情况"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="kpms-fim-l">
                    现任职务
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbNowPosition" field="NowPosition" tablename="EHR_SoldierInfoTemp"
                        MaxLength="64" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="现任职务"></asp:TextBox>
                </td>
                <td class="kpms-fim-l">
                    岗位情况
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbPosition" field="Position" tablename="EHR_SoldierInfoTemp"
                        MaxLength="64" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="岗位情况"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="kpms-fim-l">
                    企业名称
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbEnterprise" field="Enterprise" tablename="EHR_SoldierInfoTemp"
                        MaxLength="32" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="企业名称"></asp:TextBox>
                </td>
                <td class="kpms-fim-l">
                    企业规模
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbEnterpriseScale" field="EnterpriseScale" tablename="EHR_SoldierInfoTemp"
                        MaxLength="32" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="企业规模"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="kpms-fim-l">
                    企业法人
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbLegalPerson" field="LegalPerson" tablename="EHR_SoldierInfoTemp"
                        MaxLength="20" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="企业法人"></asp:TextBox>
                </td>
                <td class="kpms-fim-l">
                    法人电话
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbLegalPersonPhone" field="LegalPersonPhone" tablename="EHR_SoldierInfoTemp"
                        MaxLength="20" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="法人电话"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="kpms-fim-l">
                    企业类型
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbEnterpriseType" field="EnterpriseType" tablename="EHR_SoldierInfoTemp"
                        MaxLength="20" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="企业类型"></asp:TextBox>
                </td>
                <td class="kpms-fim-l">
                    企业性质
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbEnterpriseNature" field="EnterpriseNature" tablename="EHR_SoldierInfoTemp"
                        MaxLength="20" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="企业性质"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="kpms-fim-l">
                    企业隶属部门
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbEnterpriseManage" field="EnterpriseManage" tablename="EHR_SoldierInfoTemp"
                        MaxLength="64" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="企业隶属部门"></asp:TextBox>
                </td>
                <td class="kpms-fim-l">
                    国资委监管企业
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbSASAC" field="SASAC" tablename="EHR_SoldierInfoTemp"
                        MaxLength="20" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="国资委监管企业"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="kpms-fim-l">
                    企业驻地
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbEnterpriseAddress" field="EnterpriseAddress" tablename="EHR_SoldierInfoTemp"
                        MaxLength="64" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="企业驻地"></asp:TextBox>
                </td>
                <td class="kpms-fim-l">
                    企业经营状况
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbEnterpriseRun" field="EnterpriseRun" tablename="EHR_SoldierInfoTemp"
                        MaxLength="128" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="企业经营状况"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="kpms-fim-l">
                    离退下岗失业日期
                </td>
                <td class="kpms-fim-r">
                    <input type="text" id="tbLaidOffDate" runat="server" field="LaidOffDate" tablename="EHR_SoldierInfoTemp"
                        class="kpms-textbox-date" activestatus="(23.申请人填写信息)(23.申请人修改信息)" status="0"
                        fieldname="离退下岗失业日期" readonly="readonly" />
                </td>
                <td class="kpms-fim-l">
                    下岗失业原因
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbLaidOffReason" field="LaidOffReason" tablename="EHR_SoldierInfoTemp"
                        MaxLength="128" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="下岗失业原因"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="kpms-fim-l">
                    月个人收入（元）
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbSalary" field="Salary" tablename="EHR_SoldierInfoTemp"
                        MaxLength="15" regex="(^[1-9]\d{0,11}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)" errmsg="请输入正确金额，最多12为整数，2位小数"
                        CssClass="kpms-textbox-money" EnableTheming="false" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="月个人收入（元）"></asp:TextBox>
                </td>
                <td class="kpms-fim-l">
                    个人收入来源
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbSalarySource" field="SalarySource" tablename="EHR_SoldierInfoTemp"
                        MaxLength="20" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="个人收入来源"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="kpms-fim-l">
                    月生活困难补助数额（元）
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbHardshipGrants" field="HardshipGrants" tablename="EHR_SoldierInfoTemp"
                        MaxLength="15" regex="(^[1-9]\d{0,11}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)" errmsg="请输入正确金额，最多12为整数，2位小数"
                        CssClass="kpms-textbox-money" EnableTheming="false" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="月生活困难补助数额（元）"></asp:TextBox>
                </td>
                <td class="kpms-fim-l">
                    月医疗补助数额（元）
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbMedicaid" field="Medicaid" tablename="EHR_SoldierInfoTemp"
                        MaxLength="15" regex="(^[1-9]\d{0,11}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)" errmsg="请输入正确金额，最多12为整数，2位小数"
                        CssClass="kpms-textbox-money" EnableTheming="false" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="月医疗补助数额（元）"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="kpms-fim-l">
                    补助资金来源
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbGrantsSource" field="GrantsSource" tablename="EHR_SoldierInfoTemp"
                        MaxLength="20" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="补助资金来源"></asp:TextBox>
                </td>
                <td class="kpms-fim-l">
                    补助后月个人收入（元）
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbGrantsSalary" field="GrantsSalary" tablename="EHR_SoldierInfoTemp"
                        MaxLength="15" regex="(^[1-9]\d{0,11}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)" errmsg="请输入正确金额，最多12为整数，2位小数"
                        CssClass="kpms-textbox-money" EnableTheming="false" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="补助后月个人收入（元）"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="kpms-fim-l">
                    企业拖欠三险费情况
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbNopayInsurance" field="NopayInsurance" tablename="EHR_SoldierInfoTemp"
                        MaxLength="20" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="企业拖欠三险费情况"></asp:TextBox>
                </td>
                <td class="kpms-fim-l">
                    拖欠个人工资或养老金总额（元）
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbNopaySalarySum" field="NopaySalarySum" tablename="EHR_SoldierInfoTemp"
                        MaxLength="15" regex="(^[1-9]\d{0,11}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)" errmsg="请输入正确金额，最多12为整数，2位小数"
                        CssClass="kpms-textbox-money" EnableTheming="false" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="拖欠个人工资或养老金总额（元）"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="kpms-fim-l">
                    现拖欠个人工资或养老保险金总额（元）
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbNowNopaySalarySum" field="NowNopaySalarySum" tablename="EHR_SoldierInfoTemp"
                        MaxLength="15" regex="(^[1-9]\d{0,11}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)" errmsg="请输入正确金额，最多12为整数，2位小数"
                        CssClass="kpms-textbox-money" EnableTheming="false" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="现拖欠个人工资或养老保险金总额（元）"></asp:TextBox>
                </td>
                <td class="kpms-fim-l">
                    企业拖欠个人应报销医疗费数额（元）
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbNopayMedicaidSum" field="NopayMedicaidSum" tablename="EHR_SoldierInfoTemp"
                        MaxLength="15" regex="(^[1-9]\d{0,11}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)" errmsg="请输入正确金额，最多12为整数，2位小数"
                        CssClass="kpms-textbox-money" EnableTheming="false" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="企业拖欠个人应报销医疗费数额（元）"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="kpms-fim-l">
                    已补发数额（元）
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbReissue" field="Reissue" tablename="EHR_SoldierInfoTemp"
                        MaxLength="15" regex="(^[1-9]\d{0,11}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)" errmsg="请输入正确金额，最多12为整数，2位小数"
                        CssClass="kpms-textbox-money" EnableTheming="false" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="已补发数额（元）"></asp:TextBox>
                </td>
                <td class="kpms-fim-l">
                    补发资金来源
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbReissueSource" field="ReissueSource" tablename="EHR_SoldierInfoTemp"
                        MaxLength="20" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="补发资金来源"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="kpms-fim-l">
                    参保情况
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbInsuranceInfo" field="InsuranceInfo" tablename="EHR_SoldierInfoTemp"
                        MaxLength="20" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="参保情况"></asp:TextBox>
                </td>
                <td class="kpms-fim-l">
                    配偶岗位情况
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbMatePosition" field="MatePosition" tablename="EHR_SoldierInfoTemp"
                        MaxLength="64" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="配偶岗位情况"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="kpms-fim-l">
                    家庭经济情况
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbFamilyMoney" field="FamilyMoney" tablename="EHR_SoldierInfoTemp"
                        MaxLength="20" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="家庭经济情况"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="kpms-fim-l">
                    个案解决情况
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbCaseInfo" field="CaseInfo" tablename="EHR_SoldierInfoTemp"
                        MaxLength="20" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="个案解决情况"></asp:TextBox>
                </td>
                <td class="kpms-fim-l">
                    个案解决资金总额（元）
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbCaseMoney" field="CaseMoney" tablename="EHR_SoldierInfoTemp"
                        MaxLength="15" regex="(^[1-9]\d{0,11}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)" errmsg="请输入正确金额，最多12为整数，2位小数"
                        CssClass="kpms-textbox-money" EnableTheming="false" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="个案解决资金总额（元）"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="kpms-fim-l">
                    备注
                </td>
                <td class="kpms-fim-m" colspan="3">
                    <asp:TextBox ID="tbRemark" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                        EnableTheming="false" Maxtext="256" tablename="EHR_SoldierInfoTemp" field="Remark"
                        activestatus="(23.申请人填写信息)(23.申请人修改信息)" status="0" fieldname="备注"></asp:TextBox>
                </td>
            </tr>
        </asp:Panel>
    </table>
    <input type="hidden" runat="server" id="hiSoldierInfoID" field="SoldierInfoID" tablename="EHR_SoldierInfoTemp"
        activestatus="(23.申请人填写信息)(23.申请人修改信息)" />
    <input type="hidden" runat="server" id="hiPersonnelInfoID" field="PersonnelInfoID"
        tablename="EHR_SoldierInfoTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)" />
    <input type="hidden" runat="server" id="hiSoldierInfoTempID" field="SoldierInfoTempID"
        tablename="EHR_SoldierInfoTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)" />
    <input type="hidden" runat="server" id="hiPersonelInfoPassMainID" field="PersonelInfoPassMainID"
        tablename="EHR_SoldierInfoTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)" />
    <%--地址/主要字段名/表名--%>
    <input type="hidden" runat="server" id="hiDegreeName" value="复转军人" />
    <input type="hidden" runat="server" id="hiDegreeUrl" value="/Portal/EHR/Form/SoldierEditor.aspx" />
    <input type="hidden" runat="server" id="hiDegreeFCode" value="RetiredNo" />
    <input type="hidden" runat="server" id="hiDegreeFName" value="退役证号" />
    <input type="hidden" runat="server" id="hiDegreeTCode" value="EHR_SoldierInfoTemp" />
    <input type="hidden" runat="server" id="hiKeyName" value="SoldierInfoTempID" />
    <input type="hidden" runat="server" id="hiOriKeyName" value="SoldierInfoID" />

    <script>

        function InitCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }

        function KPMSCheckSubmit() {
            var start = document.getElementById("<%=tbEnlistDate.ClientID %>").value;
            var end = document.getElementById("<%=tbRetiredDate.ClientID %>").value;
            if (start != "" && end != "") {
                if (Date.parse(start.replace('-', '/')) >= Date.parse(end.replace('-', '/'))) {
                    alert("入伍日期应早于退役日期！");
                    return false;
                }
            }
            return true;
        }
    </script>

    <script type="text/javascript">
        $(function() {
            SetBackGround();
        });
    </script>

</asp:Content>
