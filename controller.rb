require 'bundler'
Bundler.require

$words = []
f = File.new('./public/files/LoremIpsumm.txt', 'r')
arr = f.readlines
arr.each_with_index do |line, z|
  if z % 2 == 0
    output = line.split('0')
    output.each do |line|
      $words.push(line.split('\n')[0].to_s)
      $num=$words.count
    end
  end
end
get '/' do
  erb :lorem
end


post '/' do
  $sentences = params[:sentences].to_i
  $num2=$num - $sentences
  $newtotal=$num - $num2
  $num2= $num2.to_i
  $word = $words.drop($num2)

  $paragraphs = params[:paragraphs].to_i

  redirect '/output'
end

get '/output' do
  $outputs=$word * $paragraphs
end

