npx create-next-app myspace
cd myspace

rm -rf node_modules # to be secure you could even include a .dockerignore with node_modules to avoid copying!
# or alternatively include a .dockerignore with node_modules in it!

touch Dockerfile # insert specs

# start docker deamon (open docker desktop)

docker build -t myspace .
# myspace is the name tag of the image
# I sometimes got read-only errors, restart, or get more SSD storage on your machine!

# docker run -p 3000:3000 myspace
# didnt work for me, because doesnt do the volume mapping
# also the following command prevents some weird node_module overwrite from the host - during runtime
docker run -p 3000:3000 -v $(pwd):/app -v /app/node_modules myspace
# (it doesnt work in Google Drive sync folders or in folder paths with spaces - the volume mapping and thus the whole container)