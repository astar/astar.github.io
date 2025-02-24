#!/bin/bash
# Tento skript vytvoří adresářovou strukturu a naplní soubory kódem dle vašeho zadání.

# Vytvoření adresářové struktury
mkdir -p my-website/projects

# Vytvoření souboru index.html
cat << 'EOF' > my-website/index.html
<!DOCTYPE html>
<html lang="cs">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title id="titleHeader">Moje Osobní Stránky</title>
  <link rel="stylesheet" href="style.css">
  <!-- Google Font pro ručně psaný vzhled (xkcd inspirováno) -->
  <link href="https://fonts.googleapis.com/css2?family=Comic+Neue&display=swap" rel="stylesheet">
</head>
<body>
  <header>
    <h1 id="titleHeader">Moje Osobní Stránky</h1>
    <nav>
      <ul>
        <li><a href="#about" id="navAbout">O mně</a></li>
        <li><a href="#mindmap" id="navMindmap">Mind Map</a></li>
        <li><a href="#projects" id="navProjects">Projekty</a></li>
        <li><a href="#calendar" id="navCalendar">Kalendář</a></li>
        <li><a href="#support" id="navSupport">Podpoř mě</a></li>
      </ul>
    </nav>
    <div id="langSwitch">
      <button onclick="setLanguage('cs')">Česky</button>
      <button onclick="setLanguage('en')">English</button>
    </div>
  </header>

  <!-- Sekce O mně s tlačítkem pro rozbalení/zbalení -->
  <section id="about">
    <h2 id="aboutHeading">O mně</h2>
    <button id="toggleAboutBtn">Rozbalit O mně</button>
    <div id="aboutContent" class="hidden">
      <p id="aboutText">Tady najdete moje video a odkazy na sociální sítě:</p>
      <div class="video">
        <!-- Vzorové vložení videa – nahraďte vlastním obsahem -->
        <iframe width="300" height="169" src="https://www.youtube.com/embed/dQw4w9WgXcQ" frameborder="0" allowfullscreen></iframe>
      </div>
      <ul class="social-links">
        <li><a href="https://facebook.com/yourprofile" target="_blank">Facebook</a></li>
        <li><a href="https://twitter.com/yourprofile" target="_blank">Twitter</a></li>
        <li><a href="https://linkedin.com/in/yourprofile" target="_blank">LinkedIn</a></li>
        <li><a href="https://instagram.com/yourprofile" target="_blank">Instagram</a></li>
      </ul>
    </div>
  </section>

  <section id="mindmap">
    <h2 id="mindmapHeading">Můj Mind Map Design</h2>
    <div id="mindmapContainer">
      <!-- Dynamicky vykreslená mind mapa s ručně kresleným dojmem -->
    </div>
  </section>

  <section id="projects">
    <h2 id="projectsHeading">Projekty</h2>
    <div id="projectsContainer">
      <!-- Projekty se dynamicky načítají -->
    </div>
  </section>

  <section id="calendar">
    <h2 id="calendarHeading">Kalendář</h2>
    <div id="calendarContainer">
      <!-- Kalendář bude generován dynamicky -->
    </div>
  </section>

  <!-- Nová sekce Podpoř mě -->
  <section id="support">
    <h2 id="supportHeading">Podpoř mě</h2>
    <div class="qr-code">
      <p id="supportQrDesc">Naskenuj QR kód pro podporu.</p>
      <img id="supportQr" src="" alt="QR Code for Support">
    </div>
    <div class="supported-projects">
      <h3 id="supportListHeading">Projekty, které podporuji</h3>
      <ul id="supportedProjectsList">
        <!-- Dynamicky načtené podporované projekty -->
      </ul>
    </div>
  </section>

  <footer>
    <p>&copy; 2025 Moje Jméno. Všechna práva vyhrazena. <em>(Přímo a s trochou xkcd humoru!)</em></p>
  </footer>

  <script src="script.js"></script>
</body>
</html>
EOF

# Vytvoření souboru style.css
cat << 'EOF' > my-website/style.css
/* Základní styl inspirovaný xkcd – jednoduchý, ručně psaný vzhled */
body {
  font-family: 'Comic Neue', cursive, sans-serif;
  margin: 2em;
  background-color: #fefefe;
  color: #333;
  line-height: 1.6;
}

header, footer {
  text-align: center;
  margin-bottom: 2em;
}

nav ul {
  list-style: none;
  padding: 0;
  display: inline-flex;
}

nav li {
  margin: 0 1em;
}

#langSwitch {
  margin-top: 1em;
}

#langSwitch button {
  margin: 0 0.5em;
  padding: 0.4em 0.8em;
  background-color: #fff;
  border: 2px dashed #aaa;
  cursor: pointer;
  box-shadow: 3px 3px 0 #bbb;
}

section {
  margin-bottom: 3em;
}

/* Sekce O mně */
#about {
  background-color: #fff9e6;
  padding: 1em;
  border: 2px dashed #999;
  box-shadow: 3px 3px 0 #ccc;
}

.hidden {
  display: none;
}

#toggleAboutBtn {
  margin: 1em 0;
  padding: 0.5em 1em;
  background-color: #fff;
  border: 2px dashed #aaa;
  cursor: pointer;
  box-shadow: 3px 3px 0 #bbb;
}

/* Mind map container */
#mindmapContainer {
  position: relative;
  height: 300px;
  padding: 1em;
  background-color: #fff9e6;
  border: 2px dashed #999;
  box-shadow: 3px 3px 0 #ccc;
}

.mindmap-node {
  background: #fdfdfd;
  padding: 0.5em 1em;
  border: 2px solid #666;
  border-radius: 5px;
  display: inline-block;
  margin: 0.5em;
  cursor: pointer;
  box-shadow: 3px 3px 0 #ccc;
}

/* Projekty */
#projectsContainer {
  display: flex;
  flex-wrap: wrap;
  gap: 1em;
}

.project {
  background: #fff;
  border: 2px dashed #aaa;
  padding: 1em;
  flex: 1 1 300px;
  box-shadow: 3px 3px 0 #bbb;
}

/* Kalendář */
#calendarContainer {
  background: #fff;
  padding: 1em;
  border: 2px dashed #aaa;
  box-shadow: 3px 3px 0 #bbb;
}

/* Podpoř mě – QR kód a seznam podporovaných projektů */
#support {
  background-color: #e6f7ff;
  padding: 1em;
  border: 2px dashed #999;
  box-shadow: 3px 3px 0 #ccc;
}

.qr-code {
  text-align: center;
  margin-bottom: 1em;
}

.qr-code img {
  width: 150px;
  height: 150px;
}

.supported-projects {
  text-align: left;
}

.supported-projects ul {
  list-style: none;
  padding: 0;
}

.supported-projects li {
  margin-bottom: 0.5em;
}

/* Styl pro seznam sociálních sítí */
.social-links {
  list-style: none;
  padding: 0;
}

.social-links li {
  display: inline;
  margin-right: 1em;
}
EOF

# Vytvoření souboru script.js
cat << 'EOF' > my-website/script.js
// Globální proměnné pro konfiguraci a jazyk
let config = {};
let currentLanguage = 'cs';

// Definice překladů
const translations = {
  cs: {
    title: "Moje Osobní Stránky",
    nav_about: "O mně",
    nav_mindmap: "Mind Map",
    nav_projects: "Projekty",
    nav_calendar: "Kalendář",
    nav_support: "Podpoř mě",
    about_heading: "O mně",
    about_toggle_expand: "Rozbalit O mně",
    about_toggle_collapse: "Zabalit O mně",
    about_text: "Tady najdete moje video a odkazy na sociální sítě:",
    mindmap_heading: "Můj Mind Map Design",
    projects_heading: "Projekty",
    calendar_heading: "Kalendář",
    calendar_event: "Předvádění v sauně",
    today_date: "Dnešní datum:",
    next_event: "Další událost:",
    event_detail: "Detail události",
    support_heading: "Podpoř mě",
    support_qr_desc: "Naskenuj QR kód pro podporu.",
    support_list_heading: "Projekty, které podporuji"
  },
  en: {
    title: "My Personal Website",
    nav_about: "About Me",
    nav_mindmap: "Mind Map",
    nav_projects: "Projects",
    nav_calendar: "Calendar",
    nav_support: "Support Me",
    about_heading: "About Me",
    about_toggle_expand: "Expand About Me",
    about_toggle_collapse: "Collapse About Me",
    about_text: "Here you'll find my video and links to social networks:",
    mindmap_heading: "My Mind Map Design",
    projects_heading: "Projects",
    calendar_heading: "Calendar",
    calendar_event: "Sauna Demo",
    today_date: "Today's date:",
    next_event: "Next event:",
    event_detail: "Event Details",
    support_heading: "Support Me",
    support_qr_desc: "Scan the QR code to support me.",
    support_list_heading: "Projects I Support"
  }
};

document.addEventListener("DOMContentLoaded", function() {
  fetch('config.json')
    .then(response => response.json())
    .then(data => {
      config = data;
      initializeSite();
    })
    .catch(err => console.error("Chyba při načítání config.json:", err));
});

function initializeSite() {
  loadProjects();
  initMindMap();
  initCalendar();
  loadYouTubeData(); // Načte data pro YouTube kanály
  loadSupportSection();
  initAboutToggle();
  updateTranslations();
}

function loadProjects() {
  fetch('projects/projects.json')
    .then(response => response.json())
    .then(projects => {
      const container = document.getElementById('projectsContainer');
      projects.forEach(project => {
        const projectElem = document.createElement('div');
        projectElem.className = 'project';
        projectElem.innerHTML = `
          <h3>${project.name}</h3>
          <p>${project.description}</p>
          ${project.link ? `<a href="${project.link}" target="_blank">Více informací</a>` : ''}
        `;
        container.appendChild(projectElem);
      });
    })
    .catch(err => console.error("Chyba při načítání projektů:", err));
}

function initMindMap() {
  const container = document.getElementById('mindmapContainer');
  const nodes = ["Osobní info", "Projekty", "Kalendář", "Kontakt", "Blog"];
  nodes.forEach(text => {
    const node = document.createElement('div');
    node.className = 'mindmap-node';
    node.textContent = text;
    node.style.position = 'absolute';
    node.style.left = Math.random() * (container.offsetWidth - 100) + 'px';
    node.style.top = Math.random() * (container.offsetHeight - 50) + 'px';
    container.appendChild(node);
  });
}

function initCalendar() {
  const container = document.getElementById('calendarContainer');
  const eventDate = new Date(config.saunaEventDate || '2025-06-01');
  const today = new Date();
  container.innerHTML = `
    <p>${translations[currentLanguage].today_date} ${today.toLocaleDateString()}</p>
    <p>${translations[currentLanguage].next_event} <strong>${translations[currentLanguage].calendar_event}</strong> ${eventDate.toLocaleDateString()}</p>
    <p><a href="${config.saunaEventLink || '#'}" target="_blank">${translations[currentLanguage].event_detail}</a></p>
  `;
}

function loadYouTubeData() {
  if (!config.youtubeApiKey) {
    console.warn("Chybí YouTube API klíč v config.json, nelze načíst data kanálů.");
    return;
  }
  const channels = config.youtubeChannels || [];
  channels.forEach(channel => {
    fetch(`https://www.googleapis.com/youtube/v3/channels?part=snippet,contentDetails&id=${channel.id}&key=${config.youtubeApiKey}`)
      .then(response => response.json())
      .then(data => {
        if (data.items && data.items.length > 0) {
          const channelData = data.items[0];
          updateChannelSection(channel, channelData);
        }
      })
      .catch(err => console.error("Chyba při načítání dat z YouTube:", err));
  });
}

function updateChannelSection(channel, data) {
  const container = document.getElementById('projectsContainer');
  let projectElem = container.querySelector(`[data-channel-id="${channel.id}"]`);
  if (!projectElem) {
    projectElem = document.createElement('div');
    projectElem.className = 'project';
    projectElem.setAttribute('data-channel-id', channel.id);
    container.appendChild(projectElem);
  }
  const snippet = data.snippet;
  projectElem.innerHTML = `
    <h3>${snippet.title}</h3>
    <p>${snippet.description.substring(0, 200)}...</p>
    <p><a href="https://www.youtube.com/channel/${channel.id}" target="_blank">Přejít na kanál</a></p>
    <div id="randomVideo_${channel.id}">Načítám náhodné video...</div>
  `;
  loadRandomVideo(channel.id, data.contentDetails.relatedPlaylists.uploads);
}

function loadRandomVideo(channelId, uploadsPlaylistId) {
  fetch(`https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=${uploadsPlaylistId}&maxResults=50&key=${config.youtubeApiKey}`)
    .then(response => response.json())
    .then(data => {
      if (data.items && data.items.length > 0) {
        const randomIndex = Math.floor(Math.random() * data.items.length);
        const video = data.items[randomIndex].snippet;
        const videoDiv = document.getElementById(`randomVideo_${channelId}`);
        videoDiv.innerHTML = `<a href="https://www.youtube.com/watch?v=${video.resourceId.videoId}" target="_blank">Náhodné video: ${video.title}</a>`;
      }
    })
    .catch(err => console.error("Chyba při načítání videa:", err));
}

function loadSupportSection() {
  // Nastavení QR kódu – používáme veřejné API pro generování QR kódu
  if (config.supportQRCodeData) {
    const qrImg = document.getElementById('supportQr');
    const qrUrl = `https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=${encodeURIComponent(config.supportQRCodeData)}`;
    qrImg.src = qrUrl;
  }
  // Načtení seznamu projektů, které podporujete
  if (config.supportedProjects && Array.isArray(config.supportedProjects)) {
    const list = document.getElementById('supportedProjectsList');
    config.supportedProjects.forEach(proj => {
      const li = document.createElement('li');
      li.innerHTML = `<a href="${proj.link}" target="_blank">${proj.name}</a> - ${proj.description}`;
      list.appendChild(li);
    });
  }
}

function initAboutToggle() {
  const toggleBtn = document.getElementById('toggleAboutBtn');
  const aboutContent = document.getElementById('aboutContent');
  toggleBtn.addEventListener('click', function() {
    if (aboutContent.classList.contains('hidden')) {
      aboutContent.classList.remove('hidden');
      toggleBtn.textContent = translations[currentLanguage].about_toggle_collapse;
    } else {
      aboutContent.classList.add('hidden');
      toggleBtn.textContent = translations[currentLanguage].about_toggle_expand;
    }
  });
}

function setLanguage(lang) {
  currentLanguage = lang;
  updateTranslations();
  initCalendar();
}

function updateTranslations() {
  document.getElementById('titleHeader').innerText = translations[currentLanguage].title;
  document.getElementById('navAbout').innerText = translations[currentLanguage].nav_about;
  document.getElementById('navMindmap').innerText = translations[currentLanguage].nav_mindmap;
  document.getElementById('navProjects').innerText = translations[currentLanguage].nav_projects;
  document.getElementById('navCalendar').innerText = translations[currentLanguage].nav_calendar;
  document.getElementById('navSupport').innerText = translations[currentLanguage].nav_support;
  document.getElementById('aboutHeading').innerText = translations[currentLanguage].about_heading;
  document.getElementById('mindmapHeading').innerText = translations[currentLanguage].mindmap_heading;
  document.getElementById('projectsHeading').innerText = translations[currentLanguage].projects_heading;
  document.getElementById('calendarHeading').innerText = translations[currentLanguage].calendar_heading;
  document.getElementById('supportHeading').innerText = translations[currentLanguage].support_heading;
  document.getElementById('supportQrDesc').innerText = translations[currentLanguage].support_qr_desc;
  document.getElementById('supportListHeading').innerText = translations[currentLanguage].support_list_heading;
  const toggleBtn = document.getElementById('toggleAboutBtn');
  if (document.getElementById('aboutContent').classList.contains('hidden')) {
    toggleBtn.textContent = translations[currentLanguage].about_toggle_expand;
  } else {
    toggleBtn.textContent = translations[currentLanguage].about_toggle_collapse;
  }
}
EOF

# Vytvoření souboru config.json
cat << 'EOF' > my-website/config.json
{
  "youtubeApiKey": "YOUR_YOUTUBE_API_KEY_HERE",
  "youtubeChannels": [
    {
      "id": "UCXXXXXXXXXXXXXXX", 
      "name": "CareCast Medical"
    },
    {
      "id": "UCYYYYYYYYYYYYYYY", 
      "name": "Tonemyslitevazne"
    }
  ],
  "saunaEventDate": "2025-06-01",
  "saunaEventLink": "https://example.com/sauna-event",
  "supportQRCodeData": "https://donate.example.com",
  "supportedProjects": [
    {
      "name": "Projekt A",
      "description": "Popis projektu A.",
      "link": "https://example.com/projektA"
    },
    {
      "name": "Projekt B",
      "description": "Popis projektu B.",
      "link": "https://example.com/projektB"
    }
  ]
}
EOF

# Vytvoření souboru README.md
cat << 'EOF' > my-website/README.md
# Moje Osobní Webové Stránky

Tento projekt představuje kompletní osobní webovou stránku s dynamickými prvky a konfigurovatelným systémem, nyní s podporou více jazyků:

- **O mně:** Sekce s videem a odkazy na sociální sítě, kterou lze rozbalit či sbalit.
- **Mind Map Design:** Vizualizace inspirovaná xkcd – ručně kreslený, jednoduchý a vtipný design.
- **Projekty:** Dynamicky načítané projekty z `projects/projects.json`.
- **Kalendář:** Zobrazení události "Předvádění v sauně".
- **Podpoř mě:** QR kód pro podporu a seznam projektů, které podporuji.
- **Jazyková podpora:** Možnost přepínat mezi češtinou a angličtinou.

## Jak začít

1. Nahraďte `YOUR_YOUTUBE_API_KEY_HERE` a ostatní placeholdery ve `config.json` vašimi hodnotami.
2. Upravte soubory `config.json` a `projects/projects.json` podle svých potřeb.
3. Nahrajte projekt na GitHub Pages.
4. Zabalte celý adresář do ZIP archivu a sdílejte či archivujte.
EOF

# Vytvoření souboru projects/projects.json
cat << 'EOF' > my-website/projects/projects.json
[
  {
    "name": "CareCast Medical",
    "description": "Dynamicky načtený obsah z YouTube kanálu CareCast Medical.",
    "link": "https://www.youtube.com/@CareCastMedical"
  },
  {
    "name": "Tonemyslitevazne",
    "description": "Dynamicky načtený obsah z YouTube kanálu Tonemyslitevazne.",
    "link": "https://www.youtube.com/@Tonemyslitevazne"
  },
  {
    "name": "Další projekt",
    "description": "Popis dalšího projektu. Přidejte další záznamy podle potřeby.",
    "link": "https://example.com/dalsi-projekt"
  }
]
EOF

echo "Adresář my-website byl vytvořen s veškerým kódem."
