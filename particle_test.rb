require 'csv'

particle_list = CSV.read('./word_lists_json/particles.csv')

particles = {}
particle_list.each do |definition|
  particle = definition[0]
  meaning = definition[1]

  particles[particle] ||= []
  particles[particle] << meaning
end

Kernel.loop do
  particle = particles.keys.select{ |p| p.length == 1 }.sample
  meanings = particles[particle]

  puts particle
  puts meanings
  
  fake_meanings = particles.keys.sample(3).map{ |k| particles[k].meanings }.flatten
  fake_meanings = fake_meanings - meaning

  puts fake_meanings
end