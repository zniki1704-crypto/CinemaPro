<%@ Page Title="Add Movie" Language="C#" MasterPageFile="~/AdminControl.Master" AutoEventWireup="true" CodeBehind="AddMovie.aspx.cs" Inherits="Internal_Project.AddMovie" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="bg-white/90 rounded-2xl shadow-xl p-10 max-w-3xl mx-auto backdrop-blur-md">
        <h2 class="text-4xl font-extrabold text-center text-[#003366] mb-8 tracking-wide">
            🎬 Add New Movie
        </h2>

        <!-- Movie Title -->
        <div class="mb-5">
            <label class="block text-[#003366] font-semibold mb-2">Movie Title</label>
            <asp:TextBox ID="txtTitle" runat="server"
                CssClass="w-full border border-gray-300 text-black rounded-lg p-3 focus:ring-2 focus:ring-[#003366] focus:outline-none" />
        </div>

        <!-- Genre -->
        <div class="mb-5">
            <label class="block text-[#003366] font-semibold mb-2">Genre</label>
            <asp:DropDownList ID="ddlGenre" runat="server"
                CssClass="w-full border border-gray-300 text-black rounded-lg p-3 focus:ring-2 focus:ring-[#003366] focus:outline-none">
                <asp:ListItem>Action</asp:ListItem>
                <asp:ListItem>Drama</asp:ListItem>
                <asp:ListItem>Comedy</asp:ListItem>
                <asp:ListItem>Horror</asp:ListItem>
                <asp:ListItem>Thriller</asp:ListItem>
            </asp:DropDownList>
        </div>

        <!-- Duration -->
        <div class="mb-5">
            <label class="block text-[#003366] font-semibold mb-2">Duration (minutes)</label>
            <asp:TextBox ID="txtDuration" runat="server" TextMode="Number"
                CssClass="w-full border border-gray-300 text-black rounded-lg p-3 focus:ring-2 focus:ring-[#003366] focus:outline-none" />
        </div>

        <!-- Language -->
        <div class="mb-5">
            <label class="block text-[#003366] font-semibold mb-2">Language</label>
            <asp:DropDownList ID="ddlLanguage" runat="server"
                CssClass="w-full border border-gray-300 text-black rounded-lg p-3 focus:ring-2 focus:ring-[#003366] focus:outline-none">
                <asp:ListItem>English</asp:ListItem>
                <asp:ListItem>Hindi</asp:ListItem>
                <asp:ListItem>Gujarati</asp:ListItem>
                <asp:ListItem>Tamil</asp:ListItem>
                <asp:ListItem>Telugu</asp:ListItem>
            </asp:DropDownList>
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
        <!-- Display Option -->
            <div class="mb-5">
                <label class="block text-[#003366] font-semibold mb-2 ">Display On</label>
            <asp:RadioButtonList ID="rblDisplay" runat="server" CssClass="flex gap-4 text-black">
                 <asp:ListItem Text="Home" Value="Home"></asp:ListItem>
                 <asp:ListItem Text="Movie" Value="Movie" Selected="True"></asp:ListItem>
                 <asp:ListItem Text="Both" Value="Both"></asp:ListItem>
            </asp:RadioButtonList>
            </div>


        <!-- Add Movie Button -->
        <asp:Button ID="btnAdd" runat="server" Text="➕ Add Movie"
            CssClass="w-full py-3 rounded-lg bg-[#003366] text-white font-bold text-lg hover:bg-[#004080] hover:scale-[1.02] active:scale-[0.98] transition transform duration-300 shadow-md"
            OnClick="btnAdd_Click" />

        <!-- SQL DataSource -->
        <asp:SqlDataSource ID="SqlDataSourceMovies" runat="server"
             ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
             InsertCommand="INSERT INTO [Movies] ([Title],[Genre],[Duration],[Language],[ReleaseDate],[PosterURL],[Description],[DisplayOn]) VALUES (@Title,@Genre,@Duration,@Language,@ReleaseDate,@PosterURL,@Description,@DisplayOn)">
    <InsertParameters>
        <asp:ControlParameter Name="Title" ControlID="txtTitle" PropertyName="Text" Type="String" />
        <asp:ControlParameter Name="Genre" ControlID="ddlGenre" PropertyName="SelectedValue" Type="String" />
        <asp:ControlParameter Name="Duration" ControlID="txtDuration" PropertyName="Text" Type="Int32" />
        <asp:ControlParameter Name="Language" ControlID="ddlLanguage" PropertyName="SelectedValue" Type="String" />
        <asp:ControlParameter Name="ReleaseDate" ControlID="txtReleaseDate" PropertyName="Text" Type="DateTime" />
        <asp:ControlParameter Name="PosterURL" ControlID="txtPoster" PropertyName="Text" Type="String" />
        <asp:ControlParameter Name="Description" ControlID="txtDescription" PropertyName="Text" Type="String" />
        <asp:ControlParameter Name="DisplayOn" ControlID="rblDisplay" PropertyName="SelectedValue" Type="String" />
    </InsertParameters>
</asp:SqlDataSource>

    </div>

</asp:Content>
