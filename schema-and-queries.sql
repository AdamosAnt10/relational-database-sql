
CREATE TABLE artists (
    name VARCHAR(100) PRIMARY KEY,
    birth_place VARCHAR(150),
    age INT,
    art_style VARCHAR(100)

);

CREATE TABLE customers (
    name VARCHAR(100) PRIMARY KEY,
    address VARCHAR(200),
    total_spent DECIMAL(12, 2) DEFAULT 0.00

);

CREATE TABLE artworks (
    title VARCHAR(150) PRIMARY KEY,
    artist_name VARCHAR(100) REFERENCES artists(name) ON UPDATE CASCADE ON DELETE SET NULL,
    year INT,
    art_type VARCHAR(100),
    price DECIMAL(12, 2),
    is_sold BOOLEAN DEFAULT FALSE,
    customer_name VARCHAR(100) REFERENCES customers(name) ON UPDATE CASCADE ON DELETE SET NULL

);

CREATE TABLE art_groups (
    group_name VARCHAR(100) PRIMARY KEY

);

CREATE TABLE artwork_group_membership (
    title VARCHAR(150) REFERENCES artworks(title) ON UPDATE CASCADE ON DELETE CASCADE,
    group_name VARCHAR(100) REFERENCES art_groups(group_name) ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (title, group_name)

);

CREATE TABLE customer_artist_preferences (
    customer_name VARCHAR(100) REFERENCES customers(name) ON UPDATE CASCADE ON DELETE CASCADE,
    artist_name VARCHAR(100) REFERENCES artists(name) ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (customer_name, artist_name)

);

CREATE TABLE customer_group_preferences (
    customer_name VARCHAR(100) REFERENCES customers(name) ON UPDATE CASCADE ON DELETE CASCADE,
    group_name VARCHAR(100) REFERENCES art_groups(group_name) ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (customer_name, group_name)

);

INSERT INTO art_groups (group_name) VALUES
('Bande Dessinée (κλασικά ευρωπαϊκά)'),
('Manga (Ιαπωνικά)'),
('Superhero Comics (Αμερικάνικα)'),
('Αυτοεκδόσεις'),
('Εναλλακτικά (ανεξάρτητες παραγωγές)'),
('Πορτρέτα')
ON CONFLICT DO NOTHING;

INSERT INTO artists (name, birth_place, age, art_style) VALUES
('Lorelei Maffione', 'France', 34, 'Bande Dessinée'),
('Eugenio Dullingham', 'Japan', 28, 'Manga'),
('Gamaliel Meighan', 'USA', 45, 'Superhero Comics'),
('Aila Stein', 'Germany', 31, 'Alternative'),
('Rachel Bonas', 'Greece', 29, 'Portraits'),
('Thomasa Conelly', 'UK', 42, 'Self-published'),
('Lorraine Brennans', 'Belgium', 38, 'Bande Dessinée'),
('Carrissa Mottinelli', 'Japan', 25, 'Manga'),
('Shalom Wear', 'USA', 50, 'Superhero Comics'),
('Zaneta Sebley', 'Italy', 33, 'Portraits'),
('Belva Felipe', 'France', 27, 'Alternative'),
('Winston M''Barron', 'Canada', 41, 'Superhero Comics'),
('Nariko Andrat', 'Japan', 36, 'Manga'),
('Catherin Pach', 'Greece', 30, 'Portraits'),
('Kizzie Bearne', 'Spain', 24, 'Self-published'),
('Lorita Kedie', 'UK', 47, 'Alternative'),
('Sissie Click', 'USA', 39, 'Superhero Comics'),
('Rafaellle Zanotti', 'Italy', 52, 'Portraits'),
('Amandy Tabner', 'France', 33, 'Bande Dessinée'),
('Tove Pountain', 'Sweden', 26, 'Alternative'),
('Thomasa Linnane', 'Japan', 32, 'Manga'),
('Baryram Plak', 'USA', 43, 'Superhero Comics'),
('Hunfredo Treppas', 'Germany', 35, 'Alternative'),
('Halette Sanchis', 'Spain', 29, 'Portraits'),
('Kacy Dran', 'Belgium', 48, 'Bande Dessinée'),
('Alain Readwing', 'UK', 37, 'Self-published'),
('Audy Trubshawe', 'USA', 40, 'Superhero Comics'),
('Keene Beveredge', 'Japan', 23, 'Manga'),
('Staffard Loisi', 'Italy', 44, 'Portraits'),
('Lynnea Eayres', 'France', 31, 'Bande Dessinée'),
('Niven Durrett', 'USA', 46, 'Superhero Comics'),
('Flora Sayce', 'Greece', 28, 'Portraits'),
('Joanna Burgum', 'UK', 34, 'Self-published'),
('Artemis Morby', 'Japan', 29, 'Manga'),
('Andrej Chasteau', 'France', 41, 'Bande Dessinée'),
('Gaye Fetherstonhaugh', 'Germany', 33, 'Alternative'),
('Kerwinn Gippes', 'USA', 38, 'Superhero Comics'),
('Donni Broggini', 'Italy', 49, 'Portraits'),
('Linoel Paffot', 'Belgium', 36, 'Bande Dessinée'),
('Arleta Cockson', 'Spain', 27, 'Self-published'),
('Rodrick Fricke', 'USA', 42, 'Superhero Comics'),
('Bryan Corlett', 'Japan', 31, 'Manga'),
('Mitchael Kaines', 'Greece', 45, 'Portraits'),
('Keven Girodin', 'France', 30, 'Alternative'),
('Winonah Petraitis', 'UK', 26, 'Self-published'),
('Donetta Burne', 'USA', 39, 'Superhero Comics'),
('Esmaria Deguara', 'Japan', 35, 'Manga'),
('Lyndy Hollyard', 'Italy', 47, 'Portraits'),
('Page Mullis', 'France', 32, 'Bande Dessinée'),
('Susette Edmans', 'Germany', 28, 'Alternative')
ON CONFLICT DO NOTHING;

INSERT INTO customers (name, address, total_spent) VALUES
('Margarethe Lenormand', '789 Maple St', 12000.00),
('Hana Kerton', '456 Oak Ave', 55000.00),
('Nannie Arrigucci', '123 Main St', 62000.00),
('Alvera Monte', '555 Pine Rd', 8500.00),
('Marget McCulley', '321 Elm St', 105000.00),
('Jesus Cabera', '777 Cedar Ln', 3400.00),
('Fawne Hollingdale', '888 Birch Blvd', 51000.00),
('Guilbert Radleigh', '222 Walnut St', 15000.00),
('Siouxie Mixon', '444 Ash Dr', 73000.00),
('Catrina Tootal', '111 Willow Way', 22000.00),
('Toni Gabler', '999 Poplar Ct', 45000.00),
('Ozzie Bow', '123 Cherry Ln', 9500.00),
('Marthena Mahomet', '456 Beech St', 115000.00),
('Case Asel', '789 Chestnut Dr', 60000.00),
('Inger Delhay', '321 Cypress Ave', 13000.00),
('Raychel O''Moylan', '654 Magnolia Rd', 52000.00),
('Britta Lerego', '987 Redwood Hwy', 4000.00),
('Friederike Pavie', '147 Hickory Ln', 27000.00),
('Colas Lintin', '258 Spruce St', 81000.00),
('Artie Frankham', '369 Alder Dr', 19000.00),
('Boony Jauncey', '741 Hemlock Rd', 64000.00),
('Roanna Karpeev', '852 Larch Ct', 11000.00),
('Manda Allbrook', '963 Linden Blvd', 58000.00),
('Dacia Pichmann', '159 Maple Ave', 32000.00),
('Delaney Klimschak', '753 Oak Blvd', 125000.00),
('Kermy Robjant', '951 Pine St', 48000.00),
('Nyssa Beardwell', '357 Elm Ave', 69000.00),
('Pasquale Louedey', '456 Cedar Dr', 16000.00),
('Almeta St Leger', '789 Birch Ave', 53000.00),
('Ichabod Cathee', '123 Walnut Rd', 2500.00),
('Lolita Drewe', '321 Ash Lane', 74000.00),
('Shelden Fotheringham', '654 Willow Blvd', 43000.00),
('Merrie Gaul', '987 Poplar Rd', 102000.00),
('Theda Rosenvasser', '147 Cherry St', 5500.00),
('Meyer Benois', '258 Beech Ave', 61000.00),
('Torrie MacKnockiter', '369 Chestnut St', 18500.00),
('Aubry Hext', '741 Cypress Dr', 56000.00),
('Ebonee Dredge', '852 Magnolia Lane', 29000.00),
('Hymie Bourges', '963 Redwood St', 77000.00),
('Kingston Strood', '159 Hickory Ave', 14000.00),
('Gertrude Scrimgeour', '753 Spruce Rd', 108000.00),
('Morgana McCall', '951 Alder St', 47000.00),
('Candice Kingsley', '357 Hemlock Ave', 59000.00),
('Barrie Ca', '456 Larch Lane', 21000.00),
('Myrta Burnet', '789 Linden Dr', 83000.00),
('Megen Peinke', '123 Boxwood St', 5000.00),
('Kaitlynn Botwright', '321 Camellia Rd', 66000.00),
('Reginauld Smorthwaite', '654 Dogwood Ln', 31000.00),
('Robbert Trevor', '987 Holly St', 135000.00),
('Emera Lightning', '147 Ivy Ave', 49000.00)
ON CONFLICT DO NOTHING;

INSERT INTO artworks (title, artist_name, year, art_type, price, is_sold, customer_name) VALUES
('The European Lines', 'Lorelei Maffione', 2024, 'comics', 1500.00, TRUE, 'Nannie Arrigucci'),
('Neo Tokyo Sunrise', 'Eugenio Dullingham', 2025, 'animation', 4500.00, TRUE, 'Hana Kerton'),
('Metropolis Defender', 'Gamaliel Meighan', 2023, 'graphic novel', 3200.00, TRUE, 'Marget McCulley'),
('Shadows of Berlin', 'Aila Stein', 2026, 'εικονογράφηση', 1200.00, FALSE, NULL),
('Elegance in Charcoal', 'Rachel Bonas', 2025, 'εικονογράφηση', 800.00, TRUE, 'Fawne Hollingdale'),
('Zine Revolution', 'Thomasa Conelly', 2024, 'comics', 450.00, FALSE, NULL),
('Brussels Midnight', 'Lorraine Brennans', 2023, 'comics', 2200.00, TRUE, 'Marthena Mahomet'),
('Chibi Adventures', 'Carrissa Mottinelli', 2026, 'animation', 1100.00, TRUE, 'Siouxie Mixon'),
('Golden Age Hero', 'Shalom Wear', 2022, 'graphic novel', 5000.00, TRUE, 'Delaney Klimschak'),
('Venice Reflection', 'Zaneta Sebley', 2024, 'εικονογράφηση', 1900.00, TRUE, 'Merrie Gaul'),
('Parisian Underground', 'Belva Felipe', 2025, 'comics', 1350.00, FALSE, NULL),
('Caped Crusader Echo', 'Winston M''Barron', 2023, 'graphic novel', 2800.00, TRUE, 'Gertrude Scrimgeour'),
('Kyoto Ghost Story', 'Nariko Andrat', 2024, 'manga', 3100.00, TRUE, 'Robbert Trevor'),
('The Greek Face', 'Catherin Pach', 2025, 'εικονογράφηση', 950.00, FALSE, NULL),
('Independent Thoughts', 'Kizzie Bearne', 2026, 'comics', 600.00, FALSE, NULL),
('Abstract Freedom', 'Lorita Kedie', 2023, 'εικονογράφηση', 1600.00, FALSE, NULL),
('Dark Knight Legacy', 'Sissie Click', 2024, 'graphic novel', 4200.00, TRUE, 'Colas Lintin'),
('Florentine Eyes', 'Rafaellle Zanotti', 2022, 'εικονογράφηση', 2500.00, TRUE, 'Raychel O''Moylan'),
('Louvre Shadows', 'Amandy Tabner', 2025, 'comics', 1750.00, TRUE, 'Hymie Bourges'),
('Nordic Silence', 'Tove Pountain', 2024, 'εικονογράφηση', 1400.00, FALSE, NULL),
('Shibuya Neon', 'Thomasa Linnane', 2026, 'manga', 2900.00, TRUE, 'Boony Jauncey'),
('Cosmic Justice', 'Baryram Plak', 2023, 'graphic novel', 3600.00, TRUE, 'Myrta Burnet'),
('Berlin Wall Tales', 'Hunfredo Treppas', 2025, 'comics', 1150.00, FALSE, NULL),
('Madrid Smile', 'Halette Sanchis', 2024, 'εικονογράφηση', 1050.00, FALSE, NULL),
('Antwerp Classic', 'Kacy Dran', 2022, 'comics', 2100.00, TRUE, 'Almeta St Leger'),
('My Own Universe', 'Alain Readwing', 2026, 'comics', 500.00, FALSE, NULL),
('Avengers Pride', 'Audy Trubshawe', 2024, 'graphic novel', 4800.00, TRUE, 'Manda Allbrook'),
('Mecha Pilot Core', 'Keene Beveredge', 2025, 'manga', 3400.00, TRUE, 'Kaitlynn Botwright'),
('Roman Silhouette', 'Staffard Loisi', 2023, 'εικονογράφηση', 2000.00, FALSE, NULL),
('Rhone Romance', 'Lynnea Eayres', 2025, 'comics', 1650.00, TRUE, 'Candice Kingsley'),
('Justice League Dawn', 'Niven Durrett', 2024, 'graphic novel', 4600.00, TRUE, 'Aubry Hext'),
('Athens Profile', 'Flora Sayce', 2026, 'εικονογράφηση', 1250.00, FALSE, NULL),
('Self Made World', 'Joanna Burgum', 2023, 'comics', 700.00, FALSE, NULL),
('Akihabara Dreams', 'Artemis Morby', 2025, 'manga', 2750.00, TRUE, 'Case Asel'),
('Strasbourg Tales', 'Andrej Chasteau', 2024, 'comics', 1950.00, TRUE, 'Fawne Hollingdale'),
('Subversive Lines', 'Gaye Fetherstonhaugh', 2026, 'εικονογράφηση', 1300.00, FALSE, NULL),
('Vigilante Wrath', 'Kerwinn Gippes', 2023, 'graphic novel', 3900.00, TRUE, 'Lolita Drewe'),
('Tuscan Sun', 'Donni Broggini', 2025, 'εικονογράφηση', 2200.00, FALSE, NULL),
('Ghent Chronicles', 'Linoel Paffot', 2024, 'comics', 1800.00, TRUE, 'Emera Lightning'),
('DIY Fantasy', 'Arleta Cockson', 2025, 'comics', 550.00, FALSE, NULL),
('Thunder God Strike', 'Rodrick Fricke', 2023, 'graphic novel', 5200.00, TRUE, 'Nyssa Beardwell'),
('Samurai Edge', 'Bryan Corlett', 2026, 'manga', 3300.00, TRUE, 'Nannie Arrigucci'),
('The Classic Look', 'Mitchael Kaines', 2024, 'εικονογράφηση', 2400.00, FALSE, NULL),
('Avignon Winds', 'Keven Girodin', 2025, 'εικονογράφηση', 1100.00, FALSE, NULL),
('Fanzine Dreams', 'Winonah Petraitis', 2024, 'comics', 400.00, FALSE, NULL),
('Web Slinger New York', 'Donetta Burne', 2023, 'graphic novel', 4100.00, TRUE, 'Shelden Fotheringham'),
('Cyberpunk Osaka', 'Esmaria Deguara', 2026, 'manga', 3500.00, TRUE, 'Hana Kerton'),
('Milano Style', 'Lyndy Hollyard', 2024, 'εικονογράφηση', 2150.00, FALSE, NULL),
('Normandy Coast', 'Page Mullis', 2025, 'comics', 1600.00, TRUE, 'Marget McCulley'),
('Munich Conceptual', 'Susette Edmans', 2024, 'εικονογράφηση', 1450.00, FALSE, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO artwork_group_membership (title, group_name) VALUES
('The European Lines', 'Bande Dessinée (κλασικά ευρωπαϊκά)'),
('Neo Tokyo Sunrise', 'Manga (Ιαπωνικά)'),
('Metropolis Defender', 'Superhero Comics (Αμερικάνικα)'),
('Shadows of Berlin', 'Εναλλακτικά (ανεξάρτητες παραγωγές)'),
('Elegance in Charcoal', 'Πορτρέτα'),
('Zine Revolution', 'Αυτοεκδόσεις'),
('Brussels Midnight', 'Bande Dessinée (κλασικά ευρωπαϊκά)'),
('Chibi Adventures', 'Manga (Ιαπωνικά)'),
('Golden Age Hero', 'Superhero Comics (Αμερικάνικα)'),
('Venice Reflection', 'Πορτρέτα'),
('Parisian Underground', 'Εναλλακτικά (ανεξάρτητες παραγωγές)'),
('Caped Crusader Echo', 'Superhero Comics (Αμερικάνικα)'),
('Kyoto Ghost Story', 'Manga (Ιαπωνικά)'),
('The Greek Face', 'Πορτρέτα'),
('Independent Thoughts', 'Αυτοεκδόσεις'),
('Abstract Freedom', 'Εναλλακτικά (ανεξάρτητες παραγωγές)'),
('Dark Knight Legacy', 'Superhero Comics (Αμερικάνικα)'),
('Florentine Eyes', 'Πορτρέτα'),
('Louvre Shadows', 'Bande Dessinée (κλασικά ευρωπαϊκά)'),
('Nordic Silence', 'Εναλλακτικά (ανεξάρτητες παραγωγές)'),
('Shibuya Neon', 'Manga (Ιαπωνικά)'),
('Cosmic Justice', 'Superhero Comics (Αμερικάνικα)'),
('Berlin Wall Tales', 'Εναλλακτικά (ανεξάρτητες παραγωγές)'),
('Madrid Smile', 'Πορτρέτα'),
('Antwerp Classic', 'Bande Dessinée (κλασικά ευρωπαϊκά)'),
('My Own Universe', 'Αυτοεκδόσεις'),
('Avengers Pride', 'Superhero Comics (Αμερικάνικα)'),
('Mecha Pilot Core', 'Manga (Ιαπωνικά)'),
('Roman Silhouette', 'Πορτρέτα'),
('Rhone Romance', 'Bande Dessinée (κλασικά ευρωπαϊκά)'),
('Justice League Dawn', 'Superhero Comics (Αμερικάνικα)'),
('Athens Profile', 'Πορτρέτα'),
('Self Made World', 'Αυτοεκδόσεις'),
('Akihabara Dreams', 'Manga (Ιαπωνικά)'),
('Strasbourg Tales', 'Bande Dessinée (κλασικά ευρωπαϊκά)'),
('Subversive Lines', 'Εναλλακτικά (ανεξάρτητες παραγωγές)'),
('Vigilante Wrath', 'Superhero Comics (Αμερικάνικα)'),
('Tuscan Sun', 'Πορτρέτα'),
('Ghent Chronicles', 'Bande Dessinée (κλασικά ευρωπαϊκά)'),
('DIY Fantasy', 'Αυτοεκδόσεις'),
('Thunder God Strike', 'Superhero Comics (Αμερικάνικα)'),
('Samurai Edge', 'Manga (Ιαπωνικά)'),
('The Classic Look', 'Πορτρέτα'),
('Avignon Winds', 'Εναλλακτικά (ανεξάρτητες παραγωγές)'),
('Fanzine Dreams', 'Αυτοεκδόσεις'),
('Web Slinger New York', 'Superhero Comics (Αμερικάνικα)'),
('Cyberpunk Osaka', 'Manga (Ιαπωνικά)'),
('Milano Style', 'Πορτρέτα'),
('Normandy Coast', 'Bande Dessinée (κλασικά ευρωπαϊκά)'),
('Munich Conceptual', 'Εναλλακτικά (ανεξάρτητες παραγωγές)')
ON CONFLICT DO NOTHING;

INSERT INTO customer_artist_preferences (customer_name, artist_name) VALUES
('Margarethe Lenormand', 'Lorelei Maffione'),
('Hana Kerton', 'Eugenio Dullingham'),
('Nannie Arrigucci', 'Bryan Corlett'),
('Alvera Monte', 'Aila Stein'),
('Marget McCulley', 'Gamaliel Meighan'),
('Jesus Cabera', 'Rachel Bonas'),
('Fawne Hollingdale', 'Andrej Chasteau'),
('Guilbert Radleigh', 'Shalom Wear'),
('Siouxie Mixon', 'Carrissa Mottinelli'),
('Catrina Tootal', 'Thomasa Conelly'),
('Toni Gabler', 'Belva Felipe'),
('Ozzie Bow', 'Zaneta Sebley'),
('Marthena Mahomet', 'Lorraine Brennans'),
('Case Asel', 'Artemis Morby'),
('Inger Delhay', 'Winston M''Barron'),
('Raychel O''Moylan', 'Rafaellle Zanotti'),
('Britta Lerego', 'Lorita Kedie'),
('Friederike Pavie', 'Catherin Pach'),
('Colas Lintin', 'Sissie Click'),
('Artie Frankham', 'Nariko Andrat'),
('Boony Jauncey', 'Thomasa Linnane'),
('Roanna Karpeev', 'Kizzie Bearne'),
('Manda Allbrook', 'Audy Trubshawe'),
('Dacia Pichmann', 'Halette Sanchis'),
('Delaney Klimschak', 'Shalom Wear'),
('Kermy Robjant', 'Keene Beveredge'),
('Nyssa Beardwell', 'Rodrick Fricke'),
('Pasquale Louedey', 'Alain Readwing'),
('Almeta St Leger', 'Kacy Dran'),
('Ichabod Cathee', 'Staffard Loisi'),
('Lolita Drewe', 'Kerwinn Gippes'),
('Shelden Fotheringham', 'Donetta Burne'),
('Merrie Gaul', 'Zaneta Sebley'), 
('Theda Rosenvasser', 'Joanna Burgum'),
('Meyer Benois', 'Tove Pountain'),
('Torrie MacKnockiter', 'Flora Sayce'),
('Aubry Hext', 'Niven Durrett'),
('Ebonee Dredge', 'Esmaria Deguara'),
('Hymie Bourges', 'Amandy Tabner'),
('Kingston Strood', 'Winonah Petraitis'),
('Gertrude Scrimgeour', 'Winston M''Barron'),
('Morgana McCall', 'Mitchael Kaines'),
('Candice Kingsley', 'Lynnea Eayres'),
('Barrie Ca', 'Baryram Plak'),
('Myrta Burnet', 'Baryram Plak'),
('Megen Peinke', 'Arleta Cockson'),
('Kaitlynn Botwright', 'Keene Beveredge'),
('Reginauld Smorthwaite', 'Donni Broggini'),
('Robbert Trevor', 'Nariko Andrat'),
('Emera Lightning', 'Linoel Paffot')
ON CONFLICT DO NOTHING;

-- 7. ΓΕΜΙΣΜΑ ΠΙΝΑΚΑ: customer_group_preferences
INSERT INTO customer_group_preferences (customer_name, group_name) VALUES
('Margarethe Lenormand', 'Bande Dessinée (κλασικά ευρωπαϊκά)'),
('Hana Kerton', 'Manga (Ιαπωνικά)'),
('Nannie Arrigucci', 'Superhero Comics (Αμερικάνικα)'),
('Alvera Monte', 'Αυτοεκδόσεις'),
('Marget McCulley', 'Εναλλακτικά (ανεξάρτητες παραγωγές)'),
('Jesus Cabera', 'Πορτρέτα'),
('Fawne Hollingdale', 'Bande Dessinée (κλασικά ευρωπαϊκά)'),
('Guilbert Radleigh', 'Manga (Ιαπωνικά)'),
('Siouxie Mixon', 'Superhero Comics (Αμερικάνικα)'),
('Catrina Tootal', 'Αυτοεκδόσεις'),
('Toni Gabler', 'Εναλλακτικά (ανεξάρτητες παραγωγές)'),
('Ozzie Bow', 'Πορτρέτα'),
('Marthena Mahomet', 'Bande Dessinée (κλασικά ευρωπαϊκά)'),
('Case Asel', 'Manga (Ιαπωνικά)'),
('Inger Delhay', 'Superhero Comics (Αμερικάνικα)'),
('Raychel O''Moylan', 'Αυτοεκδόσεις'),
('Britta Lerego', 'Εναλλακτικά (ανεξάρτητες παραγωγές)'),
('Friederike Pavie', 'Πορτρέτα'),
('Colas Lintin', 'Bande Dessinée (κλασικά ευρωπαϊκά)'),
('Artie Frankham', 'Manga (Ιαπωνικά)'),
('Boony Jauncey', 'Superhero Comics (Αμερικάνικα)'),
('Roanna Karpeev', 'Αυτοεκδόσεις'),
('Manda Allbrook', 'Εναλλακτικά (ανεξάρτητες παραγωγές)'),
('Dacia Pichmann', 'Πορτρέτα'),
('Delaney Klimschak', 'Bande Dessinée (κλασικά ευρωπαϊκά)'),
('Kermy Robjant', 'Manga (Ιαπωνικά)'),
('Nyssa Beardwell', 'Superhero Comics (Αμερικάνικα)'),
('Pasquale Louedey', 'Αυτοεκδόσεις'),
('Almeta St Leger', 'Εναλλακτικά (ανεξάρτητες παραγωγές)'),
('Ichabod Cathee', 'Πορτρέτα'),
('Lolita Drewe', 'Bande Dessinée (κλασικά ευρωπαϊκά)'),
('Shelden Fotheringham', 'Manga (Ιαπωνικά)'),
('Merrie Gaul', 'Superhero Comics (Αμερικάνικα)'),
('Theda Rosenvasser', 'Αυτοεκδόσεις'),
('Meyer Benois', 'Εναλλακτικά (ανεξάρτητες παραγωγές)'),
('Torrie MacKnockiter', 'Πορτρέτα'),
('Aubry Hext', 'Bande Dessinée (κλασικά ευρωπαϊκά)'),
('Ebonee Dredge', 'Manga (Ιαπωνικά)'),
('Hymie Bourges', 'Superhero Comics (Αμερικάνικα)'),
('Kingston Strood', 'Αυτοεκδόσεις'),
('Gertrude Scrimgeour', 'Εναλλακτικά (ανεξάρτητες παραγωγές)'),
('Morgana McCall', 'Πορτρέτα'),
('Candice Kingsley', 'Bande Dessinée (κλασικά ευρωπαϊκά)'),
('Barrie Ca', 'Manga (Ιαπωνικά)'),
('Myrta Burnet', 'Superhero Comics (Αμερικάνικα)'),
('Megen Peinke', 'Αυτοεκδόσεις'),
('Kaitlynn Botwright', 'Εναλλακτικά (ανεξάρτητες παραγωγές)'),
('Reginauld Smorthwaite', 'Πορτρέτα'),
('Robbert Trevor', 'Bande Dessinée (κλασικά ευρωπαϊκά)'),
('Emera Lightning', 'Manga (Ιαπωνικά)');

--2a--

SELECT c.name
FROM customers c
JOIN customer_group_preferences cgp ON c.name = cgp.customer_name
WHERE c.total_spent > 50000 
  AND cgp.group_name ILIKE '%manga%';

--2b--

SELECT artist_name, art_type, AVG(price)
FROM artworks a1
GROUP BY artist_name, art_type
HAVING AVG(price) > (
    SELECT AVG(price) 
    FROM artworks a2 
    WHERE a2.art_type = a1.art_type
);

--c--

SELECT ag.group_name
FROM art_groups ag
LEFT JOIN artwork_group_membership agm ON ag.group_name = agm.group_name
WHERE agm.group_name IS NULL
  AND ag.group_name IN (
    SELECT agm2.group_name
    FROM artwork_group_membership agm2
    JOIN artworks a2 ON agm2.title = a2.title
    JOIN customer_artist_preferences cap ON a2.artist_name = cap.artist_name
    GROUP BY agm2.group_name, a2.artist_name
    HAVING COUNT(cap.customer_name) > 10
  );


--d--

SELECT a.artist_name
FROM artworks a
JOIN artwork_group_membership agm ON a.title = agm.title
GROUP BY a.artist_name
HAVING COUNT(DISTINCT a.art_type) >= 3
   AND COUNT(CASE WHEN agm.group_name ILIKE '%manga%' THEN 1 END) >= 1;

--e--

SELECT c.name, c.total_spent, COUNT(cpg.group_name) AS liked_groups_count
FROM customers c
LEFT JOIN customer_group_preferences cpg ON c.name = cpg.customer_name
WHERE c.name NOT IN (
    SELECT DISTINCT customer_name
    FROM customer_artist_preferences
)
AND c.total_spent >= (
    SELECT PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY total_spent)
    FROM customers
)
GROUP BY c.name, c.total_spent
ORDER BY c.total_spent DESC;


--3--
CREATE TABLE sponsors_log (
    id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100),
    message VARCHAR(50),
    log_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE FUNCTION update_customer_spending()
RETURNS TRIGGER AS $$
DECLARE 
    current_total DECIMAL(12, 2);
BEGIN
    UPDATE customers
    SET total_spent = total_spent + NEW.price
    WHERE name = NEW.customer_name;
    SELECT total_spent INTO current_total 
    FROM customers 
    WHERE name = NEW.customer_name;

    IF current_total > 100000 THEN
        INSERT INTO sponsors_log (customer_name, message)
        VALUES (NEW.customer_name, 'Βαθμός 10')
        ON CONFLICT DO NOTHING;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS hierarchy_spending_trigger ON artworks;

CREATE TRIGGER hierarchy_spending_trigger
AFTER UPDATE OF customer_name ON artworks
FOR EACH ROW
WHEN (NEW.customer_name IS NOT NULL AND OLD.customer_name IS NULL)
EXECUTE FUNCTION update_customer_spending();

UPDATE artworks 
SET customer_name = 'Marget McCulley', is_sold = TRUE 
WHERE title = 'Shadows of Berlin';

SELECT * FROM sponsors_log;

CREATE OR REPLACE PROCEDURE generate_auction_invitations()
AS $$
DECLARE
    customer_cursor CURSOR FOR 
        SELECT name FROM customers WHERE total_spent > 20000;
    r_customer RECORD;
    r_artwork RECORD;
    artwork_count INT;
BEGIN
    OPEN customer_cursor;

    LOOP
        FETCH customer_cursor INTO r_customer;
        EXIT WHEN NOT FOUND;
        
        artwork_count := 0; 
        
        FOR r_artwork IN 
            SELECT a.title, a.price, a.artist_name
            FROM artworks a
            JOIN customer_artist_preferences cap ON a.artist_name = cap.artist_name
            WHERE cap.customer_name = r_customer.name
              AND a.is_sold = FALSE
        LOOP
            RAISE NOTICE 'Αγαπητέ %, ο καλλιτέχνης % που αγαπάτε έχει ένα διαθέσιμο έργο με τίτλο [%] στην τιμή των % €.', 
                r_customer.name, r_artwork.artist_name, r_artwork.title, r_artwork.price;
                
            artwork_count := artwork_count + 1;
            IF artwork_count >= 3 THEN
                EXIT; 
            END IF;
        END LOOP;
        
    END LOOP;
    
    CLOSE customer_cursor;
END;
$$ LANGUAGE plpgsql;

CALL generate_auction_invitations();