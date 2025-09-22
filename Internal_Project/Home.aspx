<%@ Page Title="Home" Language="C#" MasterPageFile="~/Cinema.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Internal_Project.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="p-8">
        <h1 class="text-4xl font-extrabold text-red-600 mb-10 flex items-center gap-3 drop-shadow-md">
            Now Showing
        </h1>

        <!-- Movies Grid -->
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-10">
            <asp:Repeater ID="RepeaterMovies" runat="server">
                <ItemTemplate>
                    <div class="relative group overflow-hidden rounded-3xl shadow-2xl cursor-pointer">
                        <!-- Movie Poster -->
                        <img src='<%# Eval("PosterURL") %>' alt='<%# Eval("Title") %>' 
                             class="w-full h-72 object-cover transform transition-transform duration-500 group-hover:scale-110 brightness-90" />

                        <!-- Gradient overlay -->
                        <div class="absolute inset-0 bg-gradient-to-t from-black/70 to-transparent opacity-80 group-hover:opacity-60 transition-opacity duration-500"></div>

                        <!-- Movie Info -->
                        <div class="absolute bottom-0 p-5">
                            <h2 class="text-2xl font-bold text-white drop-shadow-lg group-hover:text-yellow-400 transition-colors duration-300">
                                <%# Eval("Title") %>
                            </h2>
                            <p class="text-sm text-gray-200 line-clamp-3 mt-2 drop-shadow-md">
                                <%# Eval("Description") %>
                            </p>

                            <!-- Book Now button -->
                            <asp:HyperLink ID="btnBook" runat="server"
                                NavigateUrl='<%# "~/SeatSelection.aspx?MovieID=" + Eval("MovieID") %>'
                                CssClass="inline-block mt-4 px-6 py-3 bg-gradient-to-r from-red-600 to-red-700 text-white font-semibold rounded-xl shadow-lg hover:from-yellow-400 hover:to-red-600 transition-all duration-300">
                                Book Now
                            </asp:HyperLink>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
