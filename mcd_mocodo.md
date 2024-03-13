Format Markdown (md)

:
LIKE, 0N POST, 0N ACCOUNT
ACCOUNT : id, name, first_name, age, password, email, tel, user_name
SUIVRE, 0N ACCOUNT, 0N ACCOUNT: notification

COMMENTER, 0N POST, 01 POST
POST : id, content, account_id, date, parent_post
FAIRE, 0N ACCOUNT, 11 POST
:
:

ATTACHMENT : id, image, document, link, post_id
AVOIR, 11 ATTACHMENT, 0N POST
:
:
:
![mcd](Capture_mcd_brief4.PNG)

