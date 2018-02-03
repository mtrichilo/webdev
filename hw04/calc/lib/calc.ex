defmodule Calc do
  @moduledoc """
  A simple four function calculator.
  """

  @doc """
  Entry point.

  ## Examples

    > 9 + 13
    22

    > 24 / 6 + (5 - 4)
    5 

  """
  def main() do
    IO.gets("> ") |> Calc.eval |> IO.puts
    main
  end

  def pop_until([], acc, _) do
    {[], acc}
  end

  def pop_until(stack, acc, stop_on) do
    {pop, new_stack} = List.pop_at(stack, -1) 
    cond do
      pop == "(" -> {new_stack, acc}
      Enum.member?(stop_on, pop) -> {stack, acc}
      true -> pop_until(new_stack, acc ++ [pop], stop_on)
    end
  end

  def postfix([], [], acc) do
    acc
  end

  def postfix([], stack, acc) do
    {pop, stack} = List.pop_at(stack, -1)
    postfix([], stack, acc ++ [pop])
  end

  def postfix(expr, stack, acc) do
    [head | tail] = expr
    {stack, acc} =
      case head do
        "(" -> {stack, acc}
        ")" -> pop_until(stack, acc, [])
        "+" -> pop_until(stack, acc, ["+", "-"])
        "-" -> pop_until(stack, acc, ["+", "-"])
        "*" -> pop_until(stack, acc, ["+", "-", "*", "/"])
        "/" -> pop_until(stack, acc, ["+", "-", "*", "/"])
        n -> {stack, acc ++ [n]}
      end
    
    case head do
      ^head when head in ["(", "+", "-", "*", "/"] -> postfix(tail, stack ++ [head], acc)
      _ -> postfix(tail, stack, acc)
    end
  end

  def helper(stack, f) do
    {second, stack} = List.pop_at(stack, -1)
    {first, stack} = List.pop_at(stack, -1)
    stack ++ [f.(first, second)]
  end

  def calc([], stack) do
    hd stack 
  end

  def calc(expr, stack) do
    [head | tail] = expr
    stack =
      case head do
        "+" -> helper(stack, &+/2)
        "-" -> helper(stack, &-/2)
        "*" -> helper(stack, &*/2)
        "/" -> helper(stack, &div/2)
        n -> stack ++ [String.to_integer(n)]
      end
    calc(tail, stack)
  end

  def eval(expr) do
    String.trim(expr)
    |> String.replace("(", "( ")
    |> String.replace(")", " )")
    |> String.split(" ")
    |> postfix([], [])
    |> calc([])
  end
end
