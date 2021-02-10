#include <R.h>
#include <Rinternals.h>
#include <stdlib.h> // for NULL
#include <Rmath.h>
#include <R_ext/Rdynload.h>

void F77_NAME(llc_f)(double *x, int n, double *l, double *a, double *ret);
extern void F77_NAME(llc_f2)(double *x, int *n, double *l, double *a, double *ret);

extern SEXP c_llc_f(SEXP x, SEXP l, SEXP a){
  const int n = LENGTH(x);
  SEXP ret;
  PROTECT(ret = allocVector(REALSXP, 1));
  F77_CALL(llc_f)(REAL(x), n, REAL(l), REAL(a), REAL(ret));
  UNPROTECT(1);
  return(ret);
}

static const R_CallMethodDef CallEntries[] = {
  {"c_llc_f",   (DL_FUNC) &c_llc_f,  3},
  {NULL,         NULL,               0}
};

static const R_FortranMethodDef FEntries[] = {
  {"llc_f2",   (DL_FUNC) &F77_NAME(llc_f2),  5},
  {NULL,         NULL,               0}
};

void R_init_SimpFort (DllInfo *dll) {
  R_registerRoutines(dll, NULL, CallEntries, FEntries, NULL);
  R_useDynamicSymbols(dll, FALSE);
}
