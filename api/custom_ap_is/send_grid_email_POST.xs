query SendGrid_Email verb=POST {
  api_group = "CustomAPIs"

  input {
    email email? filters=trim|lower
  }

  stack {
    db.get user {
      field_name = "email"
      field_value = $input.email
    } as $user1
  
    security.random_number {
      min = 100000
      max = 999999
    } as $codigo_otp
  
    var $validade {
      value = now|add_secs_to_timestamp:300
    }
  
    db.edit user {
      field_name = "id"
      field_value = `$var.user1.id`
      enforce_hidden_fields = false
      data = {codigo: $codigo_otp, validade: $validade}
    } as $user2
  
    function.run sendgrid_basic_send {
      input = {
        to_email: $input.email
        subject : "Validação"
        body    : $codigo_otp
      }
    } as $func1
  }

  response = $user2
  guid = "8l1PTK7SmkLWkMWkIzSdbeUdTQI"
}