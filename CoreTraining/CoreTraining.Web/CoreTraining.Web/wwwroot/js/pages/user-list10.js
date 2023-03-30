BindGrid();

function BindGrid() {
    $(document).ready(function () {
        $("#tbl").DataTable({
            "processing": true,
            "ajax": {
                "url": "GetUserList",
                "type": "POST",
                "datatype": "json"
            },
            
            "columns": [
                {
                    "render": function (data, type, full, meta) {
                        return meta.row + meta.settings._iDisplayStart + 1;
                    }
                },
                { "data": "fullName", "name": "FullName", "width": "20%" },
                { "data": "email", "name": "Description", "width": "20%" },
                {
                    "render": function (data, type, full, meta) {

                        var str = "";

                        if (full.role == "1") {
                            str = "<span class='badge rounded-pill bg-primary'>Admin</span>";
                        } else {
                            str = "<span class='badge rounded-pill bg-danger'>User</span>";
                        }

                        return str;
                    }
                },
                { "data": "createdDate", "name": "CreatedDate", "autoWidth": true },
                { "data": "createdUserName", "name": "CreatedUserName", "autoWidth": true },
                {
                    render: function (data, type, full) {

                        var actions = "<div class='btn-group'>";
                        actions += "<button type='button' class='btn btn-dark btn-sm dropdown-toggle' data-bs-toggle='dropdown' aria-expanded='false'>Action</button>";
                        actions += "<ul class='dropdown-menu'>";
                        actions += "<li><a class='dropdown-item text-success' onclick=View('" + full.id + "')>View</a></li>";
                        actions += "<li><a class='dropdown-item' onclick=Edit('" + full.id + "')>Edit</a></li>";
                        actions += "<li><a class='dropdown-item text-danger' onclick=Delete('" + full.id + "')> Delete</a></li>";
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

    var url = "GetUserDetail";
    $.get(url, { id: id }, function (data) {
        console.log("Hello");
        var img = document.getElementById("modalProfileImage");
        console.log(data.profileName);
        console.log(data.fullName);
        img.src = "/images/profile/" + data.profileName;
        
      
        $("#modalFullName").val(data.fullName);
        $("#modalEmail").val(data.email);
        $("#modalPhone").val(data.phoneNumber);
        $("#modalDOB").val(data.dob);
        $("#modalAddress").val(data.address);
        if (data.role == 1) {
            $("#divRole").html("<span class='badge rounded-pill bg-primary'>Admin</span>");
        } else {
            $("#divRole").html("<span class='badge rounded-pill bg-danger'>User</span>");
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
    console.log("Hello");
    event.preventDefault();
    swal({
        title: "Are you sure? You want to delete",
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
                        alert("Something Went Wrong!");
                    }
                })
            }
            oTable.draw();
            $('#tbl').DataTable().ajax.reload();
        })
}
