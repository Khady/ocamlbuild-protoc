# Ocamlbuild plugin for ocaml-protoc

This plugins automatically generates `_pb.ml*` files from a `.proto` using
[ocaml-protoc](https://github.com/mransan/ocaml-protoc).

## Usage

Add this plugin dispatcher to ocamlbuild dispatch in `myocamlbuild.ml`:

```ocaml
let () = Ocamlbuild_plugin.dispatch Ocamlbuild_protoc.dispatcher
```

Tell ocamlbuild to use the plugin during its invokation:

```
$ ocamlbuild -use-ocamlfind -plugin-tag "package(ocamlbuild_protoc)" target.native
```

A small example is available in `example/`.

-------------------------------------------------------------------------------

The structure of this repository is a copy of @rgrinberg
[ocamlbuild-atdgen](https://github.com/rgrinberg/ocamlbuild-atdgen)
