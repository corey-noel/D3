require 'sinatra'

def parse_num_val arg
  begin
    res = Integer(arg)
    if res < 1
      1
    else
      res
    end
  rescue ArgumentError
    1
  end
end

def factorial num
  (1..num).reduce(1, :*)
end

def fibonacci num
  n1 = 0
  n2 = 1
  num.times do
    tmp = n1 + n2
    n1 = n2
    n2 = tmp
  end
  n1
end

get '/' do
  if !params[:fib_val].nil?
    fib
  elsif !params[:fac_val].nil?
    fac
  elsif !params[:hello_val].nil?
    hello
  else
    erb :index
  end
end

def fib
  input = parse_num_val params[:fib_val]
  result = fibonacci input
  erb :fibonacci, :locals => { input: input, result: result }
end

def fac
  input = parse_num_val params[:fac_val]
  result = factorial input
  erb :factorial, :locals => { input: input, result: result }
end

def hello
  user_name = params[:hello_val].upcase
  erb :hello, :locals => { user_name: user_name }
end

not_found do
  status 404
  erb :error404
end
