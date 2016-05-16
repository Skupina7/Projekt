<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="kontakti.aspx.cs" Inherits="Projekt.login" %>

<!DOCTYPE html>
<!-- Website template by freewebsitetemplates.com -->
<html>
<head>
	<meta charset="UTF-8">
	<title>Contact - Bhaccasyoniztas Beach Resort Website Template</title>
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
						<li>
							<a href="registracija.aspx">Register</a>
						</li>
						<li >
							<a href="login.aspx">Login</a>
						</li>
						<li>
							<a href="galerija.aspx">Galerija</a>
						</li>
						<li>
							<a href="novice.aspx">News</a>
						</li>
						<li    class="selected">
							<a href="kontakti.aspx">Contact</a>
						</li>
					</ul>
				</div>
			</div>
			<div id="contents">
				<div class="box">
					<div>
						<div id="contact" class="body">
							<h1>Contact</h1>
							<form action="index.aspx" method="post">
								<table>
									<tbody>
										<tr>
											<td>Name:</td>
											<td><input type="text" value="" class="txtfield"></td>
										</tr> <tr>
											<td>Email:</td>
											<td><input type="text" value="" class="txtfield"></td>
										</tr> <tr>
											<td>Subject:</td>
											<td><input type="text" value="" class="txtfield"></td>
										</tr> <tr>
											<td class="txtarea">Message:</td>
											<td><textarea></textarea></td>
										</tr> <tr>
											<td></td>
											<td><input type="submit" value="" class="btn"></td>
										</tr>
									</tbody>
								</table>
							</form>
							<h2>Bhaccasyoniztas Beach Resort</h2>
							<p>
								<span>Address:</span> 123 Lorem Ipsum Cove, Sed Ut City, LI 12345
							</p>
							<p>
								<span>Telephone Number:</span> 1-800-999-9999
							</p>
							<p>
								<span>Fax Number:</span> 1-800-111-1111
							</p>
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
					<li>
						<a href="rooms.aspx">Rooms</a>
					</li>
					<li>
						<a href="dives.aspx">Dive Site</a>
					</li>
					<li>
						<a href="foods.aspx">Food</a>
					</li>
					<li>
						<a href="news.aspx">News</a>
					</li>
					<li class="active">
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