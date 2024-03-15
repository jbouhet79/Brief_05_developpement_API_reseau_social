/* REQUETE 00*/
/* ---------- affichage des données de la page profil d'un nom utilisateur ------------*/
SELECT name, first_name, user_nale FROM account WHERE name = :name;

SELECT name, first_name, user_name FROM account WHERE name = 'Lacroix';


/* ==================================== LES FILTRES =================================*/
/* ---------- trier les posts par date décroissante (du plus récent...) ---------- */
/* REQUETE 4*/
SELECT content, date FROM post ORDER BY date DESC LIMIT 5 OFFSET 0;
--affiche 5 post par page (en sautant 0 post) --> affichage de la page 1
SELECT content, date FROM post ORDER BY date DESC LIMIT 5 OFFSET 5;
--affiche 5 post par page (en sautant 5 posts) --> affichage de la page 2

/* ------------------------------ filtrer les posts par date ----------------------- */
/* REQUETE 4 bis*/
SELECT content, date FROM post WHERE date > '01/01/2000 00:00:00' AND date < '01/01/2002 00:00:00';

/* --------------- filtrer les posts par popularité (le + populaire) -------------- */
/* REQUETE 5*/
SELECT post_id, COUNT (account_id)
FROM "like"
GROUP BY post_id
ORDER BY COUNT DESC;
-->   version avec changement de nom de la colonne 'nombre de likes' ------------------
SELECT post_id, COUNT (account_id) AS nombre_de_likes
FROM "like"
GROUP BY post_id
ORDER BY nombre_de_likes DESC;

------- afficher le contenu des posts les plus populaire (likés) ---------------------

SELECT p.*, COUNT (l.account_id) AS nombre_de_likes
FROM "like" l
JOIN post p
ON p.id = l.post_id
GROUP BY p.id
ORDER BY nombre_de_likes DESC;

/* -------- filtrer les posts et commentaires par auteur (ordre alphabétique) -------- */
/* REQUETE 6*/
SELECT content, a.name 
FROM post p
JOIN account a
ON p.account_id = a.id
ORDER BY a.name ASC;







/* ------------- recherche des comptes par nom ou pseudo de l'auteur ------------------- */
/* REQUETE 7*/

SELECT * FROM account WHERE LOWER(name) LIKE LOWER('%:nom%') OR LOWER(user_name) LIKE LOWER('%:nom%');

----- recherche des comptes contenant 'ou' dans le nom ou le pseudo de l'auteur -----------
SELECT * FROM account WHERE LOWER(name) LIKE LOWER('%ou%') OR LOWER(user_name) LIKE LOWER('%ou%');


/* -------------- filtrer les posts par mots clés dans la publication ------------- */
/* REQUETE 8*/

SELECT * FROM post WHERE content LIKE '%:mot_cle%';
------------ filtrer les posts contenant un 'b' dans la publication -----------------
SELECT * FROM post WHERE content LIKE '%b%';


/* --------------------- afficher les membres d'un groupe ------------------------  */

SELECT g.name AS Nom_du_groupe, a.name AS Nom, g.visibility
FROM "group" g
JOIN share s
ON g.id = s.group_id
JOIN account a
ON a.id = s.account_id
WHERE g.name = :g.name;

/*=============================== LES MISES A JOUR ================================*/
/* ----------- envoyer une notification à un utilisateur lorqu'il est suivi -------*/
/* REQUETE 9*/
UPDATE follower SET notification = true WHERE account_id = :account_id AND follower_id = :follower_id;

/* ---------- permettre à un utilisateur de déactiver ses notifications ----------*/
/* REQUETE 9bis */
UPDATE account SET notification = false; 

/* REQUETE 11 */
UPDATE "group" SET visibility = 'Private' WHERE name = :group_name;
UPDATE "group" SET visibility = 'Public' WHERE name = :group_name;

-- UPDATE "group" SET visibility = 'Private' WHERE name = 'gravel';



----------------------- Mise à jour des rôles dans UN GROUPE -----------------------------
/* REQUETE 13*/
---------------- passer un membre en 'Visitor' dans un groupe de partage   ---------------
UPDATE share SET role = 'Visitor' WHERE account_id = :account_id AND  group_id = :group_id;

------------ passer un membre en 'administrator' dans un groupe de partage   -------------
UPDATE share SET role = 'Administrator' WHERE account_id = :account_id AND  group_id = :group_id;

----- passer le membre dont le nom contient 'Laf' en 'Administrator' dans le groupe ':group_id' ----------
UPDATE share SET role = 'Administrator' 
WHERE account_id IN (SELECT a.id FROM account a WHERE LOWER(a.name) LIKE LOWER('%laf%')) AND group_id = :group_id;

------------------- changer le status (role) d'un membre de groupe -----------------------
UPDATE share SET role = 'Administator' WHERE account_id = :account_id AND  group_id = :group_id;
UPDATE share SET role = 'Visitor' WHERE account_id = :account_id AND  group_id = :group_id;

----------------- passer le user ':nom' en 'Administrator' dans le groupe 1 --------
UPDATE share SET role = 'Administrator' 
WHERE account_id IN (SELECT a.id FROM account a WHERE LOWER(a.name) LIKE LOWER(:nom)) AND group_id = 1;