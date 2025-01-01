<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Practice.aspx.cs" Inherits="DatatablesPractice.Practice" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DataTables Example</title>
    <link rel="stylesheet" href="https://cdn.datatables.net/2.1.8/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/2.1.8/css/dataTables.dataTables.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/2.1.8/css/dataTables.bootstrap4.min.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/2.1.8/css/dataTables.dataTables.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/searchbuilder/1.8.1/css/searchBuilder.dataTables.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/datetime/1.5.4/css/dataTables.dateTime.min.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/2.1.8/css/dataTables.dataTables.css" />
    <style>
        tfoot input {
            width: 100%;
            padding: 3px;
            box-sizing: border-box;
        }
    </style>
</head>
<body>
    <div>
        <table id="example" width="100%" data-order='[ 2, "asc" ]' data-page-length='50'>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Position</th>
                    <th>Office</th>
                    <th>Ext</th>
                    <th>Date</th>
                    <th>Salary</th>

                </tr>
            </thead>
            <tbody>
            </tbody>
            <tfoot>
                <tr>
                    <th>Name</th>
                    <th>Position</th>
                    <th>Office</th>
                    <th>Ext</th>
                    <th>date</th>
                    <th>Salary</th>
                </tr>
            </tfoot>
        </table>
    </div>

    <script src="https://cdn.datatables.net/2.1.8/js/jquery.dataTables.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.datatables.net/2.1.8/js/dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/plug-ins/1.10.21/dataRender/datetime.js"></script>
    <%--ajax--%>
    <%-- <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script src="https://cdn.datatables.net/2.1.8/js/dataTables.js"></script>--%>
    <script>
        $(document).ready(function () {
            debugger

            new DataTable('#example', {
                ajax: 'data.json',
                scrollY: 350,
                ////dom: 'Bpilft',
                //buttons: [
                //    'copy', 'excel', 'pdf'
                //],
                // scrollX: 800,
                columnDefs:
                    [{
                        orderable: false,
                        targets: [0, 1]
                    }],
                ordering: true,
                //stateSave: true,
                // dom: 'bflrtip',
                layout: {
                    topStart: {
                        buttons: [
                            'copy', 'excel', 'pdf'
                        ]
                    }
                },
                //layout: {
                //    topStart: {
                //        buttons: [
                //            {
                //                extend: 'colvis',
                //                collectionLayout: 'fixed columns',
                //                popoverTitle: 'Column visibility control'
                //            }
                //        ]
                //    }
                //},

                initComplete: function () {
                    this.api()
                        .columns()
                        .every(function () {
                            let column = this;
                            let title = column.footer().textContent;

                            // Create input element
                            let input = document.createElement('input');
                            input.placeholder = title;
                            column.footer().replaceChildren(input);

                            // Event listener for user input
                            input.addEventListener('keyup', () => {
                                if (column.search() !== this.value) {
                                    column.search(input.value).draw();
                                }
                            });
                        });
                }
            });

        });

    </script>
</body>
</html>

