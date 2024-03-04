window.addEventListener('message', function(event) {
    switch (event.data.action) {
        case "openExtras":
            $(".safe-extras-cnt").fadeIn()
            for (let index = 0; index < event.data.count; index++) {
                $(".extras-cnt").append(`
                <div data-number="${index+1}" class="single-extras" onclick="selectExtras(this)">
                    ${index+1}
			    </div>
                `);
            }
            attHoverExtras()
            break;
        case "openLivery":
            $(".safe-livery-cnt").fadeIn()
            for (let index = 0; index < event.data.count; index++) {
                $(".livery-cnt").append(`
                <div data-number="${index+1}" class="single-livery" onclick="selectLivery(this)">
                    ${index+1}
                </div>
                `);
            }
            attHoverLivery()
            break;    
        default:
            break;
    }
});

function selectExtras(element) {
    $.post("https://mri_extras/selectExtras", JSON.stringify({ extras: $(element).data("number") }));
}

function selectLivery(element) {
    $.post("https://mri_extras/selectLivery", JSON.stringify({ livery: $(element).data("number") }));
}

document.addEventListener('keydown', (event) => {
    switch (event.code) {
        case "Escape":
            $(".safe-extras-cnt").fadeOut()
            $(".extras-cnt").html("")

            $(".safe-livery-cnt").fadeOut()
            $(".livery-cnt").html("")

            $.post("https://mri_extras/close")
            break;
    }
}, false);

function attHoverExtras() {
    $(".single-extras").hover(function() {
        if (!$(this).hasClass("selected-extras")) {
            setTimeout(() => {
                $(this).text("SELECIONAR")
            }, 300);
            $(this).addClass("selected-extras");
        }
    }, function() {
        setTimeout(() => {
            $(this).text($(this).data("number"))
        }, 300);
        $(this).removeClass("selected-extras");

    });
}

function attHoverLivery() {
    $(".single-livery").hover(function() {
        if (!$(this).hasClass("selected-livery")) {
            setTimeout(() => {
                $(this).text("SELECIONAR")
            }, 300);
            $(this).addClass("selected-livery");
        }
    }, function() {
        setTimeout(() => {
            $(this).text($(this).data("number"))
        }, 300);
        $(this).removeClass("selected-livery");

    });
}