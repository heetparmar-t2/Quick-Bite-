-- Seed Demo Data for QuickBite Presentation
-- This script populates the database with realistic demo data for testing

-- Insert demo categories
INSERT INTO categories (name, description, icon) VALUES
  ('Breakfast', 'Morning favorites to start your day', '🌅'),
  ('Main Course', 'Hearty meals for lunch or dinner', '🍽️'),
  ('Sides', 'Perfect complements to your meal', '🥗'),
  ('Beverages', 'Refreshing drinks', '🥤'),
  ('Desserts', 'Sweet treats and pastries', '🍰')
ON CONFLICT DO NOTHING;

-- Insert demo menu items with images
INSERT INTO menu_items (name, description, price, category_id, image_url, is_available) VALUES
  ('Margherita Pizza', 'Classic pizza with fresh mozzarella, basil, and tomato sauce', 8.99, (SELECT id FROM categories WHERE name = 'Main Course'), '/menu/pizza.jpg', true),
  ('Samosa Trio', 'Crispy triangular pastries filled with spiced potatoes and peas', 4.99, (SELECT id FROM categories WHERE name = 'Sides'), '/menu/samosa.jpg', true),
  ('Classic Burger', 'Juicy beef patty with lettuce, tomato, and special sauce', 7.99, (SELECT id FROM categories WHERE name = 'Main Course'), '/menu/burger.jpg', true),
  ('Biryani Plate', 'Fragrant basmati rice with tender meat and aromatic spices', 10.99, (SELECT id FROM categories WHERE name = 'Main Course'), '/menu/biryani.jpg', true),
  ('Pasta Carbonara', 'Creamy pasta with bacon, eggs, and parmesan cheese', 9.49, (SELECT id FROM categories WHERE name = 'Main Course'), '/menu/pasta.jpg', true),
  ('Vanilla Ice Cream', 'Smooth and creamy vanilla ice cream', 3.99, (SELECT id FROM categories WHERE name = 'Desserts'), '/menu/ice-cream.jpg', true),
  ('Espresso Coffee', 'Rich and bold espresso shot', 2.49, (SELECT id FROM categories WHERE name = 'Beverages'), '/menu/coffee.jpg', true),
  ('Paneer Tikka', 'Marinated cottage cheese grilled with Indian spices', 6.99, (SELECT id FROM categories WHERE name = 'Sides'), '/menu/paneer-tikka.jpg', true),
  ('Breakfast Oatmeal', 'Hearty oatmeal with berries, honey, and granola', 5.99, (SELECT id FROM categories WHERE name = 'Breakfast'), '/menu/oatmeal.jpg', true),
  ('Fresh Orange Juice', 'Freshly squeezed orange juice', 3.49, (SELECT id FROM categories WHERE name = 'Beverages'), '/menu/orange-juice.jpg', true)
ON CONFLICT DO NOTHING;

-- Insert demo special offers
INSERT INTO special_offers (name, description, discount_percentage, menu_item_id, valid_from, valid_until, is_active) VALUES
  ('Morning Discount', '20% off breakfast items before 10 AM', 20, (SELECT id FROM menu_items WHERE name = 'Breakfast Oatmeal'), NOW(), NOW() + INTERVAL '30 days', true),
  ('Combo Deal', 'Buy any main course and get a beverage at 50% off', 50, (SELECT id FROM menu_items WHERE name = 'Classic Burger'), NOW(), NOW() + INTERVAL '30 days', true),
  ('Dessert Special', 'Ice cream just 2.99 with any main purchase', 25, (SELECT id FROM menu_items WHERE name = 'Vanilla Ice Cream'), NOW(), NOW() + INTERVAL '30 days', true)
ON CONFLICT DO NOTHING;

-- Insert demo combo meals
INSERT INTO combo_meals (name, description, base_price, menu_items) VALUES
  ('Lunch Special', 'Main course + beverage + dessert', 15.99, ARRAY[(SELECT id FROM menu_items WHERE name = 'Classic Burger'), (SELECT id FROM menu_items WHERE name = 'Fresh Orange Juice'), (SELECT id FROM menu_items WHERE name = 'Vanilla Ice Cream')]),
  ('Breakfast Bundle', 'Oatmeal + coffee + pastry', 10.99, ARRAY[(SELECT id FROM menu_items WHERE name = 'Breakfast Oatmeal'), (SELECT id FROM menu_items WHERE name = 'Espresso Coffee')])
ON CONFLICT DO NOTHING;
