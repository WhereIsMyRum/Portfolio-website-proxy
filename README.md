<html>
<body>
<h1 class="title">Portfolio Website</h1>
<h3 class="why">Why</h3>
<p class="why">I had my own portfolio website since January 2019. I always included a section that was supposed to contain my projects, but I never actually implemented it. It was always "in progress" or "coming soon". Finally I decided to make it easy for myself and sort of "automate" the whole process of creating the projects section. That's how this project originated.</p>
<h3 class="what">What</h3>
<div class="what">I wanted the website to utilize containerization and use as many different technologies as I could find suitable, in order to learn as much as possible. This is how an app, that uses:
  <ul>
    <li>Docker for containerization</li>
    <li>Nginx as reversed proxy and cache</li>
    <li>Redis as backend cache</li>
    <li>AWS EC2 as the deployment server</li>
    <li>Circle CI to automatise deployment</li>
  </ul>
was created.
  </div>
<h3 class="how">How</h3>
<p class="how">Once code is pushed to github (from any repo related to the porject), Circle CI pulls the code and builds new docker images. The images are pushed to docker hub and Circle CI triggers a deployment script on the server. The server pulls the updated images, restarts the containers, and if the updated was made to either the frontend or the backend container, both redis and nginx cache is cleared.&nbsp; When a request hits the server, it hits the outer Nginx reversed proxy, which is responsible for encrypting the traffic (HTTPS). Request is forwarded to docker, where it hits another Nginx reversed proxy. This proxy is responsible for caching, both files and data received from the backend API, as well as forwarding the request to either the frontend container or the backend container, based on the URL path. If the request hits the backend, the backend first checks the redis cache to see if the requested data is cached. If it is not, is sends a request to github.&nbsp;At some point I realized that the redis cache is not really necessary, as the data is practically static, and the Nginx cache would suffice. Still, it was a good experience working a bit with Redis.</p>
<h3 class="technologies">Technologies used</h3>
<ul class="technologies">
  <li class="technologies" hover="Docker">Docker</li>
  <li class="technologies" hover="Nginx">Nginx</li>
  <li class="technologies" hover="Redis">Redis</li>
   <li class="technologies" hover="Amazon Web Services">AWS</li>
   <li class="technologies" hover="Circle CI">Circle CI</li>
   <li class="technologies" hover="Bash">Bash</li>
</ul>
<h3 class="usage">How to use</h3>
<div class="usage">To run the project:
 <ol>
   <li>Pull this repo</li>
   <li>Into the folder that contains the docker-compose.yml file, pull portfolio-frontend and portfolio-backend repos</li>
   <li>Add neccessary hosts file entries (the url is http://frontend.docker)</li>
   <li>To run the project, simply type <i>docker-compose up</i> and the containers should start.</li>
   <li>To run the production build, type  <i>docker-compose -f docker-compose.prod.yml up</i></li>
 </ol>
  </div>
<hr>
<small class="created">Created: September 2019</small>
</body>
</html>
