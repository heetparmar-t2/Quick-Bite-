-- Seed Demo Data for QuickBite Presentation
-- This script populates the database with realistic demo data for testing

-- Insert demo categories
INSERT INTO public.categories (name, description) VALUES
  ('Breakfast', 'Morning favorites to start your day'),
  ('Main Course', 'Hearty meals for lunch or dinner'),
  ('Sides', 'Perfect complements to your meal'),
  ('Beverages', 'Refreshing drinks'),
  ('Desserts', 'Sweet treats and pastries')
ON CONFLICT (name) DO NOTHING;

-- Insert demo menu items with images
INSERT INTO public.menu_items (name, description, price, category_id, image_url, is_available) VALUES
  ('Margherita Pizza', 'Classic pizza with fresh mozzarella, basil, and tomato sauce', 8.99, (SELECT id FROM public.categories WHERE name = 'Main Course'), '/menu/pizza.jpg', true),
  ('Samosa Trio', 'Crispy triangular pastries filled with spiced potatoes and peas', 4.99, (SELECT id FROM public.categories WHERE name = 'Sides'), '/menu/samosa.jpg', true),
  ('Classic Burger', 'Juicy beef patty with lettuce, tomato, and special sauce', 7.99, (SELECT id FROM public.categories WHERE name = 'Main Course'), '/menu/burger.jpg', true),
  ('Biryani Plate', 'Fragrant basmati rice with tender meat and aromatic spices', 10.99, (SELECT id FROM public.categories WHERE name = 'Main Course'), '/menu/biryani.jpg', true),
  ('Pasta Carbonara', 'Creamy pasta with bacon, eggs, and parmesan cheese', 9.49, (SELECT id FROM public.categories WHERE name = 'Main Course'), '/menu/pasta.jpg', true),
  ('Vanilla Ice Cream', 'Smooth and creamy vanilla ice cream', 3.99, (SELECT id FROM public.categories WHERE name = 'Desserts'), '/menu/ice-cream.jpg', true),
  ('Espresso Coffee', 'Rich and bold espresso shot', 2.49, (SELECT id FROM public.categories WHERE name = 'Beverages'), '/menu/coffee.jpg', true),
  ('Paneer Tikka', 'Marinated cottage cheese grilled with Indian spices', 6.99, (SELECT id FROM public.categories WHERE name = 'Sides'), '/menu/paneer-tikka.jpg', true),
  ('Breakfast Oatmeal', 'Hearty oatmeal with berries, honey, and granola', 5.99, (SELECT id FROM public.categories WHERE name = 'Breakfast'), NULL, true),
  ('Fresh Orange Juice', 'Freshly squeezed orange juice', 3.49, (SELECT id FROM public.categories WHERE name = 'Beverages'), NULL, true)
ON CONFLICT DO NOTHING;
