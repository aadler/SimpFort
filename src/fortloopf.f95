module fortloop
    use, intrinsic :: iso_c_binding

    implicit none
    private
    public :: llc_f

contains

    subroutine llc_f(x, n, l, a, llc) bind(C, name = "llc_f_")

        real(kind = c_double), intent(in)               :: l, a !limit & attach
        integer(kind = c_int), intent(in), value        :: n    !Length of x
        real(kind = c_double), intent(in), dimension(n) :: x    !Vector of loss
        real(kind = c_double), intent(out)              :: llc  !Output variable
        integer                                         :: i    !Internal count

        llc = 0.0_c_double
        do i = 1, n
            llc = llc + max(0.0_c_double, min(x(i) - a, l))
        end do

    end subroutine llc_f

        subroutine llc_f2(x, n, l, a, llc) bind(C, name = "llc_f2_")

        real(kind = c_double), intent(in)               :: l, a !limit & attach
        integer(kind = c_int), intent(in)               :: n    !Length of x
        real(kind = c_double), intent(in), dimension(n) :: x    !Vector of loss
        real(kind = c_double), intent(out)              :: llc  !Output variable
        integer                                         :: i    !Internal count

        llc = 0.0_c_double
        do i = 1, n
            llc = llc + max(0.0_c_double, min(x(i) - a, l))
        end do

    end subroutine llc_f2

end module fortloop
