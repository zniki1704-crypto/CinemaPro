<%@ Page Title="Select Seats" Language="C#" MasterPageFile="~/Cinema.Master" AutoEventWireup="true" CodeBehind="SeatSelection.aspx.cs" Inherits="Internal_Project.SeatSelection" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="container mx-auto p-6">
    <asp:Label ID="lblShowInfo" runat="server" CssClass="text-xl font-semibold"></asp:Label>

    <div id="seatGrid" class="mt-4">
        <asp:Repeater ID="rptSeats" runat="server">
            <ItemTemplate>
                <button type="button"
                        class='<%# Convert.ToBoolean(Eval("IsBooked")) ? "bg-gray-400 text-white px-3 py-2 rounded m-1 cursor-not-allowed" : "bg-green-500 hover:bg-green-600 text-white px-3 py-2 rounded m-1 select-seat" %>'
                        data-seatid='<%# Eval("SeatID") %>'
                        <%# Convert.ToBoolean(Eval("IsBooked")) ? "disabled" : "" %>><%# Eval("SeatNumber") %></button>
                <%# Eval("SeatNumber").ToString().EndsWith("9") ? "<br/>" : "" %>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <asp:HiddenField ID="hfSelectedSeats" runat="server" />

    <div class="mt-6">
        <asp:Button ID="btnNext" runat="server" Text="Next" CssClass="bg-red-600 hover:bg-red-700 text-white px-6 py-2 rounded" OnClick="btnNext_Click" />
        <asp:Label ID="lblMessage" runat="server" CssClass="text-red-600 ml-4"></asp:Label>
    </div>
</div>

<script>
    document.addEventListener('click', function(e) {
        if (e.target && e.target.classList.contains('select-seat')) {
            if (e.target.classList.contains('selected')) {
                e.target.classList.remove('selected','bg-blue-600');
                e.target.classList.add('bg-green-500');
            } else {
                e.target.classList.add('selected','bg-blue-600');
                e.target.classList.remove('bg-green-500');
            }
            updateHidden();
        }
    });

    function updateHidden() {
        var selected = Array.from(document.querySelectorAll('.select-seat.selected'))
                            .map(b => b.getAttribute('data-seatid'));
        document.getElementById('<%= hfSelectedSeats.ClientID %>').value = selected.join(',');
}

document.addEventListener('submit', function() { updateHidden(); }, true);
</script>
</asp:Content>
