<%@ Page Title="" Language="C#" MasterPageFile="~/AdminControl.Master" AutoEventWireup="true" CodeBehind="UpdateMovie.aspx.cs" Inherits="Internal_Project.UpdateMovie" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="bg-white/90 rounded-2xl shadow-xl p-10 max-w-3xl mx-auto backdrop-blur-md">
        <h2 class="text-4xl font-extrabold text-center text-[#003366] mb-8 tracking-wide">
            ✏️ Update Movie
        </h2>

        <!-- Movie ID -->
        <div class="mb-5">
            <label class="block text-[#003366] font-semibold mb-2">Movie ID</label>
            <asp:TextBox ID="txtMovieID" runat="server" TextMode="Number"
                CssClass="w-full border border-gray-300 text-black rounded-lg p-3 focus:ring-2 focus:ring-[#003366] focus:outline-none" />
        </div>

        <!-- Title -->
        <div class="mb-5">
            <label class="block text-[#003366] font-semibold mb-2">Movie Title</label>
            <asp:TextBox ID="txtTitle" runat="server"
                CssClass="w-full border border-gray-300 text-black rounded-lg p-3 focus:ring-2 focus:ring-[#003366] focus:outline-none" />
        </div>

        <!-- Genre -->
        <div class="mb-5">
            <label class="block text-[#003366] font-semibold mb-2">Genre</label>
            <asp:TextBox ID="txtGenre" runat="server"
                CssClass="w-full border border-gray-300 text-black rounded-lg p-3 focus:ring-2 focus:ring-[#003366] focus:outline-none" />
        </div>

        <!-- Duration -->
        <div class="mb-5">
            <label class="block text-[#003366] font-semibold mb-2">Duration</label>
            <asp:TextBox ID="txtDuration" runat="server" TextMode="Number"
                CssClass="w-full border border-gray-300 text-black rounded-lg p-3 focus:ring-2 focus:ring-[#003366] focus:outline-none" />
        </div>

        <!-- Language -->
        <div class="mb-5">
            <label class="block text-[#003366] font-semibold mb-2">Language</label>
            <asp:TextBox ID="txtLanguage" runat="server"
                CssClass="w-full border border-gray-300 text-black rounded-lg p-3 focus:ring-2 focus:ring-[#003366] focus:outline-none" />
        </div>

        <!-- Release Date -->
        <div class="mb-5">
            <label class="block text-[#003366] font-semibold mb-2">Release Date</label>
            <asp:TextBox ID="txtReleaseDate" runat="server" TextMode="Date"
                CssClass="w-full border border-gray-300 text-black rounded-lg p-3 focus:ring-2 focus:ring-[#003366] focus:outline-none" />
        </div>

        <!-- Poster URL -->
        <div class="mb-5">
            <label class="block text-[#003366] font-semibold mb-2">Poster URL</label>
            <asp:TextBox ID="txtPoster" runat="server"
                CssClass="w-full border border-gray-300 text-black rounded-lg p-3 focus:ring-2 focus:ring-[#003366] focus:outline-none" />
        </div>

        <!-- Description -->
        <div class="mb-5">
            <label class="block text-[#003366] font-semibold mb-2">Description</label>
            <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="4"
                CssClass="w-full border border-gray-300 text-black rounded-lg p-3 focus:ring-2 focus:ring-[#003366] focus:outline-none" />
        </div>

        <!-- Page Selection -->
        <div class="mb-5">
            <label class="block text-[#003366] font-semibold mb-2">Update On</label>
            <asp:RadioButtonList ID="rblUpdatePage" runat="server" CssClass="flex gap-4 text-black" RepeatDirection="Horizontal">
                <asp:ListItem Text="Movie Page" Value="Movie" />
                <asp:ListItem Text="Home Page" Value="Home" />
                <asp:ListItem Text="Both" Value="Both" />
            </asp:RadioButtonList>
        </div>

        <!-- Update Button -->
        <asp:Button ID="btnUpdate" runat="server" Text="🔄 Update Movie"
            CssClass="w-full py-3 rounded-lg bg-[#003366] text-white font-bold text-lg hover:bg-[#004080] hover:scale-[1.02] active:scale-[0.98] transition transform duration-300 shadow-md"
            OnClick="btnUpdate_Click" />
    </div>

</asp:Content>
