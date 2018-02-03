defmodule Calc do
  @moduledoc """
  A simple four function calculator.
  """

  @doc """
  Gets an arithmatic expression from the user, evaluates it,
  and prints the answer. This is done indefinitely.
  """
  def main() do
    IO.gets("> ") |> Calc.eval |> IO.puts
    main
  end

  @doc """
  Parses and evaluates an arithmatic expression.
  """
  def eval(expr) do
    String.trim(expr)
    |> String.replace("(", "( ")
    |> String.replace(")", " )")
    |> String.split(" ")
    |> postfix([], [])
    |> calc([])
  end
  
  # Pops elements from the given stack and adds them to the
  # given accumulator until a stopping condition is met.
  defp pop_until([], acc, _, _) do
    {[], acc}
  end

  defp pop_until(stack, acc, assoc, lower) do
    {pop, new_stack} = List.pop_at(stack, -1) 
    cond do
      Enum.member?(assoc, pop) -> {new_stack, acc ++ [pop]}
      Enum.member?(lower, pop) -> {stack, acc}
      pop == "(" -> {new_stack, acc} # Head must be a closing parenthesis.
      true -> pop_until(new_stack, acc ++ [pop], assoc, lower)
    end
  end

  # Transforms the given infix expression into its equivalent
  # postfix expression.
  defp postfix([], [], acc) do
    acc
  end

  defp postfix([], stack, acc) do
    {pop, stack} = List.pop_at(stack, -1)
    postfix([], stack, acc ++ [pop])
  end

  defp postfix(expr, stack, acc) do
    [head | tail] = expr
    {stack, acc} =
      case head do
        "(" -> {stack, acc}
        ")" -> pop_until(stack, acc, [], [])
        "+" -> pop_until(stack, acc, ["+", "-"], ["("])
        "-" -> pop_until(stack, acc, ["+", "-"], ["("])
        "*" -> pop_until(stack, acc, ["*", "/"], ["+", "-", "("])
        "/" -> pop_until(stack, acc, ["*", "/"], ["+", "-", "("])
        n -> {stack, acc ++ [n]}
      end
    
    case head do
      head when head in ["(", "+", "-", "*", "/"] -> postfix(tail, stack ++ [head], acc)
      _ -> postfix(tail, stack, acc)
    end
  end

  # Pops two elements from the stack, applies the given function
  # on them, and pushes that result back onto the stack.
  defp pop_two(stack, f) do
    {second, stack} = List.pop_at(stack, -1)
    {first, stack} = List.pop_at(stack, -1)
    stack ++ [f.(first, second)]
  end

  # Evaluates a given postfix expression.
  defp calc([], stack) do
    hd stack 
  end

  defp calc(expr, stack) do
    [head | tail] = expr
    stack =
      case head do
        "+" -> pop_two(stack, &+/2)
        "-" -> pop_two(stack, &-/2)
        "*" -> pop_two(stack, &*/2)
        "/" -> pop_two(stack, &div/2)
        n -> stack ++ [String.to_integer(n)]
      end
    calc(tail, stack)
  end
end
