<html>
<body>
<h1 class="title">Portfolio Website</h1>
<h3 class="why">Powód</h3>
<p class="why">Miałem własną stronę portfolio od Stycznia 2019. Zawsze zawierała ona sekcję, która miała prezentować moje projekty, ale w żadnej z wersji sekcja ta nie została zaimplementowana, była wiecznie "in progress" albo "coming soon". W końcu zdecydowałem, że najprościej będzie bezpośrednio wykorzystać moje repozytoria, automatyzując niejako cały proces tworzenia sekcji z projektami. I w ten sposób narodził się niniejszy projekt.</p>
<h3 class="what">Cel</h3>
<div class="what">Celem było stworzenie strony korzystającej z Dockera i konteneryzacja, używającej jak największej ilości technologii, pasujących do zakresu i celu projektu, by równocześnie nauczyć się jak najwięcej. Tak powstała plikacja korzystająca z:
  <ul>
    <li>Dockera celem konteneryzacji</li>
    <li>Nginx jako reversed proxy oraz proxy cache</li>
    <li>Redis jako backend cache</li>
    <li>AWS EC2 jako serwera</li>
    <li>Circle CI celem automatyzacji deploymentu</li>
  </ul>
  </div>
<h3 class="how">Wykonanie</h3>
<p class="how">Za każdym razem kiedy kod w którymkolwiek z repozytoriów związanych z projektem jest aktualizowany, Circle CI ściąga nowy kod i tworzy nowy obraz Dockera. Obraz jest wysyłany to repozytorium Dockera a następnie Circle CI uruchamia skrypt do deploymentu na serwerze. Serwer pobiera zaktualizowane obrazy, restartuje odpowiednie kontenery, i jeśli aktualizowaniu uległ kontener frontendu lub backendu, cache zarówno Nginx jak i Redis są czyszczone.&nbsp;Kiedy zapytanie dociera do serwera, najpierw trafia do zewnętrznego proxy Nginx, który odpowiada za szyfrowanie (HTTPS). Zapytania są przesyłane dalej do Dockera i trafiają do wewnętrznego proxy Nginx. To proxy jest odpowiedzialne za caching, zarówno plików jak i danych otrzymanych od backendu, oraz routowanie zapytań do odpowiednich kontenerów (backend/frontend), na podstawie URL. Jeśli zapytanie dociera do backendu, sprawdza on najpierw cache redisa. Jeśli żądane dana nie znajdują się w cache, backend wysyła zapytanie do API githuba.&nbsp;W pewnym momencie uświadomiłem sobie, że cache redisa nie jest niezbędne, gdyż w zupełności wystarczyłoby cache dostępne w Ngninx, jako że dane są w zasadzie statyczne. Wciąż, było to całkiem ciekawego doświadczenie i pozwoliło mi nieco poznać Redis.</p>
<h3 class="technologies">Zastosowane technologie</h3>
<ul class="technologies">
  <li class="technologies" hover="Docker">Docker</li>
  <li class="technologies" hover="Nginx">Nginx</li>
  <li class="technologies" hover="Redis">Redis</li>
   <li class="technologies" hover="Amazon Web Services">AWS</li>
   <li class="technologies" hover="Circle CI">Circle CI</li>
   <li class="technologies" hover="Bash">Bash</li>
</ul>
<h3 class="usage">Jak korzystać</h3>
<div class="usage">Aby uruchomić projekt:
 <ol>
   <li>Ściągnij niniejsze repozytorium</li>
   <li>Zainstaluje Dockera</li>
   <li>Do folderu zawierającego plik docker-compose.yml ściągnij repozytoria portfolio-backend oraz portfolio-frontend</li>
   <li>Dodaj niezbędne pozycje w pliku hosts (URL z którego korzystamy to http://frontend.docker)</li>
   <li>Aby uruchomić projekt, użyj komendy <i>docker-compose up</i>.</li>
   <li>Aby uruchomić aplikację w środowisku produkcji, użyj komendy  <i>docker-compose -f docker-compose.prod.yml up</i></li>
 </ol>
  </div>
<hr>
<small class="created">Data powstania: December 2019</small>
</body>
</html>
