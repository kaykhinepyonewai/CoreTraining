$(document).ready(function () {
  
    $.get(url1, { id: $("#hdUserId").val() }, function (data) {
        console.log(data);
        $("#userId").val(data.id);
    if (data.role == 1) {
        $("#liUser").show();

        $("#FirstName").text(data.firstName);
        $("#EmailName").text(data.email);
        var img = document.getElementById("ProfileName");
        console.log(data.profileName);
        img.src = "/images/profile/" + data.profileName;
    }
    else {

        $("#EmailName").text(data.email);
        var img = document.getElementById("ProfileName");
        img.src = "/images/profile/" + data.profileName;
    }
}
);
    $('#viewProfile').click(function (event) {
        event.preventDefault();
        var userId = $('#hdUserId').val();
        var actionUrl = $(this).attr('href') + '/' + userId;
        window.location.href = actionUrl;
    });


    $('#viewChangePass').click(function (event) {
        event.preventDefault();
        var userId = $('#hdUserId').val();
        var actionUrl = $(this).attr('href') + '/' + userId;
        window.location.href = actionUrl;
    });

    $('#import').click(function (event) {
        event.preventDefault();
        var userId = $('#hdUserId').val();
        console.log(userId);
        var actionUrl = $(this).attr('href') + '/' + userId;
        window.location.href = actionUrl;
    });

    $('#export').click(function (event) {
        event.preventDefault();
        var userId = $('#hdUserId').val();
        console.log(userId);
        var actionUrl = $(this).attr('href') + '/' + userId;
        window.location.href = actionUrl;
    });
});

$('[id*=batchPosts]').on('click', function () {
    $('[id*=hideValidate]').html('');
    $('[id*=hideValidate]').hide();
});

$('[id*=inputValidate]').on('focus', function () {
    console.log("Hello");
    $('[id*=hideValidate]').html('');
    $('[id*=hideValidate]').hide();
});


