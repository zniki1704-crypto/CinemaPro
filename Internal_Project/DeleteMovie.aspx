<%@ Page Title="" Language="C#" MasterPageFile="~/AdminControl.Master" AutoEventWireup="true" CodeBehind="DeleteMovie.aspx.cs" Inherits="Internal_Project.DeleteMovie" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="bg-white/90 rounded-2xl shadow-xl p-10 max-w-xl mx-auto backdrop-blur-md">
        <h2 class="text-4xl font-extrabold text-center text-[#003366] mb-8 tracking-wide">
            🗑️ Delete Movie
        </h2>

        <!-- Movie ID -->
        <div class="mb-5">
            <label class="block text-[#003366] font-semibold mb-2">Movie ID</label>
            <asp:TextBox ID="txtMovieID" runat="server" TextMode="Number"
                CssClass="w-full border border-gray-300 text-black rounded-lg p-3 focus:ring-2 focus:ring-[#003366] focus:outline-none" />
        </div>

        <!-- Page Selection -->
        <div class="mb-5">
            <label class="block text-[#003366] font-semibold mb-2">Delete From</label>
            <asp:RadioButtonList ID="rblDeletePage" runat="server" CssClass="flex gap-4 text-black" RepeatDirection="Horizontal">
                <asp:ListItem Text="Movie Page" Value="Movie" />
                <asp:ListItem Text="Home Page" Value="Home" />
                <asp:ListItem Text="Both" Value="Both" />
            </asp:RadioButtonList>
        </div>

        <!-- Delete Button -->
        <asp:Button ID="btnDelete" runat="server" Text="❌ Delete Movie"
            CssClass="w-full py-3 rounded-lg bg-red-600 text-white font-bold text-lg hover:bg-red-700 hover:scale-[1.02] active:scale-[0.98] transition transform duration-300 shadow-md"
            OnClick="btnDelete_Click" />
    </div>

</asp:Content>
