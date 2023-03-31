BindGrid();

function BindGrid() {
    $(document).ready(function () {
        console.log("Hello");
       
        $("#tbl").DataTable({
            "responsive": true,
            "processing": true,
            "ajax": {
                
                "url": "GetPostList",
                "data": { id: $("#hdUserId").val() },
                "type": "GET",
                "datatype": "json"
            },
            "columns": [
                {
                    "render": function (data, type, full, meta) {
                        return meta.row + meta.settings._iDisplayStart + 1;
                    }
                },
                { "data": "title", "name": "Title", "width": "10%" },
                { "data": "description", "name": "Description", "width": "20%" },
                {
                    "render": function (data, type, full, meta) {

                        var str = "";

                        if (full.isPublished) {
                            str = "<span class='badge rounded-pill bg-primary'>Published</span>";
                        } else {
                            str = "<span class='badge rounded-pill bg-danger'>Unpublished</span>";
                        }

                        return str;
                    }
                },
                { "data": "createdDate", "name": "CreatedDate", "autoWidth": true },
                { "data": "createdUserName", "name": "CreatedUserName", "autoWidth": true },
                {
                    render: function (data, type, full) {

                        var tblData = JSON.stringify(full);
                        var actions = "<div class='btn-group'>";
                        actions += "<button type='button' class='btn btn-dark btn-sm dropdown-toggle' data-bs-toggle='dropdown' aria-expanded='false'>Action</button>";
                        actions += "<ul class='dropdown-menu'>";
                        actions += " <li><a class='dropdown-item text-success' onclick=View('" + full.id + "')>View</a></li>";
                        actions += " <li><a class='dropdown-item' onclick=Edit('" + full.id + "')>Edit</a></li>";
                        actions += " <li><a class='dropdown-item text-danger' onclick=Delete('" + full.id + "')> Delete</a></li>";
                        actions += "</ul>";
                        actions += "</div>";

                        return actions;
                    }
                }
            ]
        });
    });
}


function View(id) {
    var url = "GetPostDetail";
    $.get(url, { id: id }, function (data) {
        $("#modalTitle").val(data.title);
        $("#modalDescription").val(data.description);
        if (data.isPublished) {
            $("#divStatus").html("<span class='badge rounded-pill bg-danger'>Published</span>");
        } else {
            $("#divStatus").html("<span class='badge rounded-pill bg-primary'>Unpublished</span>");
        }
        $("#modalCreatedDate").val(data.createdDate);
        $("#modalCreatedBy").val(data.createdUserName);
    });

    $("#viewModal").modal('show');
}


function Edit(id) {
    window.location = "Edit/" + id;
}

function Delete(id) {
   /* event.preventDefault();*/
    swal({
        title: "Are you sure? You want to delete...",
        icon: "warning",
        buttons: ["Cancel", "Yes, delete it!"],
        dangerMode: true,
    })
        .then((willDelete) => {
            if (willDelete) {
                var url = "Delete"
                $.post(url, { id: id }, function (data) {
                    if (data) {
                        oTable = $('#tbl').DataTable();
                        oTable.draw();
                        $('#tbl').DataTable().ajax.reload();
                    } else {
                        alert("Sorry, Something Went Wrong!!!");
                    }
                })
            }
            oTable.draw();
            $('#tbl').DataTable().ajax.reload();
        })
    
}
