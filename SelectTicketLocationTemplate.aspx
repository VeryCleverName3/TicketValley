<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SelectTicketLocationTemplate.aspx.cs" Inherits="TicketValley.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron blue">
        <h2>Select your seat:</h2>
    </div>
    <br />
    <div id="ticketSelectWrapper"><canvas id="ticketSelect"></canvas></div>
    <asp:Button ID="submitTicketsButton" runat="server" Text="Submit" OnClick="submitTicketsButton_Click" />
    <asp:TextBox ID="selectedTicketsBox" runat="server" style="display:none"></asp:TextBox>

    <script>
        //Theater is 20*33 biggest
        var ticketBox = document.getElementById('<%= selectedTicketsBox.ClientID %>');
        ticketBox.value = "";
        var c = document.getElementById("ticketSelect");
        var scale = 2;
        c.width = scale * 0.7 * window.innerWidth;
        c.height = scale * 0.5 * window.innerHeight;
        c.style.height = "50vh";
        c.style.width = "70vw";
        var ctx = c.getContext("2d");
        var seats = [];
        var selectedSeats = [];

        //Create seats
        for (var k = 0; k < 20; k++) {
            for (var j = 0; j < 33; j++) {
                new Seat(j, k, "hello", "cyan");
            }
        }

        var seatWidth = c.width / 50;
        var seatHeight = seatWidth;

        drawSeats();

        //draws seats
        function drawSeats() {
            ctx.clearRect(0, 0, c.width, c.height);
            for (i of seats) {
                ctx.fillStyle = i.color;
                ctx.fillRect(i.realX, i.realY, seatWidth, seatWidth * 3 / 4);
                ctx.strokeStyle = "black";
                ctx.lineWidth = window.innerWidth * 0.002;
                ctx.strokeRect(i.realX, i.realY, seatWidth, seatWidth * 3 / 4);
            }
        }

        function Seat(x, y, id, color) {
            seats.push(this);
            this.x = x;
            this.y = y;
            this.color = color;
            this.id = id;
            this.realX = x * ((c.width / 33) * 0.95) + (0.025 * c.width);
            this.realY = y * ((c.height / 20) * 0.95) + (0.025 * c.height);
            drawSeats();
        }

        function getClosestSeat(x, y) {
            var lowestDistance = Infinity;
            var closestSeat;
            for (i of seats) {
                if (distance(x, y, i.realX + (seatWidth / 2), i.realY + (seatWidth * 3 / 8)) < lowestDistance) {
                    lowestDistance = distance(x, y, i.realX, i.realY);
                    closestSeat = i;
                }
            }

            return closestSeat;
        }

        function distance(x1, y1, x2, y2) {
            return Math.abs(Math.hypot(y1 - y2, x1 - x2));
        }

        c.onmousedown = function (e) {
            var clickedSeat = getClosestSeat((e.clientX - c.offsetLeft) * scale, (e.clientY - c.offsetTop) * scale);

            if (clickedSeat.color == "purple") {
                clickedSeat.color = "cyan";
                selectedSeats = selectedSeats.filter((a, b, c) => { return a != clickedSeat });
            } else if(clickedSeat.color == "cyan") {
                clickedSeat.color = "purple";
                selectedSeats.push(clickedSeat);
            }

            ticketBox.value = JSON.stringify(selectedSeats);

            drawSeats();
        }
    </script>
</asp:Content>
