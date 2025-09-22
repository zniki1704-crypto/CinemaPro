<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Internal_Project.Register" %>

<!DOCTYPE html>
<html lang="en">
<head id="Head1" runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Register - Cinema Pro</title>
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

        <div class="bg-white/20 backdrop-blur-lg shadow-lg rounded-2xl p-10 w-[700px] text-white">

            <div class="mb-4">
                <label class="block text-sm font-medium mb-2 text-[#800000]">User Name</label>
                <asp:TextBox ID="txtName" runat="server"
                    CssClass="w-full px-4 py-2 rounded-lg bg-white/30 text-black focus:outline-none focus:ring-2 focus:ring-[#CD4C46]"
                    TextMode="SingleLine" autocomplete="off" />
            </div>

            <div class="mb-4">
                <label class="block text-sm font-medium mb-2 text-[#800000]">Email</label>
                <asp:TextBox ID="txtEmail" runat="server"
                    CssClass="w-full px-4 py-2 rounded-lg bg-white/30 text-black focus:outline-none focus:ring-2 focus:ring-[#CD4C46]"
                    TextMode="Email" autocomplete="off" />
            </div>

            <div class="mb-4">
                <label class="block text-sm font-medium mb-2 text-[#800000]">Password</label>
                <asp:TextBox ID="txtPassword" runat="server"
                    CssClass="w-full px-4 py-2 rounded-lg bg-white/30 text-black focus:outline-none focus:ring-2 focus:ring-[#CD4C46]"
                    TextMode="Password" autocomplete="off" />
            </div>

            <div class="mb-6">
                <label class="block text-sm font-medium mb-2 text-[#800000]">Confirm Password</label>
                <asp:TextBox ID="txtConfirmPassword" runat="server"
                    CssClass="w-full px-4 py-2 rounded-lg bg-white/30 text-black focus:outline-none focus:ring-2 focus:ring-[#CD4C46]"
                    TextMode="Password" autocomplete="off" />
            </div>

            <asp:Button ID="btnRegister" runat="server" Text="Register"
                CssClass="w-full py-3 rounded-lg bg-[#800000] text-white font-semibold hover:opacity-90 transition"
                OnClick="btnRegister_Click" />

            <asp:Label ID="lblMessage" runat="server" CssClass="block mt-4 text-center text-[#800000]"></asp:Label>

            <p class="text-center text-sm mt-4 text-[#800000]">
                Already have an account?
                <a href="Login.aspx" class="underline text-[blue]">Login</a>
            </p>
        </div>
    </form>
</body>
</html>
