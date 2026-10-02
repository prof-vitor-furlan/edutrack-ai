// Add FAQ record
query faq verb=POST {
  api_group = "CRUD"

  input {
    dblink {
      table = "FAQ"
    }
  }

  stack {
    db.add FAQ {
      enforce_hidden_fields = false
      data = {created_at: "now"}
    } as $faq
  }

  response = $faq
  guid = "83zYSH4KtHQ9ocV88bxXlxvTYBo"
}