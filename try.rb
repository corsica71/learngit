#coding=utf-8

#打开数组文件
aFile = File.open("name.txt", "r");
#读取到字符串里
string = aFile.gets
string.gsub!("\"","")
string.gsub!(" ","")
string.gsub!("\\","")
string.gsub!("\n","")
string.gsub!("\]","")
string.gsub!("\[","")

#放进数组中
array = string.split(",")

#删除特殊符号
array.each do |i|
  if(i=~/[\\\/\$\?&%\!@]/)
    array.delete(i)
  end
end

#计数
hash_count = {}
array.each do |item|
  keys = item
  hash_count[keys] ||= 0
  hash_count[keys] += 1
end
array_sort = hash_count.sort { |a, b| a[1]<=>b[1] }
array_sort.reverse!
#puts hash_count
num = array_sort.length

sum ||= 0
hash_count.values.each do |item|
  sum += item.to_i
end

#json
hash_count = Hash[array_sort]
json = File.open("result.json","w+")
json.puts(hash_count.to_s)

#输出总人数宗人次
puts "总人次是#{sum}"
puts "总人数是#{num}"
