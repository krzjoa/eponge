test_that("Erase by name", {
  alpha.value <- 1
  alpha_function <-function(x) x + 2
  alpha.data.frame <- data.frame(a = 1:5, b = 6:10)
  beta.value <- 7
  beta_function <- function(x) x**2
  beta.data.frame <- data.frame(a = 6:10, b = 1:5)
  envir <- environment()
  erase(pattern = "alpha", envir = envir)
  expect_true(all(ls(envir = envir) %in%
               c("beta.value", "beta_function", "beta.data.frame", "envir")))
})


test_that("Erase functions", {
  alpha.value <- 1
  alpha_function <-function(x) x + 2
  alpha.data.frame <- data.frame(a = 1:5, b = 6:10)
  beta.value <- 7
  beta_function <- function(x) x**2
  beta.data.frame <- data.frame(a = 6:10, b = 1:5)
  envir <- environment()
  erase_functions(envir = envir)
  expect_true(all(ls(envir = envir) %in%
                    c("alpha.value", "alpha.data.frame", "beta.value",
                      "beta.data.frame", "envir")))
})
