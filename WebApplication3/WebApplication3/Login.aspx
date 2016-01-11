<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Projekt.login" %>

<!DOCTYPE html>
<!-- Website template by freewebsitetemplates.com -->
<html>
<head>
	<meta charset="UTF-8">
	<title>Dive Sites - Bhaccasyoniztas Beach Resort Website Template</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
    <style type="text/css">
        #form1 {
            height: 172px;
            width: 766px;
        }
    </style>
</head>
<body>
	<div id="background">
		<div id="page">
			<div id="header">
				<div id="logo">
					<a href="index.aspx"><img src="images/logo.png" alt="LOGO" height="112" width="118"></a>
				</div>
				<div id="navigation">
					<ul>
						<li>
							<a href="index.aspx">Home</a>
						</li>
						<li>
							<a href="info.aspx">About</a>
						</li>
						<li>
							<a href="registracija.aspx">Register</a>
						</li>
						<li class="selected">
							<a href="login.aspx">Login</a>
						</li>
						<li>
							<a href="galerija.aspx">Galerija</a>
						</li>
						<li>
							<a href="novice.aspx">News</a>
						</li>
						<li>
							<a href="kontakti.aspx">Contact</a>
						</li>
					</ul>
				</div>
			</div>
			<div id="contents">
				<div class="box">
					<div>
						<div class="body">
                            	<h1>LOGIN</h1>
                            <p>Prijava:</p>

    <form id="form_login" runat="server">

        <asp:Label ID="Label1" runat="server" Text="Up. ime:"></asp:Label>&nbsp;
        <asp:TextBox ID="username1" runat="server">

        </asp:TextBox>&nbsp;<asp:RequiredFieldValidator ErrorMessage="Zahtevano" ForeColor="Red" ControlToValidate="username1"
                    runat="server" />
        <br /><br />
        <asp:Label ID="Label2" runat="server" Text="Geslo:"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="password1" TextMode="Password" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ErrorMessage="Zahtevano" ForeColor="Red" ControlToValidate="password1"
                    runat="server" />


        <br /><br />
        <asp:Button ID="login_button" runat="server" OnClick="login_button_Click" Text="Prijavi se" />
        <br /><br />
        <asp:Label ID="Label3" runat="server"></asp:Label>
        


   </form>


						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="footer">
			<div>
				<ul class="navigation">
					<li>
						<a href="index.aspx">Home</a>	</li>
					<li>
						<a href="about.aspx">About</a>
					</li>
					<li>
						<a href="rooms.aspx">Rooms</a>
					</li>
					<li class="active">
						<a href="dives.aspx">Dive Site</a>
					</li>
					<li>
						<a href="foods.aspx">Food</a>
					</li>
					<li>
						<a href="news.aspx">News</a>
					</li>
					<li>
						<a href="contact.aspx">Contact</a>
					</li>
				</ul>
				<div id="connect">
					<a href="http://pinterest.com/fwtemplates/" target="_blank" class="pinterest"></a> <a href="http://freewebsitetemplates.com/go/facebook/" target="_blank" class="facebook"></a> <a href="http://freewebsitetemplates.com/go/twitter/" target="_blank" class="twitter"></a> <a href="http://freewebsitetemplates.com/go/googleplus/" target="_blank" class="googleplus"></a>
				</div>
			</div>
			<p>
				© 2023 by BHACCASYONIZTAS BEACH RESORT. All Rights Reserved
			</p>
		</div>
	</div>
</body>
</html>