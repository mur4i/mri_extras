# 🚗 mri_extras - Extras e Plotagem para Veículos

[![FiveM](https://img.shields.io/badge/FiveM-Ready-blue.svg)](https://fivem.net/)
[![Versão](https://img.shields.io/badge/Versão-2.0-green.svg)](https://github.com)
[![Standalone](https://img.shields.io/badge/Standalone-Sim-brightgreen.svg)](https://github.com)

> Script standalone para FiveM que oferece funcionalidades de personalização para veículos através de extras e plotagens (liveries).

---

## 📋 Índice

- [Características](#-características)
- [Instalação](#-instalação)
- [Configuração](#-configuração)
- [Uso](#-uso)
- [Estrutura de Arquivos](#-estrutura-de-arquivos)
- [Personalização](#-personalização)
- [Suporte](#-suporte)

---

## ✨ Características

- ✅ **100% Standalone** - Não requer frameworks específicos
- ✅ **Configurável** - Arquivo `config.lua` centralizado
- ✅ **Interface Intuitiva** - Menu moderno e responsivo
- ✅ **Extras de Veículos** - Ative/desative acessórios do veículo
- ✅ **Plotagens** - Aplique liveries aos veículos
- ✅ **Notificações Visuais** - Feedback em tempo real
- ✅ **Validação de Motorista** - Apenas o motorista pode personalizar
- ✅ **Textos Personalizáveis** - Traduza facilmente para qualquer idioma

---

## 📥 Instalação

1. **Baixe o script** e extraia na pasta `resources` do seu servidor

2. **Adicione ao `server.cfg`:**
   ```cfg
   ensure mri_extras
   ```

3. **Reinicie o servidor** ou use o comando:
   ```
   refresh
   start mri_extras
   ```

---

## ⚙️ Configuração

Todas as configurações estão no arquivo **`config.lua`**:

### Comandos
```lua
Config.Commands = {
    Extras = "extras",        -- Comando para abrir menu de extras
    Plotagem = "plotagem"     -- Comando para abrir menu de plotagem
}
```

### Textos da Interface
```lua
Config.UI = {
    Extras = {
        Title = "EXTRAS",
        Subtitle = "SELECIONAR",
        SelectText = "SELECIONAR"
    },
    Plotagem = {
        Title = "PLOTAGEM",
        Subtitle = "SELECIONA UMA",
        SelectText = "SELECIONAR"
    }
}
```

### Notificações
```lua
Config.Notifications = {
    Extras = {
        Enabled = {
            Type = "verde",
            Message = "[ATIVADO] Extra %s"
        },
        Disabled = {
            Type = "vermelho",
            Message = "[DESATIVADO] Extra %s"
        }
    },
    Plotagem = {
        Applied = {
            Type = "verde",
            Message = "[APLICADO] Plotagem %s"
        }
    }
}
```

### Configurações Gerais
```lua
Config.OnlyDriver = true              -- Apenas motorista pode usar
Config.NotificationDuration = 5000    -- Duração das notificações (ms)
```

---

## 🎮 Uso

### Comandos In-Game

| Comando | Descrição |
|---------|-----------|
| `/extras` | Abre o menu de seleção de extras |
| `/plotagem` | Abre o menu de seleção de plotagens |

### Controles

- **Clique** - Seleciona um extra ou plotagem  
- **ESC** - Fecha o menu

### Como Funciona

1. **Entre em um veículo** como motorista
2. **Digite o comando** `/extras` ou `/plotagem`
3. **Selecione** o extra ou plotagem desejada
4. **Aproveite** sua personalização!

### Uso via Eventos

Você pode integrar este script com outros recursos:

```lua
-- Abrir menu de extras
TriggerEvent("mri:extras")

-- Abrir menu de plotagem
TriggerEvent("mri:plotagem")
```

---

## 📁 Estrutura de Arquivos

```
mri_extras/
├── web/                    # Interface NUI
│   ├── index.html         # Estrutura HTML
│   ├── script.js          # Lógica JavaScript
│   └── style.css          # Estilos CSS
├── client.lua             # Script client-side
├── config.lua             # Configurações
├── fxmanifest.lua         # Manifest do recurso
└── README.md              # Documentação
```

---

## 🎨 Personalização

### Alterar Cores do Tema

Edite o arquivo **`web/style.css`**:

```css
/* Extras - Tema Vermelho */
.safe-extras-cnt .tlt {
    background: rgb(100, 0, 0);  /* Vermelho escuro */
}

/* Plotagem - Tema Azul */
.safe-livery-cnt .tlt {
    background: rgb(0, 27, 100);  /* Azul escuro */
}
```

### Tradução

Para traduzir o script, edite **`config.lua`**:

```lua
-- Exemplo em Inglês
Config.UI = {
    Extras = {
        Title = "EXTRAS",
        Subtitle = "SELECT",
        SelectText = "SELECT"
    },
    Plotagem = {
        Title = "LIVERY",
        Subtitle = "SELECT ONE",
        SelectText = "SELECT"
    }
}
```

### Integração com Sistema de Notificações

O script usa `TriggerEvent("Notify", tipo, mensagem, duração)`.  
Se seu servidor usa outro sistema, edite **`client.lua`**:

```lua
-- Exemplo com ESX
ESX.ShowNotification(notification.Message)

-- Exemplo com QBCore
QBCore.Functions.Notify(notification.Message, notification.Type)
```

---

## 🛠️ Suporte

- **Comunidade:** [FiveMDEV](https://fivemdev.org/)
- **Autor:** Murai Dev
- **Discord:** `.mur4i`
- **Versão:** 2.0

---

## ⚠️ Aviso Importante

> **Não baixe versões vazadas!** Elas podem conter vírus e comprometer sua VPS ou PC.  
> **Suporte 100% gratuito** e qualidade garantida apenas na comunidade oficial FiveMDEV.

---

## 📝 Changelog

### v2.0 (Atual)
- ✨ Adicionado sistema de configuração centralizado (`config.lua`)
- ✨ Reorganizada estrutura de pastas (`nui/` → `web/`)
- ✨ Script agora é 100% standalone
- ✨ Textos da interface agora são dinâmicos e configuráveis
- ✨ Melhorias na organização e legibilidade do código
- ✨ Adicionada validação de motorista
- ✨ Documentação completa em README.md

### v1.0
- 🎉 Lançamento inicial
- ✅ Sistema de extras funcionais
- ✅ Sistema de plotagens funcionais
- ✅ Interface NUI básica

---

## 📄 Licença

Este script é fornecido gratuitamente para a comunidade FiveM.  
Criado com ❤️ por **Murai Dev**

---

**Aproveite e personalize seus veículos! 🚗💨**
