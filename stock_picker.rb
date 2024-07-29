def stock_picker(array)
  holding_array = []
  array_copy = array.slice(0, array.length)
  for i in 0...array.length
    holding_array.push(array.map.with_index do |value, index|
      if i > index 
    {index: i, previous_index: index, difference: array_copy[i] - value}
      else
        {index: 0, previous_index: 0, difference: 0}
      end
    end)
  end

  for i in 0...holding_array.length
    holding_array[i].select! do |y|
      y[:difference] == holding_array[i].map { |x| x[:difference]}.max
    end
  end
  
  holding_array.map! {|value| value[0]}
  holding_array.select do |y|
    y[:difference] == holding_array.map { |x| x[:difference]}.max
  end.map {|x| [x[:previous_index], x[:index]]}[0]
end

p stock_picker([17,3,6,9,15,8,6,1,10])
