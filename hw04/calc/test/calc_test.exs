defmodule CalcTest do
  use ExUnit.Case
  doctest Calc

  test "numbers" do
    assert Calc.eval("0") == 0
    assert Calc.eval("1") == 1
    assert Calc.eval("-3") == -3
    assert Calc.eval("15") == 15
    assert Calc.eval("4572") == 4572
    assert Calc.eval("-23459") == -23459
  end

  test "simple arithmatic" do
    assert Calc.eval("1 + 1") == 2
    assert Calc.eval("20 + 43") == 63
    assert Calc.eval("5 - 2") == 3
    assert Calc.eval("64 - 18") == 46
    assert Calc.eval("3 * 3") == 9
    assert Calc.eval("12 * 12") == 144
    assert Calc.eval("8 / 2") == 4
    assert Calc.eval("-25 / 4") == -6
    assert Calc.eval("90 / 9") == 10
  end

  test "mixed operators" do
    assert Calc.eval("3 + 8 + -9") == 2
    assert Calc.eval("2 + 3 - -7") == 12
    assert Calc.eval("4 + 0 * 5") == 4
    assert Calc.eval("5 + 8 / 2") == 9
    assert Calc.eval("10 - 6 - 1") == 3
    assert Calc.eval("19 - 3 + 8") == 24
    assert Calc.eval("14 - 4 * 5") == -6
    assert Calc.eval("12 - 9 / 2") == 8
    assert Calc.eval("13 * 2 + 1") == 27
    assert Calc.eval("15 * 3 - 15") == 30
    assert Calc.eval("6 * 6 * 2") == 72
    assert Calc.eval("4 * 20 / 2") == 40
    assert Calc.eval("16 / 4 + 5") == 9
    assert Calc.eval("20 / 5 - 6") == -2
    assert Calc.eval("100 / -5 * -1") == 20
    assert Calc.eval("50 / 5 / 2") == 5
  end

  test "parentheses" do
    assert Calc.eval("(4 + 0) * 5") == 20
    assert Calc.eval("(5 + 8) / 2") == 6
    assert Calc.eval("10 - (6 - 1)") == 5
    assert Calc.eval("19 - (3 + 8)") == 8
    assert Calc.eval("(14 - 4) * 5") == 50
    assert Calc.eval("(12 - 9) / 2") == 1
    assert Calc.eval("3 + 3 * (2 - 3)") == 0
    assert Calc.eval("(2 * 0) - (3 + 9)") == -12
    assert Calc.eval("(2 * (3 + 7 + (3 - 2)) - (2 + 7))") == 13
  end
end
