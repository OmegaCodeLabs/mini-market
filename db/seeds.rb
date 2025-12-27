# Clear existing data
puts "Clearing existing data..."
ItemCategory.destroy_all
Item.destroy_all
Category.destroy_all
User.destroy_all

puts "Creating users..."

# Regular user
user = User.create!(
  email: "user@example.com",
  password: "testing123",
  password_confirmation: "testing123",
  name: "John",
  last_name: "Doe",
  username: "johndoe",
  admin: false
)
puts "✓ Created regular user: #{user.email}"

# Admin user
admin = User.create!(
  email: "admin@example.com",
  password: "testing123",
  password_confirmation: "testing123",
  name: "Admin",
  last_name: "User",
  username: "admin",
  admin: true
)
puts "✓ Created admin user: #{admin.email}"

puts "\nCreating categories..."

electronics = Category.create!(
  name: "Electronics",
  description: "Electronic devices and gadgets"
)

computers = Category.create!(
  name: "Computers",
  description: "Desktop and laptop computers"
)

accessories = Category.create!(
  name: "Accessories",
  description: "Computer and electronic accessories"
)

home_office = Category.create!(
  name: "Home & Office",
  description: "Products for home and office use"
)

gaming = Category.create!(
  name: "Gaming",
  description: "Gaming consoles, accessories, and peripherals"
)

puts "✓ Created #{Category.count} categories"

puts "\nCreating items..."

# Item 1
laptop = Item.create!(
  name: "MacBook Pro 16\"",
  description: "High-performance laptop with M3 Pro chip, 16GB RAM, and 512GB SSD. Perfect for professionals and creatives.",
  sku: "MBP-16-001",
  price: 2499.99,
  stock_quantity: 15,
  active: true
)
laptop.categories << [electronics, computers]
puts "✓ Created item: #{laptop.name}"

# Item 2
desktop = Item.create!(
  name: "Dell XPS Desktop",
  description: "Powerful desktop computer with Intel Core i7, 32GB RAM, and 1TB SSD. Ideal for heavy workloads.",
  sku: "DELL-XPS-002",
  price: 1799.99,
  stock_quantity: 8,
  active: true
)
desktop.categories << [computers, home_office]
puts "✓ Created item: #{desktop.name}"

# Item 3
mouse = Item.create!(
  name: "Logitech MX Master 3S",
  description: "Ergonomic wireless mouse with precision tracking and customizable buttons.",
  sku: "LOG-MX3S-003",
  price: 99.99,
  stock_quantity: 45,
  active: true
)
mouse.categories << [accessories, home_office]
puts "✓ Created item: #{mouse.name}"

# Item 4
keyboard = Item.create!(
  name: "Mechanical Gaming Keyboard",
  description: "RGB backlit mechanical keyboard with Cherry MX switches. Perfect for gaming and typing.",
  sku: "KB-MECH-004",
  price: 149.99,
  stock_quantity: 30,
  active: true
)
keyboard.categories << [accessories, gaming]
puts "✓ Created item: #{keyboard.name}"

# Item 5
monitor = Item.create!(
  name: "27\" 4K Monitor",
  description: "Ultra HD 4K monitor with HDR support and 144Hz refresh rate. Stunning visuals for work and play.",
  sku: "MON-4K-005",
  price: 499.99,
  stock_quantity: 20,
  active: true
)
monitor.categories << [electronics, home_office]
puts "✓ Created item: #{monitor.name}"

# Item 6
headset = Item.create!(
  name: "Wireless Gaming Headset",
  description: "Premium wireless headset with 7.1 surround sound and noise-canceling microphone.",
  sku: "HS-GAME-006",
  price: 179.99,
  stock_quantity: 25,
  active: true
)
headset.categories << [gaming, accessories]
puts "✓ Created item: #{headset.name}"

# Item 7
webcam = Item.create!(
  name: "1080p Webcam",
  description: "Full HD webcam with autofocus and built-in stereo microphones. Perfect for video calls.",
  sku: "CAM-HD-007",
  price: 79.99,
  stock_quantity: 35,
  active: true
)
webcam.categories << [electronics, home_office]
puts "✓ Created item: #{webcam.name}"

# Item 8
ssd = Item.create!(
  name: "1TB External SSD",
  description: "Ultra-fast portable SSD with USB-C connection. Transfer speeds up to 1050MB/s.",
  sku: "SSD-1TB-008",
  price: 129.99,
  stock_quantity: 50,
  active: true
)
ssd.categories << [accessories, computers]
puts "✓ Created item: #{ssd.name}"

# Item 9
controller = Item.create!(
  name: "Wireless Game Controller",
  description: "Ergonomic wireless controller compatible with PC and console. 40-hour battery life.",
  sku: "CTRL-GAME-009",
  price: 59.99,
  stock_quantity: 40,
  active: true
)
controller.categories << [gaming, accessories]
puts "✓ Created item: #{controller.name}"

# Item 10
desk_lamp = Item.create!(
  name: "LED Desk Lamp",
  description: "Adjustable LED desk lamp with touch controls and USB charging port. Perfect for any workspace.",
  sku: "LAMP-LED-010",
  price: 39.99,
  stock_quantity: 60,
  active: true
)
desk_lamp.categories << [home_office]
puts "✓ Created item: #{desk_lamp.name}"

puts "\n" + "="*50
puts "Seed data created successfully!"
puts "="*50
puts "\nUsers created:"
puts "  Regular User - Email: user@example.com | Password: testing123"
puts "  Admin User   - Email: admin@example.com | Password: testing123"
puts "\nCategories: #{Category.count}"
puts "Items: #{Item.count}"
puts "\nYou can now run: bin/rails server"
