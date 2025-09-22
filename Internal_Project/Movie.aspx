<%@ Page Title="Movie" Language="C#" MasterPageFile="~/Cinema.Master" AutoEventWireup="true" CodeBehind="Movie.aspx.cs" Inherits="Internal_Project.Movie" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="container mx-auto p-6">
    <h1 class="text-3xl font-bold text-red-600 mb-6">Now Showing</h1>

    <asp:Repeater ID="rptMovies" runat="server" OnItemDataBound="rptMovies_ItemDataBound">
        <ItemTemplate>
            <div class="bg-white rounded-lg shadow p-4 mb-6">
                <h2 class="text-2xl font-semibold mb-1"><%# Eval("Title") %></h2>
                <p class="text-gray-500 mb-2">Duration: <%# Eval("Duration") %> min | <%# Eval("Genre") %></p>

                <asp:Repeater ID="rptShows" runat="server">
                    <HeaderTemplate><div class="mt-3 grid grid-cols-1 md:grid-cols-3 gap-3"></HeaderTemplate>
                    <ItemTemplate>
                        <div class="border rounded p-3">
                            <p class="font-medium"><%# Eval("Language") %> | <%# Eval("Format") %></p>
                            <p class="text-gray-600 text-sm"><%# Eval("ShowTime", "{0:dd MMM yyyy HH:mm}") %></p>
                            <p class="text-sm">Price: ₹<%# Eval("Price") %></p>
                            <asp:HyperLink runat="server" ID="hlBook"
                                NavigateUrl='<%# "SeatSelection.aspx?ShowID=" + Eval("ShowID") %>'
                                CssClass="inline-block mt-2 bg-red-600 hover:bg-red-700 text-white px-4 py-2 rounded">Book Now</asp:HyperLink>
                        </div>
                    </ItemTemplate>
                    <FooterTemplate></div></FooterTemplate>
                </asp:Repeater>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>
</asp:Content>
