-- Create special offers table
CREATE TABLE IF NOT EXISTS public.special_offers (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  title TEXT NOT NULL,
  description TEXT,
  discount_type TEXT CHECK (discount_type IN ('percentage', 'fixed')),
  discount_value DECIMAL(10, 2) NOT NULL,
  start_date TIMESTAMP NOT NULL,
  end_date TIMESTAMP NOT NULL,
  is_active BOOLEAN DEFAULT true,
  created_by UUID,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create index for performance
CREATE INDEX IF NOT EXISTS idx_special_offers_active ON public.special_offers(is_active, end_date);

-- Enable RLS
ALTER TABLE public.special_offers ENABLE ROW LEVEL SECURITY;

-- Create policy to allow everyone to view active offers
CREATE POLICY "Everyone can view active special offers" ON public.special_offers
  FOR SELECT USING (is_active = true);

-- Insert sample special offers for demo
INSERT INTO public.special_offers (title, description, discount_type, discount_value, start_date, end_date, is_active) VALUES
  ('Welcome Offer', 'Get 20% off on your first order!', 'percentage', 20, NOW(), NOW() + INTERVAL '30 days', true),
  ('Lunch Special', 'Flat Rs. 50 off on orders above Rs. 200', 'fixed', 50, NOW(), NOW() + INTERVAL '14 days', true),
  ('Weekend Treat', '15% off on all desserts this weekend', 'percentage', 15, NOW(), NOW() + INTERVAL '7 days', true)
ON CONFLICT DO NOTHING;
