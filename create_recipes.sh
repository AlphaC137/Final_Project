#!/bin/bash

# Bobby Flay - BBQ Burger
TOKEN=$(curl -s -X POST http://localhost:5000/api/auth/login -H "Content-Type: application/json" -d '{"email":"bobby@tastebase.com","password":"Grilling123"}' | jq -r '.token')
curl -s -X POST http://localhost:5000/api/recipes -H "Content-Type: application/json" -H "Authorization: Bearer $TOKEN" -d '{"title":"Bobby'\''s Ultimate BBQ Burger","description":"Juicy grilled burger with Bobby'\''s secret BBQ sauce","ingredients":["2 lbs ground beef","Salt and pepper","Brioche buns","Cheddar cheese","BBQ sauce","Bacon","Pickles"],"instructions":["Form 4 thick patties","Season with salt and pepper","Grill 4 minutes per side","Add cheese","Toast buns","Assemble and serve"],"tags":["burger","bbq","grilling","american"],"cookTime":"20 mins","imageUrl":"https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=400&h=240","isPublic":true}' > /dev/null
echo "✅ Bobby Flay - BBQ Burger"

# Giada De Laurentiis - Lemon Pasta
TOKEN=$(curl -s -X POST http://localhost:5000/api/auth/login -H "Content-Type: application/json" -d '{"email":"giada@tastebase.com","password":"ItalianCooking123"}' | jq -r '.token')
curl -s -X POST http://localhost:5000/api/recipes -H "Content-Type: application/json" -H "Authorization: Bearer $TOKEN" -d '{"title":"Giada'\''s Lemon Spaghetti","description":"Light and fresh Italian pasta with lemon, basil, and parmesan - pure Italian sunshine","ingredients":["1 lb spaghetti","3 lemons (zested and juiced)","1 cup pasta water","Extra virgin olive oil","Fresh basil","Parmesan cheese","Salt and pepper"],"instructions":["Cook pasta al dente","Reserve 1 cup pasta water","Toss pasta with lemon zest and juice","Add pasta water to create sauce","Mix in olive oil and torn basil","Top with fresh parmesan","Serve immediately"],"tags":["pasta","italian","lemon","fresh","vegetarian"],"cookTime":"20 mins","imageUrl":"https://images.unsplash.com/photo-1473093295043-cdd812d0e601?w=400&h=240","isPublic":true}' > /dev/null
echo "✅ Giada De Laurentiis - Lemon Pasta"

# Rachael Ray - 30 Minute Chili
TOKEN=$(curl -s -X POST http://localhost:5000/api/auth/login -H "Content-Type: application/json" -d '{"email":"rachael@tastebase.com","password":"ThirtyMinute123"}' | jq -r '.token')
curl -s -X POST http://localhost:5000/api/recipes -H "Content-Type: application/json" -H "Authorization: Bearer $TOKEN" -d '{"title":"Rachael'\''s 30-Minute Chili","description":"Quick and hearty chili perfect for busy weeknights - Yum-O!","ingredients":["2 lbs ground beef","1 onion, diced","2 cans kidney beans","2 cans diced tomatoes","Chili powder","Cumin","Garlic","Salt and pepper","Shredded cheese","Sour cream"],"instructions":["Brown beef with onions","Add beans and tomatoes","Season with chili powder and cumin","Simmer for 20 minutes","Serve with cheese and sour cream"],"tags":["chili","quick","comfort food","dinner","american"],"cookTime":"30 mins","imageUrl":"https://images.unsplash.com/photo-1588137378633-dea1336ce1e2?w=400&h=240","isPublic":true}' > /dev/null
echo "✅ Rachael Ray - 30-Minute Chili"

# Wolfgang Puck - Smoked Salmon Pizza
TOKEN=$(curl -s -X POST http://localhost:5000/api/auth/login -H "Content-Type: application/json" -d '{"email":"wolfgang@tastebase.com","password":"Spago123"}' | jq -r '.token')
curl -s -X POST http://localhost:5000/api/recipes -H "Content-Type: application/json" -H "Authorization: Bearer $TOKEN" -d '{"title":"Wolfgang'\''s Smoked Salmon Pizza","description":"Elegant pizza topped with crème fraîche, smoked salmon, and caviar - a Spago signature","ingredients":["Pizza dough","Crème fraîche","Smoked salmon","Red onions, thinly sliced","Capers","Fresh dill","Caviar (optional)","Lemon"],"instructions":["Roll out pizza dough thin","Bake crust at 500°F until crispy","Spread crème fraîche on hot crust","Top with smoked salmon","Add red onions, capers, and dill","Garnish with caviar if using","Squeeze lemon over top","Slice and serve"],"tags":["pizza","salmon","elegant","appetizer","seafood"],"cookTime":"25 mins","imageUrl":"https://images.unsplash.com/photo-1513104890138-7c749659a591?w=400&h=240","isPublic":true}' > /dev/null
echo "✅ Wolfgang Puck - Smoked Salmon Pizza"

# Julia Child - Boeuf Bourguignon
TOKEN=$(curl -s -X POST http://localhost:5000/api/auth/login -H "Content-Type: application/json" -d '{"email":"julia@tastebase.com","password":"BonAppetit123"}' | jq -r '.token')
curl -s -X POST http://localhost:5000/api/recipes -H "Content-Type: application/json" -H "Authorization: Bearer $TOKEN" -d '{"title":"Julia'\''s Boeuf Bourguignon","description":"Classic French beef stew braised in red wine - Bon Appétit!","ingredients":["3 lbs beef chuck, cubed","6 oz bacon","2 cups red wine","Beef stock","Pearl onions","Mushrooms","Carrots","Tomato paste","Flour","Butter","Thyme and bay leaf"],"instructions":["Brown bacon and beef in batches","Sauté vegetables","Deglaze with wine","Add stock and herbs","Simmer covered for 2.5 hours","Add pearl onions and mushrooms","Cook until tender","Serve with crusty bread"],"tags":["french","beef","stew","classic","dinner"],"cookTime":"3 hours","imageUrl":"https://images.unsplash.com/photo-1603073603765-da51c525fbc5?w=400&h=240","isPublic":true}' > /dev/null
echo "✅ Julia Child - Boeuf Bourguignon"

# Gordon Ramsay - Beef Wellington
TOKEN=$(curl -s -X POST http://localhost:5000/api/auth/login -H "Content-Type: application/json" -d '{"email":"gordon@tastebase.com","password":"BeefWellington123"}' | jq -r '.token')
curl -s -X POST http://localhost:5000/api/recipes -H "Content-Type: application/json" -H "Authorization: Bearer $TOKEN" -d '{"title":"Gordon'\''s Beef Wellington","description":"The ultimate show-stopping dish - perfectly cooked beef wrapped in mushroom duxelles and puff pastry","ingredients":["2 lb beef tenderloin","Puff pastry","Mushrooms","Shallots","Thyme","Parma ham","Egg yolk","Dijon mustard","Salt and pepper"],"instructions":["Sear beef on all sides","Brush with mustard","Spread mushroom duxelles on ham","Wrap beef in ham and duxelles","Encase in puff pastry","Brush with egg wash","Bake at 425°F for 25 minutes","Rest 10 minutes before slicing"],"tags":["beef","wellington","british","elegant","dinner"],"cookTime":"1 hour 30 mins","imageUrl":"https://images.unsplash.com/photo-1544025162-d76694265947?w=400&h=240","isPublic":true}' > /dev/null
echo "✅ Gordon Ramsay - Beef Wellington"

echo ""
echo "🎉 All recipes created successfully!"
