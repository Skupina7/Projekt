<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="WebApplication3.profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1><b>Change of password</b></h1>
    <table style="width: 100%">
        <tr>
            <td style="width: 160px; height: 66px;">Old password</td>
            <td style="width: 343px; height: 66px;">
                <asp:TextBox ID="TextBox3" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td style="height: 66px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required!" ControlToValidate="TextBox3" ValidationGroup="Sprememba"></asp:RequiredFieldValidator>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 160px; height: 66px;">Old pass again</td>
            <td style="height: 66px; width: 343px;">
                <asp:TextBox ID="TextBox4" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td style="height: 66px">
                <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="TextBox3" ControlToValidate="TextBox4" ValidationGroup="Sprememba" ErrorMessage="Old passwords do not match!" ForeColor="Red"></asp:CompareValidator>
               <br /> <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required!" ValidationGroup="Sprememba" ControlToValidate="TextBox4"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 160px; height: 66px;">New password</td>
            <td style="width: 343px; height: 66px;">
                <asp:TextBox ID="TextBox5" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td style="height: 66px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Required!" ControlToValidate="TextBox5" ValidationGroup="Sprememba" ></asp:RequiredFieldValidator>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 160px; height: 66px;"></td>
            <td style="width: 343px; height: 66px;">
                <asp:Button ID="Button2" runat="server" Text="Spremeni" OnClick="Button2_Click" ValidationGroup="Sprememba" Height="56px" Width="185px"/>
                <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
            <td style="height: 66px"></td>
        </tr>
    </table>
</asp:Content>
