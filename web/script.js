// ============================================================================
// LISTENER DE MENSAGENS DO CLIENTE LUA
// ============================================================================
window.addEventListener('message', function (event) {
    const data = event.data;

    switch (data.action) {
        case "openExtras":
            openExtrasMenu(data.count, data.ui);
            break;
        case "openLivery":
            openLiveryMenu(data.count, data.ui);
            break;
        default:
            break;
    }
});

// ============================================================================
// FUNÇÕES PARA ABRIR MENUS
// ============================================================================

// Abre o menu de extras
function openExtrasMenu(count, uiTexts) {
    $(".safe-extras-cnt").fadeIn();

    // Atualizar textos da UI se fornecidos
    if (uiTexts) {
        $(".safe-extras-cnt .tlt .sub").text(uiTexts.Subtitle);
        $(".safe-extras-cnt .tlt .dstq").text(uiTexts.Title);
    }

    // Criar botões de extras dinamicamente
    for (let index = 0; index < count; index++) {
        $(".extras-cnt").append(`
            <div data-number="${index + 1}" class="single-extras" onclick="selectExtras(this)">
                ${index + 1}
            </div>
        `);
    }
    attHoverExtras();
}

// Abre o menu de plotagem
function openLiveryMenu(count, uiTexts) {
    $(".safe-livery-cnt").fadeIn();

    // Atualizar textos da UI se fornecidos
    if (uiTexts) {
        $(".safe-livery-cnt .tlt .sub").text(uiTexts.Subtitle);
        $(".safe-livery-cnt .tlt .dstq").text(uiTexts.Title);
    }

    // Criar botões de plotagem dinamicamente
    for (let index = 0; index < count; index++) {
        $(".livery-cnt").append(`
            <div data-number="${index + 1}" class="single-livery" onclick="selectLivery(this)">
                ${index + 1}
            </div>
        `);
    }
    attHoverLivery();
}

// ============================================================================
// CALLBACKS PARA SELEÇÃO
// ============================================================================

// Envia callback para selecionar extra
function selectExtras(element) {
    $.post("https://mri_extras/selectExtras", JSON.stringify({
        extras: $(element).data("number")
    }));
}

// Envia callback para selecionar plotagem
function selectLivery(element) {
    $.post("https://mri_extras/selectLivery", JSON.stringify({
        livery: $(element).data("number")
    }));
}

// ============================================================================
// FECHAR INTERFACE COM ESC
// ============================================================================
document.addEventListener('keydown', (event) => {
    if (event.code === "Escape") {
        closeInterface();
    }
}, false);

// Função para fechar a interface
function closeInterface() {
    $(".safe-extras-cnt").fadeOut();
    $(".extras-cnt").html("");

    $(".safe-livery-cnt").fadeOut();
    $(".livery-cnt").html("");

    $.post("https://mri_extras/close");
}

// ============================================================================
// EFEITOS DE HOVER
// ============================================================================

// Adiciona efeito hover aos botões de extras
function attHoverExtras() {
    $(".single-extras").hover(
        function () {
            if (!$(this).hasClass("selected-extras")) {
                setTimeout(() => {
                    $(this).text("SELECIONAR");
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

// Adiciona efeito hover aos botões de plotagem
function attHoverLivery() {
    $(".single-livery").hover(
        function () {
            if (!$(this).hasClass("selected-livery")) {
                setTimeout(() => {
                    $(this).text("SELECIONAR");
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