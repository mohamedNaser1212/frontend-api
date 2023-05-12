FROM node
WORKDIR /appfolder
COPY . /appfolder
RUN npm install express
RUN npm install n-readlines
EXPOSE 3000
CMD ["node", "apidoc.js"]