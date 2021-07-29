# frozen_string_literal: true

# This file should contain all the record creation needed to seed
# the database with its default values.
# The data can then be loaded with the bin/rails db:seed command
# (or created alongside the database with db:setup).

Topic.destroy_all

food = Topic.new(name: 'Food')
file1 = File.open(Rails.root.join('db/img/food_.png'))
food.avatar.attach(io: file1, filename: 'food_.png', content_type: 'image/png')
food.save!

people = Topic.new(name: 'People')
file2 = File.open(Rails.root.join('db/img/people_.png'))
people.avatar.attach(io: file2, filename: 'people_.png', content_type: 'image/png')
people.save!

animal = Topic.new(name: 'Animal')
file3 = File.open(Rails.root.join('db/img/animal_.png'))
animal.avatar.attach(io: file3, filename: 'animal_.png', content_type: 'image/png')
animal.save!

p 'Created topics'
