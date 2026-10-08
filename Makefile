# Detecta se o sistema é Windows
ifeq ($(OS),Windows_NT)
    CMAKE_GEN := -G "MinGW Makefiles"
    EXEC := sokol_collision.exe
    RUN_CMD := .\build\$(EXEC)
    PYTHON := python
    KILL_PORT :=
else
    CMAKE_GEN :=
    EXEC := sokol_collision
    RUN_CMD := ./build/$(EXEC)
    PYTHON := python3
    KILL_PORT := lsof -ti:8080 | xargs kill -9 2>/dev/null || true
endif

.PHONY: build clean rebuild run web

# Compila para o sistema atual
build:
	cmake -B build $(CMAKE_GEN)
	cmake --build build

# Apaga as pastas de build zerando os caches do outro SO
clean:
	cmake -E rm -rf build build-web

# Limpa obrigatoriamente e compila
rebuild: clean build

# Garante a limpeza do cache se tiver trocado de SO antes de rodar
run:
	@if [ -f build/CMakeCache.txt ]; then \
		grep -q "arthurmazzardo" build/CMakeCache.txt && cmake -E rm -rf build || true; \
	fi
	cmake -B build $(CMAKE_GEN)
	cmake --build build
	$(RUN_CMD)

# Garante a limpeza do cache se tiver trocado de SO antes da web
web:
	@if [ -f build-web/CMakeCache.txt ]; then \
		grep -q "arthurmazzardo" build-web/CMakeCache.txt && cmake -E rm -rf build-web || true; \
	fi
	emcmake cmake -B build-web $(CMAKE_GEN)
	cmake --build build-web
	@echo "Servidor rodando em http://localhost:8080/sokol_collision.html"
	@$(KILL_PORT)
	$(PYTHON) -m http.server 8080 -d build-web