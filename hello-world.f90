! Simple program that takes a real as an input and outputs the result of an equation
program hello
  integer :: num_args
  character(len=32) :: arg
  real :: x, y

  num_args = command_argument_count()
  IF (num_args < 1) THEN
     x = 0
  ELSE
    CALL get_command_argument(1, arg)
    READ(arg, '(f10.0)') x
  END IF

  y = (x-5)**2 + 1
  PRINT *, "epoch 1:"
  PRINT '((a), (f0.2))',  "objective_metric=",  y

end program hello