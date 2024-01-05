FROM node:16 AS builder

WORKDIR /myapp

EXPOSE 3000
EXPOSE 5173

# RUN npm i vite --save-dev
RUN npm i -g vite 

COPY package.json .

RUN npm i --no-audit

COPY . .

ARG CONFIG=develop
# RUN npm run build -- --configuration=$CONFIG
# CMD ["npm", "run", "dev", "--host", "0.0.0.0"]
# CMD ["vite", "--host", "0.0.0.0"]

ARG CONFIG=develop
# RUN npm run build -- --configuration=$CONFIG
RUN npm run build 

####################

FROM nginx

RUN mkdir -p /run/nginx

# COPY --from=builder /myapp/dist/apps/art-catalogue /usr/share/nginx/html
COPY --from=builder /myapp/dist /usr/share/nginx/html

# COPY --from=builder /myapp/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

