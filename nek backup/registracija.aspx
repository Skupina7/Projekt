<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registracija.aspx.cs" Inherits="Projekt.registracija" %>

<!DOCTYPE html>
<!-- Website template by freewebsitetemplates.com -->
<html>
<head>
	<meta charset="UTF-8">
	<title>Rooms - Bhaccasyoniztas Beach Resort Website Template</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
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
						<li class="selected">
							<a href="registracija.aspx">Register</a>
						</li>
						<li>
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
	<h1>REGISTER</h1>
                            <form ID="registracija" runat="server">



                                <asp:Label ID="napis1" runat="server" Text="Uporabnisko Ime"></asp:Label>
                                <asp:TextBox ID="upime" runat="server" style="margin-left: 55px"></asp:TextBox>
                                <asp:RequiredFieldValidator ErrorMessage="Zahtevano" ForeColor="Red" ControlToValidate="upime"
                    runat="server" ID="RequiredFieldValidator1" />
                                <br /><br />
                                <asp:Label ID="napis2" runat="server" Text="Email"></asp:Label>
                                <asp:TextBox ID="email" runat="server" style="margin-left: 128px"></asp:TextBox>
                                <asp:RequiredFieldValidator ErrorMessage="Zahtevano" ForeColor="Red" ControlToValidate="email"
                    runat="server" ID="RequiredFieldValidator2" />
                                <br /><br />




                                Geslo<asp:TextBox ID="geslo1" TextMode="Password" runat="server" style="margin-left: 133px"></asp:TextBox>
                                <asp:RequiredFieldValidator ErrorMessage="Zahtevano" ForeColor="Red" ControlToValidate="geslo1"
                    runat="server" ID="RequiredFieldValidator3" />
                                <br />
                                <br />
                                <asp:Label ID="napis3" runat="server" Text="Vnesite ponovno"></asp:Label>
                                <asp:TextBox ID="geslo2" TextMode="Password" runat="server" style="margin-left: 57px"></asp:TextBox>
                                <asp:RequiredFieldValidator ErrorMessage="Zahtevano" ForeColor="Red" ControlToValidate="geslo2"
                    runat="server" ID="RequiredFieldValidator4" />
                                <br />
                                <br />
                                <asp:Button ID="Button_Submit" runat="server" style="margin-left: 191px" Text="Registracija" OnClick="Button_Submit_Click1" />



                                <asp:Label ID="Label1" runat="server"></asp:Label>



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
						<a href="index.aspx">Home</a>
					</li>
					<li>
						<a href="about.aspx">About</a>
					</li>
					<li class="active">
						<a href="register.aspx">Register</a>
					</li>
					<li>
						<a href="login.aspx">Login</a>
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