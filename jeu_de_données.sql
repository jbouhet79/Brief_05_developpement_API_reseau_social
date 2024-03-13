/* ================================== LES INSERTIONS ================================*/
/* -------------------------------- ajouter un compte -------------------------------*/

INSERT INTO account (name, first_name, age, password, email, tel, user_name) VALUES (:name, :first_name, :age, :password, :email, :tel, :user_name);

/* ----------------------------------- faire un post -------------------------------*/

INSERT INTO post (content, account) VALUES (:content, :account);

/* ---------------------------------- liker un post --------------------------------*/

INSERT INTO "like" (account_id, post_id) VALUES (:account, :post);

/* --------------------- ajout d'une pièce jointe dans un commentaire -------------*/

INSERT INTO attachment (image, document, link, post_id) VALUES (:image, :document, :link, :post_id); 

/* --------------------------------- commenter un post --------------------------- */

INSERT INTO post (content, account, parent_post) VALUES (:content, :account, :parent_post); 

/* ------------------------------- suivre un utilisateur ------------------------- */

INSERT INTO follower (account_id, follower_id) VALUES (:account_id, :follower_id);  


/* -------------------------------- groupe de partage --------------------------- */
/* ------------------------- créer un groupe avec sa visibilité ----------------- */

INSERT INTO "group" (name, description, visibility) VALUES (:name, :description, :visibility);

/* ------------------------ affecter des membres à un groupe --------------------*/
INSERT INTO share (group_id, account_id, role) VALUES (:groupe_id, account_id, : role);




/* ======================= LES INSERTIONS pour les TEST =======================*/

/* -------------------- insérer les utilisateurs ----------------*/

INSERT INTO account (name, first_name, age, password, email, tel, user_name) VALUES 
('Lacroix','Matthieu',25,'Ailu2aes5ah','MatthieuLacroix@teleworm.us','02.68.38.35.04','Coulart1999'),
('Arpin','Brice',34,'shohR2iTae','BriceArpin@gustr.com','01.06.48.38.73','Crent1989'),
('Lafrenière','Pierpont',55,'Boo3Usaey','PierpontLafreniere@cuvox.de','03.92.08.36.25','Warchat'),
('Champagne','Xarles',63,'Gie8amoaph','XarlesChampagne@armyspy.com','05.86.72.02.89','Fouslond'),
('Coupart','Daisi',72,'HephuiN9qu','DaisiCoupart@dayrep.com','05.78.40.17.03','Movenciought'),
('L''Hiver','Marine',23,'MiaPhic2','MarineLHiver@superrito.com','01.81.21.52.27','Whicily'),
('Douffet','Virginie',24,'eoWo8iel','VirginieDouffet@superrito.com','01.21.09.73.92','Knotood'),
('Louis','Brier',71,'Bahzoth2ah','BrierLouis@fleckens.hu','03.90.09.98.81','Haday1953'),
('Pitre','Alfred',73,'Lie2eeloJ6ee','AlfredPitre@gustr.com','04.33.53.87.27','Fould1950'),
('Lécuyer','Édouard',22,'Ohphainoo3','EdouardLecuyer@rhyta.com','01.59.14.73.29','Sarronever');

--SELECT * FROM account;

/* SELECT * FROM account ORDER BY name ASC; ==== Trier dans l'ordre croissant des noms====*/

/* -------------------- insérer des posts ------------------- */

INSERT INTO post (content, account_id, date) VALUES 
('aaaaa aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '3', '01/01/1995 07:02:55'),
('bbbbb bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb', '5', '01/01/1995 07:02:55'),
('ccccc ccccccccccccccccccccccccccccccccccccbc', '3', '02/02/1996 08:02:55'),
('ddddd dddddddddddddddddddddddddddddddddddddd', '1', '03/03/1997 09:02:55'),
('eeeee eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee', '7', '04/04/1998 10:02:55'),
('fffff ffffffffffffffffffffffffffffffffffffff', '3', '05/05/1999 11:02:55'),
('ggggg gggggggggggggggggggggggggggggggggggggg', '6', '06/06/2000 12:02:55'),
('hhhhh hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh', '9', '07/07/2001 13:02:55'),
('iiiii iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii', '8', '08/08/2002 14:02:55');
-- SELECT * FROM post; 

/* -------------------- insérer de like ----------------------*/

INSERT INTO "like" (account_id, post_id) VALUES
(5, 2),
(5, 7),
(3, 2),
(4, 2),
(1, 9),
(2, 7);
--SELECT * FROM "like";


/* ---------------- insertion de commentaire ----------------- */

INSERT INTO post (content, account_id, date, parent_post) VALUES
('AA AAAA', '7', '01/01/2010 08:00:00', 6),
('BB BBBB', '7', '02/02/2010 08:00:00', 2),
('CC CCCC', '1', '03/03/2010 08:00:00', 6),
('DD DDDD', '5', '04/04/2010 08:00:00', 6);
--SELECT * FROM post;


/* ------------ insertion de pièces jointes dans un post ou un commentaire --------- */

INSERT INTO attachment (link, post_id) VALUES ('https://www.meteoconsult.fr/previsions-meteo/bulletin-detaille/ville-12267/previsions-meteo-niort-aujourdhui', '6');
INSERT INTO attachment (document, post_id) VALUES ('C:\Workspaces\Brief_04_Gerer_un_reseau_social\mcd_mocodo.txt', '1');
INSERT INTO attachment (image, post_id) VALUES('C:\Workspaces\Brief_04_Gerer_un_reseau_social\Capture_meteo.PNG', '13'), ('C:\Workspaces\Brief_04_Gerer_un_reseau_social\Capture_velo.PNG', '13');

--SELECT * FROM attachment;
--DELETE FROM attachment WHERE id=3;

/* ------------------------------------- GROUPES ---------------------------------- */
------------------ définition de 2 groupes avec une visibilté 'public' ---------------
INSERT INTO "group" (name, description, visibility) VALUES ('road', 'Sorties du weekend', 'public');
INSERT INTO "group" (name, description, visibility) VALUES ('gravel', 'Parcours', 'public');

------- affectation de 3 mambres dans le groupe 1 et 4 dans le groupe 2 -----------
INSERT INTO share (group_id, account_id, role) VALUES 
(1, 1, 'Super user'),
(1, 3, 'Administrator'),
(1, 5, 'Administrator'),
(2, 1, 'Super user'),
(2, 4, 'Administrator'),
(2, 6, 'Visitor'),
(2, 8, 'Visitor');

--SELECT * FROM "group";
--SELECT * FROM share;


-------------------- afficher les membres du groupe 'road' ---------------------------

SELECT g.name AS Nom_du_groupe, a.name AS Nom, s.role
FROM "group" g
JOIN share s
ON g.id = s.group_id
JOIN account a
ON a.id = s.account_id
WHERE g.name = 'road';

-------------------- afficher les membres du groupe 'gravel' ---------------------------

SELECT g.name AS Nom_du_groupe, a.name AS Nom, s.role
FROM "group" g
JOIN share s
ON g.id = s.group_id
JOIN account a
ON a.id = s.account_id
WHERE g.name = 'gravel';




/*=============================== LES MISES A JOUR =================================*/

----------------------- Mise à jour des rôles dans un groupe -------------------------
------------------ passer le user '3' en visiteur dans le groupe 1   -----------------
UPDATE share SET role = 'Visitor' WHERE account_id = 3 AND  group_id = 1;

-------- passer le user 'Lafrenière' en 'Administrator' dans le groupe 1 -------------
UPDATE share SET role = 'Administrator' 
WHERE account_id IN (SELECT a.id FROM account a WHERE LOWER(a.name) LIKE LOWER('%laf%')) AND group_id = 1;
