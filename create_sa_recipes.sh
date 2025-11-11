#!/bin/bash

echo "🇿🇦 Creating South African Food Heroes..."

# 1. Somizi Mhlongo - TV personality & cook
curl -s -X POST http://localhost:5000/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{"username":"somizi_mhlongo","email":"somizi@tastebase.com","password":"SomGaga123"}' > /dev/null
echo "✅ Somizi Mhlongo registered"

# 2. Nandi Madida - TV personality & foodie
curl -s -X POST http://localhost:5000/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{"username":"nandi_madida","email":"nandi@tastebase.com","password":"AfricanQueen123"}' > /dev/null
echo "✅ Nandi Madida registered"

# 3. Siba Mtongana - Celebrity chef
curl -s -X POST http://localhost:5000/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{"username":"siba_mtongana","email":"siba@tastebase.com","password":"SibaTheChef123"}' > /dev/null
echo "✅ Siba Mtongana registered"

# 4. Lentswe Bhengu - Food entrepreneur
curl -s -X POST http://localhost:5000/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{"username":"lentswe_bhengu","email":"lentswe@tastebase.com","password":"UrbanCuisine123"}' > /dev/null
echo "✅ Lentswe Bhengu registered"

# 5. Zola Nene - TV host & food lover
curl -s -X POST http://localhost:5000/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{"username":"zola_nene","email":"zola@tastebase.com","password":"TopBilling123"}' > /dev/null
echo "✅ Zola Nene registered"

echo ""
echo "🍽️ Creating South African Recipes..."
echo ""

# Recipe 1: Somizi's Kota/Bunny Chow
TOKEN=$(curl -s -X POST http://localhost:5000/api/auth/login -H "Content-Type: application/json" -d '{"email":"somizi@tastebase.com","password":"SomGaga123"}' | jq -r '.token')
curl -s -X POST http://localhost:5000/api/recipes \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $TOKEN" \
  -d '{
    "title": "Somizi'\''s Township Kota",
    "description": "The ultimate South African street food - a quarter loaf filled with chips, polony, cheese, and all the trimmings. Pure township flavor!",
    "ingredients": [
      "1 quarter loaf of white bread",
      "2 cups frozen chips/fries",
      "8-10 slices polony or Russian sausage",
      "4 slices cheddar cheese",
      "2 tablespoons Mrs Balls chutney or atchar",
      "Tomato sauce",
      "Mustard sauce",
      "Peri-peri sauce (optional)",
      "Oil for frying"
    ],
    "instructions": [
      "Heat oil in a deep pan and fry chips until golden and crispy",
      "While chips are frying, slice polony or Russian into thick slices",
      "Fry the polony slices for 2-3 minutes on each side for extra flavor",
      "Cut the top off the quarter loaf and hollow out the inside (save the bread for dipping)",
      "Layer the hot chips at the bottom of the hollowed bread",
      "Add the fried polony or Russian on top of chips",
      "Place cheese slices over the hot meat so it melts slightly",
      "Add generous dollops of atchar or Mrs Balls chutney",
      "Drizzle with tomato sauce, mustard, and peri-peri if you like it hot",
      "Place the bread lid back on top and press down firmly to crush everything together",
      "Cut in half and serve immediately while hot - eat with your hands for the authentic experience!"
    ],
    "tags": ["south african", "street food", "kota", "township", "quick"],
    "cookTime": "20 mins",
    "imageUrl": "https://images.unsplash.com/photo-1619740455993-a43c0a73be4e?w=400&h=240",
    "isPublic": true
  }' > /dev/null
echo "✅ Somizi's Township Kota"

# Recipe 2: Nandi's Pap & Vleis with Chakalaka
TOKEN=$(curl -s -X POST http://localhost:5000/api/auth/login -H "Content-Type: application/json" -d '{"email":"nandi@tastebase.com","password":"AfricanQueen123"}' | jq -r '.token')
curl -s -X POST http://localhost:5000/api/recipes \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $TOKEN" \
  -d '{
    "title": "Nandi'\''s Pap, Vleis & Chakalaka",
    "description": "Traditional South African meal - creamy pap served with grilled meat and spicy chakalaka. Perfect for a Sunday braai!",
    "ingredients": [
      "For Pap: 4 cups water, 2 cups maize meal, 1 tsp salt, 2 tbsp butter",
      "For Vleis: 8 lamb or beef chops, salt, pepper, BBQ spice",
      "For Chakalaka: 2 onions diced, 2 green peppers diced, 2 carrots grated",
      "2 tomatoes diced, 1 can baked beans, 2 tbsp curry powder",
      "1 tsp paprika, 2 fresh chillies chopped, 2 tbsp oil"
    ],
    "instructions": [
      "MAKE PAP: Bring water and salt to a boil in a large pot",
      "Add maize meal slowly while stirring continuously to avoid lumps",
      "Stir until mixture becomes very thick and pulls away from the pot",
      "Reduce heat to low, cover, and steam for 10-15 minutes",
      "Add butter and mix until creamy and smooth",
      "MAKE CHAKALAKA: Heat oil in a pan, fry onions until soft",
      "Add peppers and carrots, cook for 5 minutes",
      "Add tomatoes, curry powder, paprika, and chillies",
      "Stir in baked beans and simmer for 10 minutes until thick",
      "COOK VLEIS: Season chops with salt, pepper, and BBQ spice",
      "Grill on hot braai or pan for 4-5 minutes per side",
      "Let meat rest for 5 minutes before serving",
      "Serve pap with vleis on top and chakalaka on the side"
    ],
    "tags": ["south african", "pap", "braai", "traditional", "chakalaka"],
    "cookTime": "45 mins",
    "imageUrl": "https://images.unsplash.com/photo-1544025162-d76694265947?w=400&h=240",
    "isPublic": true
  }' > /dev/null
echo "✅ Nandi's Pap, Vleis & Chakalaka"

# Recipe 3: Siba's Bunny Chow (Curry Version)
TOKEN=$(curl -s -X POST http://localhost:5000/api/auth/login -H "Content-Type: application/json" -d '{"email":"siba@tastebase.com","password":"SibaTheChef123"}' | jq -r '.token')
curl -s -X POST http://localhost:5000/api/recipes \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $TOKEN" \
  -d '{
    "title": "Siba'\''s Durban Bunny Chow",
    "description": "Authentic Durban bunny chow - half a loaf filled with rich, spicy curry. A legendary street food from KwaZulu-Natal!",
    "ingredients": [
      "1 unsliced half loaf of white bread",
      "500g beef or chicken, cubed",
      "2 onions, finely chopped",
      "4 cloves garlic, minced",
      "1 thumb ginger, grated",
      "3 tomatoes, chopped",
      "2 potatoes, cubed",
      "3 tbsp curry powder",
      "1 tsp turmeric",
      "1 tsp cumin",
      "2 cups beef/chicken stock",
      "Fresh coriander",
      "Salt to taste",
      "Oil for cooking"
    ],
    "instructions": [
      "Heat oil in a large pot, fry onions until golden brown",
      "Add garlic and ginger, cook for 1 minute until fragrant",
      "Add meat and brown on all sides",
      "Stir in curry powder, turmeric, and cumin, toast spices for 2 minutes",
      "Add tomatoes and cook until soft and pulpy",
      "Pour in stock and add potatoes",
      "Bring to a boil, then reduce heat and simmer covered for 45 minutes",
      "Curry should be thick and rich - reduce further if needed",
      "Meanwhile, hollow out the half loaf, creating a bread bowl",
      "Keep the scooped-out bread for dipping",
      "Fill the hollowed loaf with hot curry until overflowing",
      "Top with fresh coriander and extra gravy",
      "Serve immediately - use the bread pieces to scoop up curry"
    ],
    "tags": ["south african", "bunny chow", "curry", "durban", "street food"],
    "cookTime": "1 hour 15 mins",
    "imageUrl": "https://images.unsplash.com/photo-1585937421612-70a008356fbe?w=400&h=240",
    "isPublic": true
  }' > /dev/null
echo "✅ Siba's Durban Bunny Chow"

# Recipe 4: Lentswe's Boerewors & Braai
TOKEN=$(curl -s -X POST http://localhost:5000/api/auth/login -H "Content-Type: application/json" -d '{"email":"lentswe@tastebase.com","password":"UrbanCuisine123"}' | jq -r '.token')
curl -s -X POST http://localhost:5000/api/recipes \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $TOKEN" \
  -d '{
    "title": "Lentswe'\''s Perfect Braai Platter",
    "description": "Master the South African braai with boerewors, chops, and steak. Low and slow is the way to go!",
    "ingredients": [
      "2kg boerewors (traditional beef sausage)",
      "8 lamb or pork chops",
      "4 rib-eye steaks",
      "8 chicken pieces (thighs and drumsticks)",
      "Braai salt (coarse salt)",
      "Black pepper",
      "Braai spice blend",
      "Lemon juice",
      "Charcoal or wood for fire",
      "Mrs Balls chutney for serving"
    ],
    "instructions": [
      "Light your charcoal and wait until coals are white-hot with no flames",
      "Season all meats with salt, pepper, and braai spice",
      "Marinate chicken in lemon juice for 15 minutes if desired",
      "Start with boerewors - place on cooler side of grid, cook slowly for 15-20 minutes",
      "Turn boerewors regularly to prevent bursting, avoid pricking with fork",
      "Add chicken pieces to coolest part of braai, cook for 30-40 minutes turning often",
      "When wors is nearly done, add chops to hot part of grid",
      "Cook chops for 5-7 minutes per side until nicely charred",
      "Finally add steaks - 3-4 minutes per side for medium-rare",
      "Let all meat rest for 5 minutes before serving",
      "Serve with pap, salad, and Mrs Balls chutney",
      "Pro tip: Keep meats moving from hot to cool zones to control cooking"
    ],
    "tags": ["south african", "braai", "boerewors", "bbq", "meat"],
    "cookTime": "1 hour",
    "imageUrl": "https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=400&h=240",
    "isPublic": true
  }' > /dev/null
echo "✅ Lentswe's Perfect Braai Platter"

# Recipe 5: Zola's Vetkoek & Mince
TOKEN=$(curl -s -X POST http://localhost:5000/api/auth/login -H "Content-Type: application/json" -d '{"email":"zola@tastebase.com","password":"TopBilling123"}' | jq -r '.token')
curl -s -X POST http://localhost:5000/api/recipes \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $TOKEN" \
  -d '{
    "title": "Zola'\''s Vetkoek & Spicy Mince",
    "description": "Fluffy deep-fried bread filled with savory curried mince. A South African comfort food classic!",
    "ingredients": [
      "For Vetkoek: 4 cups cake flour, 2 tsp instant yeast, 2 tbsp sugar",
      "1 tsp salt, 2 cups warm water, Oil for deep frying",
      "For Mince: 500g beef mince, 1 large onion diced, 2 carrots grated",
      "1 cup frozen peas, 3 tomatoes chopped, 3 tbsp curry powder",
      "1 tsp paprika, 2 beef stock cubes, 1 cup water",
      "Salt and pepper to taste"
    ],
    "instructions": [
      "MAKE VETKOEK DOUGH: Mix flour, yeast, sugar, and salt in a large bowl",
      "Add warm water gradually, mixing until you have a soft sticky dough",
      "Cover bowl with a damp cloth and let rise in warm place for 1 hour until doubled",
      "MAKE MINCE: Heat oil in a pot, fry onions until golden",
      "Add mince and break up, cook until browned",
      "Add curry powder and paprika, fry for 2 minutes to release flavors",
      "Add tomatoes, carrots, stock cubes, and water",
      "Simmer for 20 minutes, stirring occasionally",
      "Add peas and cook for 5 more minutes until thick",
      "Season with salt and pepper to taste",
      "FRY VETKOEK: Heat oil in deep pot (oil should be 5cm deep)",
      "Wet hands, pinch off tennis ball-sized pieces of dough",
      "Shape into balls and flatten slightly",
      "Fry 3-4 at a time for 3-4 minutes per side until golden brown",
      "Drain on paper towels",
      "Cut vetkoek open and fill generously with hot mince",
      "Serve immediately while hot and crispy"
    ],
    "tags": ["south african", "vetkoek", "fried bread", "comfort food", "traditional"],
    "cookTime": "1 hour 30 mins",
    "imageUrl": "https://images.unsplash.com/photo-1509440159596-0249088772ff?w=400&h=240",
    "isPublic": true
  }' > /dev/null
echo "✅ Zola's Vetkoek & Spicy Mince"

# Recipe 6: Somizi's Gatsby
TOKEN=$(curl -s -X POST http://localhost:5000/api/auth/login -H "Content-Type: application/json" -d '{"email":"somizi@tastebase.com","password":"SomGaga123"}' | jq -r '.token')
curl -s -X POST http://localhost:5000/api/recipes \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $TOKEN" \
  -d '{
    "title": "Somizi'\''s Cape Town Gatsby",
    "description": "Legendary Cape Flats sandwich - a full loaf packed with chips, steak, and sauces. One Gatsby feeds 4 people!",
    "ingredients": [
      "1 long French loaf (about 60cm)",
      "1kg slap chips (thick-cut fries)",
      "500g beef steak strips or polony",
      "Lettuce leaves",
      "2 tomatoes, sliced",
      "Tomato sauce",
      "Peri-peri sauce",
      "Mayonnaise",
      "Vinegar",
      "Salt and pepper",
      "Oil for frying"
    ],
    "instructions": [
      "Cut chips into thick slap chip style (1cm thick)",
      "Fry chips until cooked through but still soft, not too crispy",
      "Season chips with salt, vinegar, and a bit of tomato sauce while hot",
      "Slice steak into thin strips and season with salt and pepper",
      "Fry steak strips in hot pan for 3-4 minutes until cooked",
      "Cut the long loaf in half lengthwise",
      "Scoop out some of the bread inside to make room for fillings",
      "Layer the bottom half: Start with lettuce leaves",
      "Add a thick layer of hot slap chips",
      "Top with cooked steak strips or fried polony",
      "Add sliced tomatoes",
      "Drizzle generously with tomato sauce, peri-peri, and mayo",
      "Close with top half of bread and press down firmly",
      "Cut into 4 equal portions",
      "Serve immediately - messy eating is expected and encouraged!"
    ],
    "tags": ["south african", "gatsby", "sandwich", "cape town", "street food"],
    "cookTime": "35 mins",
    "imageUrl": "https://images.unsplash.com/photo-1553909489-cd47e0907980?w=400&h=240",
    "isPublic": true
  }' > /dev/null
echo "✅ Somizi's Cape Town Gatsby"

# Recipe 7: Siba's Chicken Biryani
TOKEN=$(curl -s -X POST http://localhost:5000/api/auth/login -H "Content-Type: application/json" -d '{"email":"siba@tastebase.com","password":"SibaTheChef123"}' | jq -r '.token')
curl -s -X POST http://localhost:5000/api/recipes \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $TOKEN" \
  -d '{
    "title": "Siba'\''s Durban Chicken Biryani",
    "description": "Aromatic layered rice dish with tender chicken and potatoes. A Durban Indian community treasure!",
    "ingredients": [
      "3 cups basmati rice",
      "1kg chicken pieces",
      "4 large potatoes, peeled and quartered",
      "3 onions, thinly sliced",
      "6 cloves garlic, crushed",
      "1 thumb ginger, grated",
      "1 cup plain yoghurt",
      "4 tbsp biryani masala spice",
      "2 tomatoes, chopped",
      "Fresh coriander and mint",
      "Saffron threads or yellow food coloring",
      "Salt to taste",
      "Oil or ghee for cooking"
    ],
    "instructions": [
      "Wash rice until water runs clear, soak for 30 minutes",
      "Parboil rice in salted water for 5 minutes until halfway cooked, drain",
      "Heat oil in large pot, fry sliced onions until golden brown",
      "Remove half the onions and set aside for layering",
      "Add garlic and ginger to remaining onions, fry for 1 minute",
      "Add chicken pieces and brown on all sides",
      "Stir in biryani masala, cook for 2 minutes",
      "Add tomatoes and yoghurt, mix well",
      "Add potatoes and 1 cup water, cover and cook for 15 minutes",
      "Chicken and potatoes should be tender but not fully cooked",
      "Layer half the parboiled rice over chicken mixture",
      "Sprinkle with fried onions, coriander, and mint",
      "Add remaining rice on top",
      "Dissolve saffron in 1/4 cup hot water, drizzle over rice",
      "Cover pot with tight lid, cook on lowest heat for 30-40 minutes",
      "Steam should cook rice to perfection - do not stir!",
      "Let rest 5 minutes, then serve by scooping from bottom to get all layers"
    ],
    "tags": ["south african", "biryani", "durban", "indian", "rice"],
    "cookTime": "1 hour 30 mins",
    "imageUrl": "https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?w=400&h=240",
    "isPublic": true
  }' > /dev/null
echo "✅ Siba's Durban Chicken Biryani"

# Recipe 8: Nandi's Samoosas
TOKEN=$(curl -s -X POST http://localhost:5000/api/auth/login -H "Content-Type: application/json" -d '{"email":"nandi@tastebase.com","password":"AfricanQueen123"}' | jq -r '.token')
curl -s -X POST http://localhost:5000/api/recipes \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $TOKEN" \
  -d '{
    "title": "Nandi'\''s Crispy Beef Samoosas",
    "description": "Triangular pastries filled with spiced mince - perfect for Ramadan or any time snacking!",
    "ingredients": [
      "1 packet samoosa pur (ready-made pastry sheets)",
      "500g beef mince",
      "1 large onion, finely diced",
      "3 cloves garlic, crushed",
      "2 tsp ginger, grated",
      "2 tsp curry powder",
      "1 tsp cumin",
      "1 tsp coriander powder",
      "1/2 cup frozen peas",
      "Fresh coriander, chopped",
      "2 tbsp flour + 3 tbsp water (for sealing paste)",
      "Oil for deep frying",
      "Salt and pepper"
    ],
    "instructions": [
      "MAKE FILLING: Heat oil, fry onions until soft and golden",
      "Add garlic and ginger, cook for 1 minute",
      "Add mince and break up, cook until browned",
      "Add curry powder, cumin, and coriander, fry for 2 minutes",
      "Add peas and cook until mixture is dry (no liquid)",
      "Season with salt and pepper, add fresh coriander",
      "Let filling cool completely before using",
      "MAKE SEALING PASTE: Mix flour with water to form smooth paste",
      "FOLD SAMOOSAS: Take one samoosa pur strip",
      "Place 1 tablespoon filling at bottom corner",
      "Fold corner over filling to form triangle",
      "Keep folding in triangle shape until you reach the end",
      "Seal the edge with flour paste",
      "Repeat until all filling is used",
      "FRY SAMOOSAS: Heat oil in deep pot to 170°C",
      "Fry samoosas in batches, 3-4 minutes until golden and crispy",
      "Drain on paper towels",
      "Serve hot with chutney or sweet chili sauce"
    ],
    "tags": ["south african", "samoosas", "indian", "snack", "fried"],
    "cookTime": "1 hour",
    "imageUrl": "https://images.unsplash.com/photo-1601050690597-df0568f70950?w=400&h=240",
    "isPublic": true
  }' > /dev/null
echo "✅ Nandi's Crispy Beef Samoosas"

echo ""
echo "🎉 All South African accounts and recipes created!"
echo "🇿🇦 Total: 5 SA personalities with 8 authentic recipes"
