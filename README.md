# React + Vite

# run on docker with nginx

docker build -t react-docker .

docker run -it --rm --name docker-react-1 -p 80:80 react-docker
