# 🚗 mri_extras - Extras e Plotagem para Veículos

[![FiveM](https://img.shields.io/badge/FiveM-Ready-blue.svg)](https://fivem.net/)
[![Versão](https://img.shields.io/badge/Versão-2.0-green.svg)](https://github.com)
[![Standalone](https://img.shields.io/badge/Standalone-Sim-brightgreen.svg)](https://github.com)
[![Frameworks](https://img.shields.io/badge/Suporte-QBCore%20|%20ox__lib%20|%20vRP-orange.svg)](https://github.com)

> Script standalone otimizado para personalização de veículos (extras e liveries) com interface moderna e responsiva.

---

## 📋 Índice

- [Características](#-características)
- [Instalação](#-instalação)
- [Configuração](#-configuração)
- [Localização](#-localização)
- [Uso](#-uso)
- [Estrutura de Arquivos](#-estrutura-de-arquivos)
- [Suporte](#-suporte)

---

## ✨ Características

- ✅ **Standalone & Flexível** - Funciona sem dependências, mas suporta **QBCore**, **ox_lib** e **vRP**.
- ✅ **Interface Moderna** - Design Glassmorphism limpo, com animações suaves e atualização em tempo real.
- ✅ **Feedback Visual** - Indicadores (bordas verdes e ícones ✓) mostram exatamente o que está ativo.
- ✅ **Configuração Centralizada** - Tudo em `config.lua`.
- ✅ **Sistema de Locales** - Traduções fáceis via arquivos JSON (`en`, `pt-br`, etc.).
- ✅ **Notificações Adaptáveis** - Sistema inteligente que detecta seu framework (ox_lib, qbcore, etc.).
- ✅ **Seguro** - Validação para permitir apenas motoristas (configurável).

---

## 📥 Instalação

1. **Baixe o script** e coloque na pasta `resources` do seu servidor.

2. **Adicione ao `server.cfg`:**
   ```cfg
   ensure mri_extras
   ```

3. **Inicie o servidor** ou use `refresh` seguido de `start mri_extras`.

---

## ⚙️ Configuração

Edite o arquivo **`config.lua`**:

### 1. Comandos
```lua
Config.Commands = {
    Extras = "extras",        -- Comando /extras
    Plotagem = "plotagem"     -- Comando /plotagem
}
```

### 2. Notificações e Framework
Escolha o sistema de notificação compatível com seu servidor:

```lua
-- Opções: "qbcore", "oxlib", "vrp", "standalone", "custom"
Config.NotifyType = "oxlib"
```

### 3. Idioma
O script detecta o locale do ox_lib ou usa o padrão definido:
```lua
Config.Locale = GetConvar("ox:locale", "pt-br")
```

---

## 🌍 Localização

O sistema de tradução fica na pasta `locales/`.

- **pt-br.json** (Português Brasileiro)
- **en.json** (Inglês)

Para criar um novo idioma, basta copiar um arquivo existente, renomear (ex: `es.json`) e alterar `Config.Locale` para `es`.

---

## 🎮 Uso

### Comandos
| Comando | Descrição |
|---------|-----------|
| `/extras` | Menu de extras do veículo |
| `/plotagem` | Menu de liveries (pinturas) |

### Funcionamento
1. Entre num veículo.
2. Use o comando.
3. Clique nos botões para ativar/desativar.
   - **Verde com ✓**: Ativo
   - **Cinza**: Inativo
4. Pressione **ESC** para fechar.

---

## 📁 Estrutura de Arquivos

```
mri_extras/
├── web/                   # Interface NUI (HTML/CSS/JS)
├── locales/               # Arquivos de tradução (JSON)
├── client.lua             # Lógica cliente
├── config.lua             # Configuração geral
└── fxmanifest.lua         # Manifesto
```

---

## 🛠️ Suporte

- **Comunidade:** [MRI QBOX](https://discord.gg/uEfGD4mmVh)
- **Autor:** Murai Dev
- **Discord:** `.mur4i`
- **Versão:** 2.0

---

## 📝 Changelog

### v2.0 (Refatoração Completa)
- ✨ **Interface**: Novo design moderno, indicadores visuais ativos, feedback em tempo real.
- ✨ **Locales**: Sistema de tradução JSON implementado.
- ✨ **Notificações**: Suporte nativo para QBCore, ox_lib e vRP.
- ✨ **Código**: Refatoração completa, otimização e limpeza de debugs.
- ✨ **Estrutura**: Organização em pastas `web` e `locales`.

---

**Personalize seus veículos com estilo! 🚗💨**
