<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/AdminControl.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Internal_Project.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1 class="text-3xl font-bold mb-8">Admin Dashboard</h1>

    <!-- Cards Section -->
    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6 mb-6">

        <!-- Total Users -->
        <div class="bg-white/10 backdrop-blur-md rounded-xl p-6 shadow-lg cursor-pointer hover:bg-white/20"
             onclick="toggleTable('usersTable')">
            <h2 class="text-xl font-semibold">Total Users</h2>
            <asp:SqlDataSource ID="SqlUsersCount" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT * FROM [User_Login]"></asp:SqlDataSource>
        </div>

        <!-- Total Bookings -->
        <div class="bg-white/10 backdrop-blur-md rounded-xl p-6 shadow-lg cursor-pointer hover:bg-white/20"
             onclick="toggleTable('bookingsTable')">
            <h2 class="text-xl font-semibold">Total Bookings</h2>
            
            
        </div>

        <!-- Revenue -->
        <div class="bg-white/10 backdrop-blur-md rounded-xl p-6 shadow-lg cursor-pointer hover:bg-white/20"
             onclick="toggleTable('revenueTable')">
            <h2 class="text-xl font-semibold">Revenue</h2>
            
        </div>
    </div>

    <!-- Hidden Tables -->
    <div id="usersTable" class="hidden bg-white/10 backdrop-blur-md p-6 rounded-xl mb-6">
        <h2 class="text-2xl font-bold mb-4">All Users</h2>
        <asp:SqlDataSource ID="SqlAllUsers" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT * FROM [User_Login]"></asp:SqlDataSource>
       <asp:GridView ID="gvUsers" runat="server" DataSourceID="SqlAllUsers" AutoGenerateColumns="True" GridLines="None"
    CssClass="w-full border-collapse rounded-lg overflow-hidden shadow-lg text-sm">
    <HeaderStyle CssClass="bg-[#468fa2 ] text-white font-bold text-base text-left" />

   
    <RowStyle CssClass="bg-white text-black hover:bg-gray-100 transition" />

    
    <AlternatingRowStyle CssClass="bg-gray-100 text-black hover:bg-gray-200 transition" />

    
    <SelectedRowStyle CssClass="bg-blue-500 text-white" />
</asp:GridView>

    </div>

    <div id="bookingsTable" class="hidden bg-white/10 backdrop-blur-md p-6 rounded-xl mb-6">
        <h2 class="text-2xl font-bold mb-4">All Bookings</h2>
    </div>

    <div id="revenueTable" class="hidden bg-white/10 backdrop-blur-md p-6 rounded-xl mb-6">
        <h2 class="text-2xl font-bold mb-4">All Payments</h2>
    </div>

    <script>
        function toggleTable(tableId) {
            document.getElementById("usersTable").classList.add("hidden");
            document.getElementById("bookingsTable").classList.add("hidden");
            document.getElementById("revenueTable").classList.add("hidden");
            document.getElementById(tableId).classList.toggle("hidden");
        }
    </script>

</asp:Content>
