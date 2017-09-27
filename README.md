# etherpad-docker

This is more or less the current release (as of writing this file) including a hand full of useful plugins.

 To download the image from the Docker index, run:
 `docker pull toeirei/etherpad-docker`

## Environment Variables:

* ETHERPAD_TITLE= Your etherpad title
* ETHERPAD_ADMIN_PASSWORD= the admin pw
* ETHERPAD_ADMIN_USER= administrative user
* ETHERPAD_DB_USER= database name
* ETHERPAD_DB_HOST= database host (your MySQL container)
* ETHERPAD_DB_PASSWORD= database password

## Plugins installed:
* ep_adminpads 
* ep_authorship_toggle
* ep_countable
* ep_push2delete
* ep_spellcheck
* ep_user_font_size

## Image Size:
* Original 'development' image was was ~788 MB
* Alpine image got down to ~246 MB
