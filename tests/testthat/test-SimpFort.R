test_that("Calulation is accurate", {
  expect_equal(LLC_f(1e6, 3e5, 5e5), 3e5)
  expect_equal(LLC_f(c(1e6, 6e5), 3e5, 5e5), 4e5)
  expect_equal(LLC_f(1e6, 3e5, 8e5), 2e5)
  expect_equal(LLC_f(1e6, 3e5, 10e5), 0)
})

test_that("Limit and Attachment is singular", {
  expect_error(LLC_f(c(1e6, 1e5), c(3e5, 2e5), 5e5))
  expect_error(LLC_f(c(1e6, 1e5), 3e5, c(5e5, 6e5)))
  expect_error(LLC_f(c(1e6, 1e5), c(3e5, 2e5), c(5e5, 6e5)))
})

test_that(".Fortran And .Call are equal", {
  expect_equal(LLC_f(1e6, 3e5, 5e5), LLC_f2(1e6, 3e5, 5e5))
  expect_equal(LLC_f(c(1e6, 6e5), 3e5, 5e5), LLC_f2(c(1e6, 6e5), 3e5, 5e5))
  expect_equal(LLC_f(1e6, 3e5, 8e5), LLC_f2(1e6, 3e5, 8e5))
  expect_equal(LLC_f(1e6, 3e5, 10e5), LLC_f2(1e6, 3e5, 10e5))
})
