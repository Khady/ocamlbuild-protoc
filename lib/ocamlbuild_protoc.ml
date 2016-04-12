open Ocamlbuild_plugin

let () = Options.use_ocamlfind := true

let protoc = "ocaml-protoc"

let tag_protoc env patterns =
  patterns |> List.iter begin fun p ->
    ["package(ocaml-protoc)"]
    |> Tags.of_list
    |> Tags.elements
    |> tag_file (env p)
  end

let init () =
  rule "protoc: .proto -> _pb.ml*"
    ~prods:["%_pb.ml";"%_pb.mli"]
    ~dep:"%.proto"
    (begin fun env build ->
       let proto_file = env "%.proto" in
       let out_directory = Filename.dirname proto_file in
       tag_protoc env ["%_pb.ml";"%_pb.mli"];
       Cmd (S [A protoc; A "-ml_out"; P out_directory; P proto_file]);
     end)

let dispatcher = function
  | After_rules -> init ()
  | _ -> ()
