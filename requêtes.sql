/* ==================================== LES FILTRES =================================*/
/* ---------- filtrer les posts par date décroissante (du plus récent...) ---------- */

SELECT content, date FROM post ORDER BY date DESC;

/* -------- filtrer les posts et commentaires par auteur (ordre alphabétique) -------- */

SELECT content, a.name 
FROM post p
JOIN account a
ON p.account_id = a.id
ORDER BY a.name ASC;

/* --------------- filtrer les posts par popularité (le + populaire) -------------- */
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


/* ------------- recherche des comptes par nom ou pseudo de l'auteur ------------------- */

SELECT * FROM account WHERE LOWER(name) LIKE LOWER('%:nom%') OR LOWER(user_name) LIKE LOWER('%:nom%');

----- recherche des comptes contenant 'ou' dans le nom ou le pseudo de l'auteur -----------
SELECT * FROM account WHERE LOWER(name) LIKE LOWER('%ou%') OR LOWER(user_name) LIKE LOWER('%ou%');


/* -------------- filtrer les posts par mots clés dans la publication ------------- */

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

UPDATE follower SET notification = true WHERE account_id = :account_id AND follower_id = :follower_id;

----------------------- Mise à jour des rôles dans UN GROUPE -----------------------------
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