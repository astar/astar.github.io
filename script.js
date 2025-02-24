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
