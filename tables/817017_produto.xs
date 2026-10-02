table PRODUTO {
  auth = false

  schema {
    int id
    timestamp created_at?=now {
      visibility = "private"
    }
  
    text nome? filters=trim
    text descricao? filters=trim
    int qtd_disp?
    decimal Preco?
    text url_imagem? filters=trim
    decimal preco?
    bool precisa_produzir?
    enum tipo? {
      values = ["Entrada", "Prato principal", "Sobremesa", "Bebida"]
    }
  
    image? imagem?
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "gin", field: [{name: "xdo", op: "jsonb_path_op"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
    {type: "btree|unique", field: [{name: "nome", op: "asc"}]}
  ]
}