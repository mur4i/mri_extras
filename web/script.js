window.addEventListener('message', function (event) {
    const data = event.data;

    switch (data.action) {
        case "openExtras":
            openExtrasMenu(data.count, data.ui, data.activeExtras);
            break;
        case "openLivery":
            openLiveryMenu(data.count, data.ui, data.activeLivery);
            break;
        default:
            break;
    }
});

function openExtrasMenu(count, uiTexts, activeExtras) {
    $(".safe-extras-cnt").fadeIn();

    if (uiTexts) {
        $(".safe-extras-cnt .tlt .sub").text(uiTexts.Subtitle);
        $(".safe-extras-cnt .tlt .dstq").text(uiTexts.Title);
    }

    for (let index = 0; index < count; index++) {
        const extraNumber = index + 1;
        const isActive = activeExtras && activeExtras[index];
        const activeClass = isActive ? ' active' : '';

        $(".extras-cnt").append(`
            <div data-number="${extraNumber}" class="single-extras${activeClass}" onclick="selectExtras(this)">
                ${extraNumber}
            </div>
        `);
    }
    attHoverExtras(uiTexts.Select);
}

function openLiveryMenu(count, uiTexts, activeLivery) {
    $(".safe-livery-cnt").fadeIn();

    if (uiTexts) {
        $(".safe-livery-cnt .tlt .sub").text(uiTexts.Subtitle);
        $(".safe-livery-cnt .tlt .dstq").text(uiTexts.Title);
    }

    for (let index = 0; index < count; index++) {
        const liveryNumber = index + 1;
        const isActive = (activeLivery !== null && activeLivery !== undefined) && (activeLivery === index);
        const activeClass = isActive ? ' active' : '';

        $(".livery-cnt").append(`
            <div data-number="${liveryNumber}" class="single-livery${activeClass}" onclick="selectLivery(this)">
                ${liveryNumber}
            </div>
        `);
    }
    attHoverLivery(uiTexts.Select);
}

function selectExtras(element) {
    const $element = $(element);

    $element.toggleClass('active');

    $.post("https://mri_extras/selectExtras", JSON.stringify({
        extras: $element.data("number")
    }));
}

function selectLivery(element) {
    const $element = $(element);

    $('.single-livery').removeClass('active');
    $element.addClass('active');

    $.post("https://mri_extras/selectLivery", JSON.stringify({
        livery: $element.data("number")
    }));
}

document.addEventListener('keydown', (event) => {
    if (event.code === "Escape") {
        closeInterface();
    }
}, false);

function closeInterface() {
    $(".safe-extras-cnt").fadeOut(300, function () {
        $(".extras-cnt").html("");
    });

    $(".safe-livery-cnt").fadeOut(300, function () {
        $(".livery-cnt").html("");
    });

    $.post("https://mri_extras/close");
}

function attHoverExtras(selectText) {
    $(".single-extras").hover(
        function () {
            if (!$(this).hasClass("selected-extras")) {
                setTimeout(() => {
                    $(this).text(selectText);
                }, 300);
                $(this).addClass("selected-extras");
            }
        },
        function () {
            setTimeout(() => {
                $(this).text($(this).data("number"));
            }, 300);
            $(this).removeClass("selected-extras");
        }
    );
}

function attHoverLivery(selectText) {
    $(".single-livery").hover(
        function () {
            if (!$(this).hasClass("selected-livery")) {
                setTimeout(() => {
                    $(this).text(selectText);
                }, 300);
                $(this).addClass("selected-livery");
            }
        },
        function () {
            setTimeout(() => {
                $(this).text($(this).data("number"));
            }, 300);
            $(this).removeClass("selected-livery");
        }
    );
}