FROM node:9
WORKDIR /usr/src/app
COPY ./package.json ./
RUN npm install 
# Add application code
COPY . .
# Allows port 3000 to be publicly available
EXPOSE 8000
# The command uses nodemon to run the application
CMD ["node", "app.js"]