# 🎮 Teste Sokol

Um projeto desenvolvido em **C** utilizando a biblioteca *single-header* [Sokol](https://github.com/floooh/sokol) para gráficos, áudio e controlo de janelas de forma leve e multiplataforma.

O objetivo deste repositório é demonstrar a estrutura base, o ciclo do jogo e o tratamento de colisões num ambiente otimizado e focado em alto desempenho.

---

## 📁 Estrutura do Projeto

* `src/`: Código-fonte do jogo.
  * `main.c`: Ponto de entrada da aplicação e ciclo principal.
  * `game.c` / `game.h`: Lógica do jogo e gestão de estados.
  * `collision.c` / `collision.h`: Sistema e deteção de colisões.
  * `sokol_impl.c`: Implementação das bibliotecas Sokol (necessário devido à sua arquitetura *single-header*).
* `scripts/`: Scripts utilitários de configuração e compilação multiplataforma.
* `CMakeLists.txt` e `Makefile`: Opções de configuração para o processo de *build*.

---

## 🛠️ Pré-requisitos e Dependências

A biblioteca Sokol lida diretamente com as APIs nativas do sistema operativo (Metal, D3D11, OpenGL, etc.), o que significa que necessita das ferramentas de desenvolvimento nativas da sua plataforma.

### 🐧 Linux
No Linux, o projeto requer o compilador, CMake/Make e as bibliotecas de desenvolvimento de janelas (X11), suporte gráfico (OpenGL) e áudio (ALSA).
Em distribuições baseadas em **Ubuntu/Debian**, instale as dependências executando:
```bash 
sudo apt update
sudo apt install build-essential cmake make libx11-dev libxcursor-dev libxi-dev libgl1-mesa-dev libasound2-dev

🍎 macOS

No macOS, as bibliotecas necessárias (Metal, Cocoa, AudioToolbox) já fazem parte do sistema. Necessita apenas das ferramentas de compilação da Apple e do CMake (opcional):
Bash

# Instalar ferramentas de linha de comandos da Apple
xcode-select --install

# Opcional: Instalar CMake via Homebrew
brew install cmake

🪟 Windows

No Windows, o ambiente de eleição é o MSVC (Microsoft Visual C++):

    Instale o Visual Studio (Community ou superior).

    Durante a instalação, certifique-se de que seleciona a carga de trabalho "Desenvolvimento para Desktop com C++". Isso instalará o compilador, SDK do Windows e o CMake.

🚀 Preparação Inicial

Antes de compilar o projeto pela primeira vez, deve configurar o ambiente e descarregar as dependências (headers da Sokol). Execute o script incluído:

Linux / macOS:
Bash

chmod +x scripts/*.sh
./scripts/setup-sokol.sh

Windows:
PowerShell

.\scripts\setup-sokol.sh

(Nota: dependendo do seu ambiente Windows, poderá ser necessário correr este script no Git Bash, WSL, ou converter a lógica para um ficheiro .bat / .ps1 se o seu terminal não suportar .sh).
🔨 Como Compilar e Executar

Este repositório oferece três métodos distintos para efetuar a compilação. Escolha o que melhor se adaptar ao seu fluxo de trabalho.
Método 1: Utilizando os Scripts de Compilação Rápida (Recomendado)

A forma mais rápida de compilar é utilizando os scripts específicos para cada plataforma presentes na pasta scripts/:

    Linux:
    Bash

    ./scripts/build-linux.sh

    macOS:
    Bash

    ./scripts/build-macos.sh

    Windows (no Git Bash / MSYS2 / WSL):
    Bash

    ./scripts/build-windows.sh

Método 2: Utilizando CMake

O CMakeLists.txt incluído permite gerar ficheiros de projeto para qualquer IDE ou sistema (Ninja, Make, Visual Studio, Xcode, etc.).
Bash

mkdir build
cd build
cmake ..
cmake --build .

Método 3: Utilizando Makefile (Apenas Linux/macOS)

Se preferir a compilação tradicional via make, basta executar na raiz do projeto:
Bash

make
