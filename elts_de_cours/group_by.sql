/* ------ Démo avec GROUP BY------*/
CREATE TABLE likes (
    id SERIAL PRIMARY KEY,
    post_id INT, 
    user_id INT
    );

INSERT INTO likes (post_id, user_id) VALUES (1, 36);
INSERT INTO likes (post_id, user_id) VALUES (2, 36);
INSERT INTO likes (post_id, user_id) VALUES (1, 52);
INSERT INTO likes (post_id, user_id) VALUES (1, 5);

SELECT * FROM likes;


SELECT post_id, COUNT (user_id)
FROM likes
GROUP BY post_id
ORDER BY count DESC;

/*=== affiche un tableau indiquant === */

/*- post_id---|--- user_id---|
---  1        |  3           |
     2        |  1           |

*/
