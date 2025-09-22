<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Internal_Project.Login" %>

<!DOCTYPE html>
<html lang="en">
<head id="Head1" runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login - Cinema Pro</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .bg-photo {
            background-image: url('movie_ collage.jpeg'); 
            background-size: cover;
            background-position: center;
        }
    </style>
</head>
<body class="relative min-h-screen bg-photo">
  
    <div class="absolute inset-0 bg-black/80 z-0"></div>

    <div class="absolute top-5 left-5 bg-black/50 px-4 py-2 rounded z-10">
        <h1 class="text-4xl font-bold text-white">Cinema Pro</h1>
    </div>

    <form id="form1" runat="server" class="relative z-20 flex items-center justify-center min-h-screen w-full">

        <div class="bg-white/20 backdrop-blur-lg shadow-lg rounded-2xl p-10 w-[500px] text-white">

            <div class="mb-6">
                <label class="block text-sm font-medium mb-2 text-[#800000]">User Name</label>
                <asp:TextBox ID="txtUsername" runat="server"
                    CssClass="w-full px-4 py-2 rounded-lg bg-white/30 text-black focus:outline-none focus:ring-2 focus:ring-[#CD4C46]"
                    TextMode="Singleline" autocomplete="off" />
            </div>

            <div class="mb-6">
                <label class="block text-sm font-medium mb-2 text-[#800000]">Password</label>
                <asp:TextBox ID="txtPassword" runat="server"
                    CssClass="w-full px-4 py-2 rounded-lg bg-white/30 text-black focus:outline-none focus:ring-2 focus:ring-[#CD4C46]"
                    TextMode="Password" autocomplete="off" />
            </div>

            <asp:Button ID="btnLogin" runat="server" Text="Login"
                CssClass="w-full py-3 rounded-lg bg-[#800000] text-white font-semibold hover:opacity-90 transition"
                OnClick="btnLogin_Click" />

            <asp:Label ID="lblMessage" runat="server" CssClass="block mt-4 text-center text-[#800000]"></asp:Label>

            <p class="text-center text-sm mt-4 text-[#800000]">
                Don’t have an account?
                <a href="Register.aspx" class="underline text-[blue]">Register</a>
            </p>
        </div>
    </form>
</body>
</html>
