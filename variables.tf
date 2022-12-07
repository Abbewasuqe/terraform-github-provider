variable "reposs" {
    default = {
        susu ={
          name = "susu"
          description = "kakaka"
          default_branch = "denilson"
          branches = [
            "denilson",
            "rivaldo"
          ]
          branch_protection = {
            denilson = {
              enforce_admins          = false
              required_status_enabled = true
              required_linear_history = false
       }
            rivaldo = {
              enforce_admins          = true
              required_status_enabled = true
              required_linear_history = true
       }
     }
    }
    }
}


        # scolari ={
        #   name = "scolari"
        #   description = "scolari"  
        #   }

