<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TrainSatisfactionSurveyDetail.aspx.cs"
    Inherits="Zhongsoft.Portal.EHR.List.TrainManagement.TrainSatisfactionSurveyDetail"
    MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table>
        <tr>
            <td colspan="7" style="font-size: medium">
                本次培训调查共收回反馈表<asp:Label ID="lbNumberOfTakingBack" runat="server" Font-Underline="true"></asp:Label>份，统计如下：
            </td>
        </tr>
        <tr>
            <td class="td-l">
                评估项目
            </td>
            <td style="text-align: center">
                非常好5分
            </td>
            <td style="text-align: center">
                好4分
            </td>
            <td style="text-align: center">
                较好3分
            </td>
            <td style="text-align: center">
                一般2分
            </td>
            <td style="text-align: center">
                差1分
            </td>
            <td style="text-align: center">
                汇总平均得分
            </td>
        </tr>
        <tr>
            <td class="td-l">
                一、此次培训班的总体评价
            </td>
            <td style="text-align: center">
                <asp:Label ID="FirstFive" runat="server" Font-Underline="true"></asp:Label>人
            </td>
            <td style="text-align: center">
                <asp:Label ID="FirstFour" runat="server" Font-Underline="true"></asp:Label>人
            </td>
            <td style="text-align: center">
                <asp:Label ID="FirstThree" runat="server" Font-Underline="true"></asp:Label>人
            </td>
            <td style="text-align: center">
                <asp:Label ID="FirstTwo" runat="server" Font-Underline="true"></asp:Label>人
            </td>
            <td style="text-align: center">
                <asp:Label ID="FirstOne" runat="server" Font-Underline="true"></asp:Label>人
            </td>
            <td style="text-align: center">
                <asp:Label ID="FirstAvg" runat="server" Font-Underline="true"></asp:Label>分
            </td>
        </tr>
        <tr>
            <td>
                <br />
            </td>
        </tr>
        <tr>
            <td colspan="7">
                <zhongsoft:EChart ID="EChart1" runat="server" Width="600px" Height="300px" MainTitle="此次培训班的总体评价"
                    TitleXAlign="Center">
                </zhongsoft:EChart>
            </td>
        </tr>
        <tr>
            <td class="td-l" colspan="7">
                二、对培训班安排的评价
            </td>
        </tr>
        <tr>
            <td class="td-l">
                这正是我工作需要了解的内容和信息
            </td>
            <td style="text-align: center">
                <asp:Label ID="SecondFive" runat="server" Font-Underline="true"></asp:Label>人
            </td>
            <td style="text-align: center">
                <asp:Label ID="SecondFour" runat="server" Font-Underline="true"></asp:Label>人
            </td>
            <td style="text-align: center">
                <asp:Label ID="SecondThree" runat="server" Font-Underline="true"></asp:Label>人
            </td>
            <td style="text-align: center">
                <asp:Label ID="SecondTwo" runat="server" Font-Underline="true"></asp:Label>人
            </td>
            <td style="text-align: center">
                <asp:Label ID="SecondOne" runat="server" Font-Underline="true"></asp:Label>人
            </td>
            <td style="text-align: center">
                <asp:Label ID="SecondAvg" runat="server" Font-Underline="true"></asp:Label>分
            </td>
        </tr>
        <tr>
            <td class="td-l">
                学习到了新知识、新技巧，拓展了视野
            </td>
            <td style="text-align: center">
                <asp:Label ID="ThirdFive" runat="server" Font-Underline="true"></asp:Label>人
            </td>
            <td style="text-align: center">
                <asp:Label ID="ThirdFour" runat="server" Font-Underline="true"></asp:Label>人
            </td>
            <td style="text-align: center">
                <asp:Label ID="ThirdThree" runat="server" Font-Underline="true"></asp:Label>人
            </td>
            <td style="text-align: center">
                <asp:Label ID="ThirdTwo" runat="server" Font-Underline="true"></asp:Label>人
            </td>
            <td style="text-align: center">
                <asp:Label ID="ThirdOne" runat="server" Font-Underline="true"></asp:Label>人
            </td>
            <td style="text-align: center">
                <asp:Label ID="ThirdAvg" runat="server" Font-Underline="true"></asp:Label>分
            </td>
        </tr>
        <tr>
            <td class="td-l">
                培训内容的针对性和实用性
            </td>
            <td style="text-align: center">
                <asp:Label ID="ForthFive" runat="server" Font-Underline="true"></asp:Label>人
            </td>
            <td style="text-align: center">
                <asp:Label ID="ForthFour" runat="server" Font-Underline="true"></asp:Label>人
            </td>
            <td style="text-align: center">
                <asp:Label ID="ForthThree" runat="server" Font-Underline="true"></asp:Label>人
            </td>
            <td style="text-align: center">
                <asp:Label ID="ForthTwo" runat="server" Font-Underline="true"></asp:Label>人
            </td>
            <td style="text-align: center">
                <asp:Label ID="ForthOne" runat="server" Font-Underline="true"></asp:Label>人
            </td>
            <td style="text-align: center">
                <asp:Label ID="ForthAvg" runat="server" Font-Underline="true"></asp:Label>分
            </td>
        </tr>
        <tr>
            <td class="td-l">
                培训管理工作的条理性和规范性
            </td>
            <td style="text-align: center">
                <asp:Label ID="FifthFive" runat="server" Font-Underline="true"></asp:Label>人
            </td>
            <td style="text-align: center">
                <asp:Label ID="FifthFour" runat="server" Font-Underline="true"></asp:Label>人
            </td>
            <td style="text-align: center">
                <asp:Label ID="FifthThree" runat="server" Font-Underline="true"></asp:Label>人
            </td>
            <td style="text-align: center">
                <asp:Label ID="FifthTwo" runat="server" Font-Underline="true"></asp:Label>人
            </td>
            <td style="text-align: center">
                <asp:Label ID="FifthOne" runat="server" Font-Underline="true"></asp:Label>人
            </td>
            <td style="text-align: center">
                <asp:Label ID="FifthAvg" runat="server" Font-Underline="true"></asp:Label>分
            </td>
        </tr>
        <tr>
            <td>
                <br />
            </td>
        </tr>
        <tr>
            <td colspan="7">
                <zhongsoft:EChart ID="EChart2" runat="server" Width="600px" Height="300px" MainTitle="对培训班安排的评价"
                    TitleXAlign="Center">
                </zhongsoft:EChart>
            </td>
        </tr>
        <tr>
            <td class="td-l" colspan="7">
                三、对授课讲师的评价 ( 5=非常好，4=好，3=较好，2=一般，1=差 )
            </td>
        </tr>
        <tr>
            <td colspan="7">
                <zhongsoft:LightPowerGridView ID="gvList" runat="server" DataKeyNames="EVALUATIONTOTEACHERID"
                    AutoGenerateColumns="False" BindGridViewMethod="BindInstructorData" UseDefaultDataSource="true"
                    ShowEmptyDataHeader="true">
                    <Columns>
                        <zhongsoft:LightBoundField HeaderText="评估讲师" DataField="INSTRUCTORNAME">
                        </zhongsoft:LightBoundField>
                        <asp:TemplateField HeaderText="授课思路">
                            <ItemTemplate>
                                <table>
                                    <tr>
                                        <td>
                                            5分
                                        </td>
                                        <td>
                                            4分
                                        </td>
                                        <td>
                                            3分
                                        </td>
                                        <td>
                                            2分
                                        </td>
                                        <td>
                                            1分
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbIdea5" runat="server" Text='<%#Eval("STEACHINGIDEA5")%>' Font-Underline="true"></asp:Label>人
                                        </td>
                                        <td>
                                            <asp:Label ID="lbIdea4" runat="server" Text='<%#Eval("STEACHINGIDEA4")%>' Font-Underline="true"></asp:Label>人
                                        </td>
                                        <td>
                                            <asp:Label ID="lbIdea3" runat="server" Text='<%#Eval("STEACHINGIDEA3")%>' Font-Underline="true"></asp:Label>人
                                        </td>
                                        <td>
                                            <asp:Label ID="lbIdea2" runat="server" Text='<%#Eval("STEACHINGIDEA2")%>' Font-Underline="true"></asp:Label>人
                                        </td>
                                        <td>
                                            <asp:Label ID="lbIdea1" runat="server" Text='<%#Eval("STEACHINGIDEA1")%>' Font-Underline="true"></asp:Label>人
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="语言表达能力">
                            <ItemTemplate>
                                <table>
                                    <tr>
                                        <td>
                                            5分
                                        </td>
                                        <td>
                                            4分
                                        </td>
                                        <td>
                                            3分
                                        </td>
                                        <td>
                                            2分
                                        </td>
                                        <td>
                                            1分
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbLanguage5" runat="server" Text='<%#Eval("SLANGUAGEEXPRESSION5")%>'
                                                Font-Underline="true"></asp:Label>人
                                        </td>
                                        <td>
                                            <asp:Label ID="lbLanguage4" runat="server" Text='<%#Eval("SLANGUAGEEXPRESSION4")%>'
                                                Font-Underline="true"></asp:Label>人
                                        </td>
                                        <td>
                                            <asp:Label ID="lbLanguage3" runat="server" Text='<%#Eval("SLANGUAGEEXPRESSION3")%>'
                                                Font-Underline="true"></asp:Label>人
                                        </td>
                                        <td>
                                            <asp:Label ID="lbLanguage2" runat="server" Text='<%#Eval("SLANGUAGEEXPRESSION2")%>'
                                                Font-Underline="true"></asp:Label>人
                                        </td>
                                        <td>
                                            <asp:Label ID="lbLanguage1" runat="server" Text='<%#Eval("SLANGUAGEEXPRESSION1")%>'
                                                Font-Underline="true"></asp:Label>人
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="现场控制能力">
                            <ItemTemplate>
                                <table>
                                    <tr>
                                        <td>
                                            5分
                                        </td>
                                        <td>
                                            4分
                                        </td>
                                        <td>
                                            3分
                                        </td>
                                        <td>
                                            2分
                                        </td>
                                        <td>
                                            1分
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbControl5" runat="server" Text='<%#Eval("SLIVECONTROL5")%>' Font-Underline="true"></asp:Label>人
                                        </td>
                                        <td>
                                            <asp:Label ID="lbControl4" runat="server" Text='<%#Eval("SLIVECONTROL4")%>' Font-Underline="true"></asp:Label>人
                                        </td>
                                        <td>
                                            <asp:Label ID="lbControl3" runat="server" Text='<%#Eval("SLIVECONTROL3")%>' Font-Underline="true"></asp:Label>人
                                        </td>
                                        <td>
                                            <asp:Label ID="lbControl2" runat="server" Text='<%#Eval("SLIVECONTROL2")%>' Font-Underline="true"></asp:Label>人
                                        </td>
                                        <td>
                                            <asp:Label ID="lbControl1" runat="server" Text='<%#Eval("SLIVECONTROL1")%>' Font-Underline="true"></asp:Label>人
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="解答学员的要求和问题">
                            <ItemTemplate>
                                <table>
                                    <tr>
                                        <td>
                                            5分
                                        </td>
                                        <td>
                                            4分
                                        </td>
                                        <td>
                                            3分
                                        </td>
                                        <td>
                                            2分
                                        </td>
                                        <td>
                                            1分
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbAnswer5" runat="server" Text='<%#Eval("SANSWERPROBLEM5")%>' Font-Underline="true"></asp:Label>人
                                        </td>
                                        <td>
                                            <asp:Label ID="lbAnswer4" runat="server" Text='<%#Eval("SANSWERPROBLEM4")%>' Font-Underline="true"></asp:Label>人
                                        </td>
                                        <td>
                                            <asp:Label ID="lbAnswer3" runat="server" Text='<%#Eval("SANSWERPROBLEM3")%>' Font-Underline="true"></asp:Label>人
                                        </td>
                                        <td>
                                            <asp:Label ID="lbAnswer2" runat="server" Text='<%#Eval("SANSWERPROBLEM2")%>' Font-Underline="true"></asp:Label>人
                                        </td>
                                        <td>
                                            <asp:Label ID="lbAnswer1" runat="server" Text='<%#Eval("SANSWERPROBLEM1")%>' Font-Underline="true"></asp:Label>人
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="授课态度">
                            <ItemTemplate>
                                <table>
                                    <tr>
                                        <td>
                                            5分
                                        </td>
                                        <td>
                                            4分
                                        </td>
                                        <td>
                                            3分
                                        </td>
                                        <td>
                                            2分
                                        </td>
                                        <td>
                                            1分
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbAttitude5" runat="server" Text='<%#Eval("STEACHINGATTITUDE5")%>'
                                                Font-Underline="true"></asp:Label>人
                                        </td>
                                        <td>
                                            <asp:Label ID="lbAttitude4" runat="server" Text='<%#Eval("STEACHINGATTITUDE4")%>'
                                                Font-Underline="true"></asp:Label>人
                                        </td>
                                        <td>
                                            <asp:Label ID="lbAttitude3" runat="server" Text='<%#Eval("STEACHINGATTITUDE3")%>'
                                                Font-Underline="true"></asp:Label>人
                                        </td>
                                        <td>
                                            <asp:Label ID="lbAttitude2" runat="server" Text='<%#Eval("STEACHINGATTITUDE2")%>'
                                                Font-Underline="true"></asp:Label>人
                                        </td>
                                        <td>
                                            <asp:Label ID="lbAttitude1" runat="server" Text='<%#Eval("STEACHINGATTITUDE1")%>'
                                                Font-Underline="true"></asp:Label>人
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
         <tr>
            <td>
                <br />
            </td>
        </tr>
        <tr>
            <td colspan="7">
                <asp:Table ID="HolderTable"  runat="server"></asp:Table>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiEducationTrainProjectId" field="EDUCATIONTRAINPROJECTID"
        tablename="EHR_EDUCATIONTRAINPROJECT" />
    <input type="hidden" runat="server" id="hiInstructorIds" field="INSTRUCTORIDS" tablename="EHR_EDUCATIONTRAINPROJECT" />
    <input type="hidden" runat="server" id="hiInstructorNames" field="INSTRUCTORNAMES"
        tablename="EHR_EDUCATIONTRAINPROJECT" />
</asp:Content>
