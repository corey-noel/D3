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
  erb :index
end

post '/fib' do
  input = parse_num_val params[:fib_val]
  result = fibonacci input
  puts input
  puts result
  erb :fibonacci, :locals => { input: input, result: result }
end

post '/fac' do
  params[:fac_val]
end

post '/hello' do
  params[:hello_val]
end

not_found do
  status 404
  erb :error404
end
