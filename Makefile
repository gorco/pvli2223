tema1=$(addprefix tema1/, evaluacion_proyectos.md introduccion.md logonode.svg tooling.md chrome.png vscode.png iterm.png firefox.png lenguajes_interpretados.md compilado.dot.svg compilar.dot.svg compilado-bytecode.dot.svg instrucciones.dot.svg netscape_logo.svg interpretes.dot.svg no_copy.svg mozilla.png npm.png browserify.png phaser.png showcase.md evil_glitch.png godswillbewatching.png lotg.png dicey-dungeons.png slither-agar.png tema-proyecto.md gris1.jpeg gris2.jpg consul.png logico.png protagonista.png virtuoso.png personalidad.png dimensiones.png)
tema2=$(addprefix tema2/, creacion_paginas_web.md colgar_proyecto.md request_dance_step1.png request_dance_step2.png dom_section.png dom.md search.png ejemplo.html ejemplo.js ejemplo.css navegador-fichero.png navegador-servidor.png htmlnoprog.png)
tema3=$(addprefix tema3/, javascript_modelo_ejecucion.md javascript_modelo_datos_1.md javascript_modelo_datos_2.md poo.md space-invaders-enemy-state.svg space-invaders-constructor-example.svg space-invaders-hierarchy.svg space-invaders-hierarchy-constructor.svg batman-storyboard.jpg lotr-notes.jpg mario-level-design.png monobehaviour-flowchart.png space-invaders.jpg space-invaders-objects.svg space-invaders-types.svg space-invaders-object-diagram.svg space-invaders-enemy-api.svg space-invaders-constructors.svg space-invaders-constructor-detail.svg ejercicios_js.md clases_es6.md modulos.md)
tema4=$(addprefix tema4/, mario_spritesheet.gif mariosprite.jpg mummy.gif introduccion_phaser.md groups_and_pooling.md input.md phaser_entities.md texto_en_phaser.md mostrar_rendering.png profiling.png pool.svg takepool.svg storepool.svg world.svg world-and-camera.svg guerrero.png phaser_coordinates.png bitmapfont.png)
tema5=$(addprefix tema5/, arcade.md custom-physics-aabb.png custom-physics-least-overlap.png matter.md)
tema6=$(addprefix tema6/, tiles.md tileset_zelda.png tilemap_zelda.png tiled.png tiled_nuevo_proyecto.png ortogonal_tiled.png export_tiled.png isometrica_tiled.png isometrica.png add_tileset.png nueva_capa.png exportar_tiled.png pixel.png blur.png slope.png slope_tileset.png iconopropiedades.png editarcolision.png slopecolision.png crear_capa_objetos.png)
tema7=$(addprefix tema7/, redes.md cliente.md server.md client.html server.js osi.svg clienteservidor.svg)
tema8=$(addprefix tema8/, agregacionuml.pu.svg mixin.pu.svg arquitectura.pu.svg asociacion.pu.svg atributos.pu.svg components.js composicion.pu.svg composicionuml.pu.svg ejemplo_componentes_completo.md ejercicios_arquitectura.md frutas.pu.svg herencia.pu.svg herenciacorrecta.pu.svg herenciafrutas.pu.svg herenciaproblema.pu.svg interface.pu.svg introduccion_uml.md introduccion_arquitectura_videojuegos.md metodos.pu.svg muchos.pu.svg sistemascomponentes.pu.svg umlbasico.pu.svg)
tema9=$(addprefix tema9/, webaudio.md audio_phaser.md nonsinusoidal_wavelength.jpg umbral.png nodos.dot.svg)
tema10=$(addprefix tema10/, frameciclo.jpg tux_fondo.png tux.png animacion_con_sprites.md eventos_timer.md tweens.md)
tema11=$(addprefix tema11/, pwa.md firefox_architecture.png extensiones.md proyectos.md abrir_consola_tiled.png consola_tiled.png js_tiled.png ver_service_workers.png lighthouse.png localstorage_chrome.png unregister_sw.png cambiar_opciones_device.png toggle_device_toolbar.png clear_site_data.png borrar_cache_sw.png recurso_almacenado_cache.png interfaces_avanzadas.md mlpggj2020.md pantalla_mlp.jpg subirimagen.png ggj_ucm.png ggj_dragon.png ggj_ggj.png ggj_guerrero.png ggj_magia.png ggj_mago.png ggj_palanca.png ggj_puerta.png juego.gif fantasma.gif extension_tiled.md piskel.png chiptone.png jsfxr.png revoltfx.png rpg.jpg ink.png il2cpp.png blueprint.png bolt.png ejemploFlip.png serpens.jpg Krita.png extension_unity.md waypoints.png colorizer.png createWaypoints.png)
otros=$(addprefix otros/, async.md canvas.md ejercicios_dom.md canvas_ex01.png canvas_ex02.png canvas_ex03.png exercise01.png exercise02.png exercise03_inspector_data_attr.png exercise03_inspector01.png exercise03_inspector02.png exercise03_querystring.png exercise03_selected_value.png exercise03_step02.png exercise03_strikethrough.png console.png buscar.png reportar.md entregar.md evaluacionproyectos.md grupos.md porcentajes.md github.md gh_crear_pr.jpg gh_pestanas_pr.jpg gh_validar_pr.jpg)



css=juegosweb.css 

docscss=docs.css

todascss=$(css) $(docscss)

srcs=$(tema1) $(tema2) $(tema3) $(tema4) $(tema5) $(tema6) $(tema7) $(tema8) $(tema9) $(tema10) $(tema11) $(css) $(todascss) $(otros)

reveal=reveal.js

docs_folder=docs

define makedir
	@mkdir -p $(dir $@)
endef

basepandoc=pandoc -s --filter pandoc-crossref -M secPrefix= -M figPrefix= -M eqnPrefix= -M tblPrefix= $< -o $@


define slide
	$(makedir)
	$(basepandoc) --css=../$(css) --variable progress=true --variable slideNumber=true --variable revealjs-url=../$(reveal) -Vtheme=beige -t revealjs -V history=true
endef

define doc
	$(makedir)
	$(basepandoc) --css=../$(docscss) -t html
endef


all: $(addprefix $(docs_folder)/, $(srcs:.md=.html)) $(docs_folder)/$(reveal)

$(docs_folder)/%.pu.svg: %.pu
	$(makedir)
	cat $< | plantuml -p -tsvg > $@

$(docs_folder)/%: %
	$(makedir)
	cp -f $< $@

$(docs_folder)/%.dot.svg: %.dot
	$(makedir)
	dot -T svg $< -o $@

$(docs_folder)/%.html: %.md
	$(slide)

$(docs_folder)/tema1/evaluacion_proyectos.html: tema1/evaluacion_proyectos.md
	$(doc)

$(docs_folder)/tema3/ejercicios_js.html: tema3/ejercicios_js.md
	$(doc)

$(docs_folder)/tema8/ejercicios_arquitectura.html: tema8/ejercicios_arquitectura.md
	$(doc)


$(docs_folder)/otros/ejercicios_dom.html: otros/ejercicios_dom.md
	$(doc)

$(docs_folder)/otros/reportar.html: otros/reportar.md
	$(doc)
	
$(docs_folder)/otros/entregar.html: otros/entregar.md
	$(doc)
	
$(docs_folder)/otros/evaluacionproyectos.html: otros/evaluacionproyectos.md
	$(doc)
	
$(docs_folder)/otros/grupos.html: otros/grupos.md
	$(doc)
	
$(docs_folder)/otros/porcentajes.html: otros/porcentajes.md
	$(doc)
	
$(docs_folder)/otros/github.html: otros/github.md
	$(doc)
	



$(docs_folder)/$(reveal): $(shell find reveal.js -type f) | $(docs_folder)
	cp -fr $(reveal) $(docs_folder)

$(docs_folder):
	mkdir -p $@

$(docs_folder)/tema7/server.js: tema7/server.md
	cat $< | codedown js > $@

$(docs_folder)/tema7/client.html: tema7/cliente.md
	cat $< | codedown html > $@


watch: all
	watchman-make -p $(srcs:.pu.svg=.pu) $(reveal)/**/* general/* Makefile --run make

clean:
	rm -fr $(docs_folder)

serve:
	cd $(docs_folder) && npx live-server

.PHONY: all watch clean serve start