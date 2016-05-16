<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="WebApplication3.signup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

	<div id="background">
		<div id="page">
			<div id="contents">
				<div class="box">
					<div>
						<div class="body">
                            	<h1>Register</h1>


<table border="0">
    <tr>
        <th colspan="3">
        </th>
    </tr>
    <tr>
        <td>
            Username
        </td>
        <td>
            <asp:TextBox ID="username1" runat="server" />
        </td>
        <td>
            <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="Username1"
                runat="server" />
        </td>
    </tr>
        <tr>
        <td>
            First name
        </td>
        <td>
            <asp:TextBox ID="Firstname1" runat="server" />
        </td>
        <td>
            <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="Firstname1"
                runat="server" />
        </td>
    </tr>
        <tr>
        <td>
            Last name
        </td>
        <td>
            <asp:TextBox ID="Lastname1" runat="server" />
        </td>
        <td>
            <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="Lastname1"
                runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            Password
        </td>
        <td>
            <asp:TextBox ID="password1" runat="server" TextMode="Password" />
        </td>
        <td>
            <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="Password1"
                runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            Confirm Password
        </td>
        <td>
            <asp:TextBox ID="ConfirmPassword1" runat="server" TextMode="Password" />
        </td>
        <td>
            <asp:CompareValidator ErrorMessage="Passwords do not match." ForeColor="Red" ControlToCompare="Password1"
                ControlToValidate="ConfirmPassword1" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            Email
        </td>
        <td>
            <asp:TextBox ID="email1" runat="server" />
        </td>
        <td>
            <asp:RequiredFieldValidator ErrorMessage="Required" Display="Dynamic" ForeColor="Red"
                ControlToValidate="email1" runat="server" />
            <asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                ControlToValidate="email1" ForeColor="Red" ErrorMessage="Invalid email address." />
        </td>
    </tr>
    <tr>
        <td>
        </td>
        <td>
            <asp:Button ID="signup_button" runat="server" OnClick="reg_button_Click" Text="Register" />
        </td>
        <td>
        </td>
    </tr>
    <tr>
        <td>
                    <asp:Label ID="Label3" runat="server"></asp:Label>
        </td>
    </tr>
</table>


						</div>
					</div>
				</div>
			</div>
</asp:Content>
