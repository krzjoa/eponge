default_env <- function(env){
  if (missing(env))
    return(getOption("sponge.default.env")
   else 
     options(sponge.default.env = env)
}
