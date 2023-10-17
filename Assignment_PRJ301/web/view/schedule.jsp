<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <style>
            table {
                width: 100%;
                border-collapse: collapse;
            }

            th, td {
                border: 1px solid #dddddd;
                text-align: center;
                padding: 8px;
            }

            th {
                background-color: #f2f2f2;
            }

            select {
                width: 100%;
            }

            .online-indicator {
                display: inline-block;
                background-color: #4CAF50;
                width: 10px;
                height: 10px;
                border-radius: 50%;
                margin-right: 5px;
            }

            .online-text a {
                color: #4CAF50;
                font-weight: bold;
            }

            .label {
                padding: 3px 6px;
                margin-left: 5px;
                text-decoration: none;
                border-radius: 3px;
            }

            .label-warning {
                background-color: #f0ad4e;
                color: #fff;
            }

            .label-default {
                background-color: #777;
                color: #fff;
            }

            .label-success {
                background-color: #5bc0de;
                color: #fff;
            }

            .label-primary {
                background-color: #337ab7;
                color: #fff;
            }

            .label-danger {
                background-color: #d9534f;
                color: #fff;
            }

            .label-info {
                background-color: #5bc0de;
                color: #fff;
            }

            .blink {
                animation: blinker 1s linear infinite;
            }

            @keyframes blinker {
                50% {
                    opacity: 0;
                }
            }
        </style>
    </head>
    <body>
        <table>
            <thead>
                <tr>
                    <th rowspan="2">
                        <span class="auto-style1"><strong>Year</strong></span>
                        <select name="ctl00$mainContent$drpYear" onchange="javascript:setTimeout('__doPostBack(\'ctl00$mainContent$drpYear\',\'\')', 0)" id="ctl00_mainContent_drpYear">
                            <option value="2020">2020</option>
                            <option value="2021">2021</option>
                            <option value="2022">2022</option>
                            <option selected="selected" value="2023">2023</option>
                            <option value="2024">2024</option>
                        </select>
                        <br>
                        Week
                        <select name="ctl00$mainContent$drpSelectWeek" onchange="javascript:setTimeout('__doPostBack(\'ctl00$mainContent$drpSelectWeek\',\'\')', 0)" id="ctl00_mainContent_drpSelectWeek">
                            <option value="1">02/01 To 08/01</option>
                            <!-- Add other week options here -->
                        </select>
                    </th>
                    <th align="center">Mon</th>
                    <th align="center">Tue</th>
                    <th align="center">Wed</th>
                    <th align="center">Thu</th>
                    <th align="center">Fri</th>
                    <th align="center">Sat</th>
                    <th align="center">Sun</th>
                </tr>
                <tr>
                    <th align="center">09/10</th>
                    <th align="center">10/10</th>
                    <th align="center">11/10</th>
                    <th align="center">12/10</th>
                    <th align="center">13/10</th>
                    <th align="center">14/10</th>
                    <th align="center">15/10</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Slot 0 </td>
                    <td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td></tr><tr><td>Slot 1 </td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td></tr><tr><td>Slot 2 </td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td></tr><tr><td>Slot 3 </td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td></tr><tr><td>Slot 4 </td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td></tr><tr><td>Slot 5 </td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td></tr><tr><td>Slot 6 </td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td></tr><tr><td>Slot 7 </td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td></tr><tr><td>Slot 8 </td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td></tr><tr><td>Slot 9 </td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td></tr><tr><td>Slot 10 </td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td></tr><tr><td>Slot 11 </td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td></tr><tr><td>Slot 12 </td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td></tr>

            </tbody>
        </table>
    </body>
</html>
