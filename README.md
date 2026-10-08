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
