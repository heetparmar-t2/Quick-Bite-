# QuickBite Deployment Guide for Presentation

## Quick Deploy to Vercel (Recommended for Demo)

### Prerequisites
- GitHub account with repo access
- Vercel account (free tier works)
- Supabase credentials ready

### Step 1: Connect to Vercel (Easiest)

1. Go to [vercel.com](https://vercel.com)
2. Sign in or create account
3. Click "New Project"
4. Select your GitHub repository containing this code
5. Vercel auto-detects Next.js framework
6. Click "Deploy"

### Step 2: Set Environment Variables

In Vercel Project Settings → Environment Variables, add:

```
NEXT_PUBLIC_SUPABASE_URL=your_supabase_url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key
```

Get these values from:
- Supabase Dashboard → Project Settings → API Keys
- Copy the URL and Anon Key

### Step 3: Deploy

Click "Deploy" button. Vercel will:
- Build your Next.js app
- Run tests
- Deploy to production
- Give you a live URL (e.g., `your-app.vercel.app`)

**Deployment time: 2-3 minutes**

---

## For v0 Users (Publish Button)

If you're using v0 with GitHub:

1. Click the "Publish" button in top-right of v0
2. v0 creates a GitHub commit with all your changes
3. Vercel automatically deploys on push (if connected)
4. Get live URL from Vercel dashboard

---

## Verify Deployment Works

### Test Checklist
- [ ] App loads without errors
- [ ] Homepage is accessible
- [ ] Login/signup page works
- [ ] Menu loads from database
- [ ] Can add items to cart
- [ ] Checkout flow works
- [ ] Orders are created successfully
- [ ] Admin dashboard accessible
- [ ] Images load correctly
- [ ] No 404 or 500 errors

### Test URLs
```
Live App: https://your-app.vercel.app
Admin Dashboard: https://your-app.vercel.app/admin
Leaderboard: https://your-app.vercel.app/leaderboard
Orders: https://your-app.vercel.app/orders
```

### Monitor Deployment
- Check Vercel dashboard for build status
- View deployment logs if issues occur
- Use DevTools Console for client-side errors
- Check Network tab for API errors

---

## Database Setup on Deployed App

### Initial Data Population

After deployment, you need to:

1. **Verify Tables Exist**
   - Go to Supabase Dashboard
   - Check Tables tab
   - Verify all tables are created

2. **Run Seed Scripts** (if not already done)
   - Execute `scripts/seed-menu.sql` in Supabase SQL Editor
   - Execute `scripts/seed-offers-combos.sql`
   - Execute `scripts/create-profile-trigger.sql`

3. **Create Demo Accounts**
   - Option A: Use Supabase Auth → Users tab → Add user
   - Option B: Use signup flow in deployed app
   - Create at least one student and one admin account

4. **Add Initial Points**
   - Go to user_profiles table
   - Update profiles with initial points (500 for demo student)
   - Set loyalty_tier appropriately

### Via SQL Editor

Paste and execute these commands:

```sql
-- Update demo user with points
UPDATE public.user_profiles 
SET points = 500, loyalty_tier = 'silver' 
WHERE email = 'demo@example.com';

-- Verify
SELECT id, email, full_name, role, points FROM public.user_profiles LIMIT 10;
```

---

## Troubleshooting Deployment

### Issue: App won't build
**Solution:**
- Check build logs in Vercel dashboard
- Ensure all dependencies in package.json
- Verify TypeScript types are correct
- Check for syntax errors

### Issue: Environment variables missing
**Solution:**
- Go to Vercel → Settings → Environment Variables
- Add NEXT_PUBLIC_SUPABASE_URL
- Add NEXT_PUBLIC_SUPABASE_ANON_KEY
- Redeploy after adding

### Issue: Database connection error
**Solution:**
- Verify Supabase URL is correct
- Verify Anon Key is correct
- Check Supabase project is active
- Test connection in Supabase dashboard

### Issue: Menu items not showing
**Solution:**
- Run seed scripts in Supabase SQL Editor
- Check categories exist before menu items
- Verify query in /api/menu route

### Issue: Images not loading
**Solution:**
- Check image paths start with /menu/
- Verify images exist in /public/menu/
- Check CORS if using external image URLs
- Use relative paths instead of absolute

### Issue: Authentication not working
**Solution:**
- Verify NEXT_PUBLIC_SUPABASE_URL is correct
- Check Supabase auth is enabled
- Verify user exists in Supabase Auth
- Check user_profiles table has matching entry

### Issue: Admin access denied
**Solution:**
- Verify admin user exists
- Check role in user_profiles table
- Verify RLS policies are correct
- Sign out and back in

---

## Performance Optimization

### Already Implemented
- Image optimization via Next.js
- Code splitting and lazy loading
- Server-side rendering where beneficial
- CSS-in-JS with Tailwind

### Monitor Performance
- Use Vercel Analytics (free on Pro plan)
- Check Core Web Vitals
- Monitor First Contentful Paint (FCP)
- Track Largest Contentful Paint (LCP)

### Expected Performance
- Homepage load: <2 seconds
- Dashboard load: <3 seconds
- Image load: <1 second
- API responses: <500ms

---

## Continuous Deployment

### Automatic Updates
1. Make changes in v0 or locally
2. Commit to GitHub
3. Push to main branch
4. Vercel automatically deploys
5. New version live in 2-3 minutes

### Manual Redeploy
1. Go to Vercel dashboard
2. Click on your project
3. Click "Deployments"
4. Find latest deployment
5. Click three dots → "Redeploy"

---

## Sharing Your Live Demo

### Direct Link
Simply share: `https://your-app.vercel.app`

### Demo Credentials for Sharing
Share these with audience if needed:
```
Student Account:
Email: demo@example.com
Password: Demo@123

Admin Account:
Email: admin@example.com
Password: Admin@123
```

### Share on Social Media
"Just deployed my QuickBite canteen food ordering app! Check it out: [link]"

### Get Analytics
- Vercel provides free analytics
- Track unique visitors
- Monitor page performance
- See deployment trends

---

## Post-Deployment Checklist

- [ ] Live URL is working
- [ ] All pages load without errors
- [ ] Database is connected
- [ ] Sample data is visible
- [ ] Authentication works
- [ ] Orders can be created
- [ ] Admin dashboard accessible
- [ ] Images load correctly
- [ ] Mobile view is responsive
- [ ] Share URL with audience

---

## Monitoring & Maintenance

### Weekly Checks
- Monitor error rates
- Check deployment frequency
- Review performance metrics
- Update dependencies if needed

### Security
- Keep dependencies updated
- Monitor for security alerts
- Use Vercel's security scanning
- Regularly backup database

### Scaling (if needed later)
- Upgrade Supabase plan
- Add CDN for images
- Implement caching layer
- Load balancing for high traffic

---

## Need Help?

### Resources
- [Vercel Docs](https://vercel.com/docs)
- [Next.js Docs](https://nextjs.org/docs)
- [Supabase Docs](https://supabase.com/docs)
- [Vercel Support](https://vercel.com/support)

### Common Links
- Vercel Dashboard: https://vercel.com/dashboard
- Supabase Dashboard: https://app.supabase.com
- GitHub: https://github.com
- Your Project: https://your-app.vercel.app

---

## Deployment Complete! 🎉

Your app is now live and ready for your presentation!

**Next Steps:**
1. Test the live deployment
2. Share URL with presentation audience
3. Monitor for any issues during presentation
4. Have local/preview version as backup

Good luck with your presentation!
