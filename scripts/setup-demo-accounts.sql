-- Setup Demo Accounts for Presentation
-- This script creates demo user profiles with initial points

-- Note: Actual auth users need to be created via Supabase Auth dashboard
-- This creates the corresponding profiles for demo accounts

-- Demo Student Profile (assuming auth user exists with email demo@example.com)
-- Replace the UUID with the actual user ID from Supabase Auth

-- Create demo profiles (these assume the corresponding auth users already exist)
-- In production, create auth users first, then run this

INSERT INTO public.user_profiles (id, email, full_name, role, points, loyalty_tier, total_orders) VALUES
  ('550e8400-e29b-41d4-a716-446655440001', 'demo@example.com', 'Demo Student', 'student', 500, 'silver', 3),
  ('550e8400-e29b-41d4-a716-446655440002', 'admin@example.com', 'Admin User', 'admin', 1000, 'platinum', 10)
ON CONFLICT (id) DO NOTHING;

-- Optional: Create sample orders for the demo student (for order history demo)
-- This helps show the complete functionality without needing to wait for real orders
INSERT INTO public.orders (id, user_id, total_amount, status, created_at) VALUES
  ('660e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440001', 250.00, 'completed', NOW() - INTERVAL '1 day'),
  ('660e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440001', 180.00, 'completed', NOW() - INTERVAL '2 days'),
  ('660e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440001', 320.00, 'completed', NOW() - INTERVAL '3 days')
ON CONFLICT DO NOTHING;

-- Add order items to sample orders
INSERT INTO public.order_items (id, order_id, menu_item_id, quantity, price_at_time, created_at) VALUES
  ('770e8400-e29b-41d4-a716-446655440001', '660e8400-e29b-41d4-a716-446655440001', (SELECT id FROM menu_items WHERE name = 'Chicken Biryani' LIMIT 1), 1, 180.00, NOW() - INTERVAL '1 day'),
  ('770e8400-e29b-41d4-a716-446655440002', '660e8400-e29b-41d4-a716-446655440001', (SELECT id FROM menu_items WHERE name = 'Mango Lassi' LIMIT 1), 2, 60.00, NOW() - INTERVAL '1 day'),
  ('770e8400-e29b-41d4-a716-446655440003', '660e8400-e29b-41d4-a716-446655440002', (SELECT id FROM menu_items WHERE name = 'Margherita Pizza' LIMIT 1), 1, 200.00, NOW() - INTERVAL '2 days'),
  ('770e8400-e29b-41d4-a716-446655440004', '660e8400-e29b-41d4-a716-446655440003', (SELECT id FROM menu_items WHERE name = 'Deluxe Burger' LIMIT 1), 2, 120.00, NOW() - INTERVAL '3 days'),
  ('770e8400-e29b-41d4-a716-446655440005', '660e8400-e29b-41d4-a716-446655440003', (SELECT id FROM menu_items WHERE name = 'Cappuccino' LIMIT 1), 1, 80.00, NOW() - INTERVAL '3 days')
ON CONFLICT DO NOTHING;

-- Add points to demo student profile for showing point system
UPDATE public.user_profiles SET points = 500, loyalty_tier = 'silver', total_orders = 3
WHERE email = 'demo@example.com';

-- Update admin profile
UPDATE public.user_profiles SET points = 1000, loyalty_tier = 'platinum', total_orders = 10
WHERE email = 'admin@example.com';
