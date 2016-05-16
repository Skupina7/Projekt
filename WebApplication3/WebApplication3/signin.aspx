<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="signin.aspx.cs" Inherits="WebApplication3.signin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Website template by freewebsitetemplates.com -->
	<div id="background">
		<div id="page">
			<div id="contents">
				<div class="box">
					<div>
						<div class="body">
                            	<h1>LOGIN</h1>


        <asp:Label ID="Label1" runat="server" Text="username"></asp:Label>&nbsp;
        <asp:TextBox ID="username1" runat="server">

        </asp:TextBox>&nbsp;<asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="username1"
                    runat="server" />
        <br /><br />
        <asp:Label ID="Label2" runat="server" Text="Geslo:"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="password1" TextMode="Password" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="password1"
                    runat="server" />


        <br /><br />
        <asp:Button ID="signin_button" runat="server" OnClick="signin_button_Click" Text="Prijavi se" />
        <br /><br />
        <asp:Label ID="Label3" runat="server"></asp:Label>
        


						</div>
					</div>
				</div>
			</div>


</asp:Content>
