NAME = ocamlbuild_protoc
OCAMLBUILD = ocamlbuild -use-ocamlfind -package ocamlbuild
TARGETS = ocamlbuild_protoc.cma ocamlbuild_protoc.cmxa ocamlbuild_protoc.a
INSTALL_TARGETS = $(addprefix _build/lib/, $(TARGETS))
INSTALL_TARGETS += _build/lib/*.cmi
INSTALL_TARGETS += _build/lib/*.cmo
INSTALL_TARGETS += _build/lib/*.o
INSTALL_TARGETS += _build/lib/*.cmx

all:
	$(OCAMLBUILD) $(TARGETS)

install: all
	@ocamlfind install $(NAME) META $(INSTALL_TARGETS)

uninstall:
	@ocamlfind remove $(NAME)

reinstall:
	make uninstall
	make install

clean:
	$(OCAMLBUILD) -clean

.PHONY: build clean install uninstall all
