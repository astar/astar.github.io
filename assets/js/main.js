/**
 * Main JavaScript file for the HCI Homepage
 */

// Set current year in footer
document.addEventListener('DOMContentLoaded', () => {
    document.getElementById('current-year').textContent = new Date().getFullYear();
});

/**
 * Generate a project page based on project ID
 * Only used when directly navigating to a project page
 */
function initProjectPage() {
    // Check if we're on a project page
    const pathParts = window.location.pathname.split('/');
    const pageFilename = pathParts[pathParts.length - 1];
    
    if (pageFilename.endsWith('.html') && pathParts.includes('projects')) {
        const projectId = pageFilename.replace('.html', '');
        
        // Fetch project data
        fetch('../config/projects.json')
            .then(response => response.json())
            .then(data => {
                const project = data.projects.find(p => p.id === projectId);
                if (project) {
                    renderProjectPage(project);
                } else {
                    document.querySelector('main').innerHTML = '<div class="container"><h2>Projekt nenalezen</h2><p>Požadovaný projekt neexistuje.</p></div>';
                }
            })
            .catch(error => {
                console.error('Error fetching project data:', error);
                
                // Use sample data if fetch fails (for demo purposes)
                const sampleProjects = getSampleProjects();
                const project = sampleProjects.find(p => p.id === projectId);
                
                if (project) {
                    renderProjectPage(project);
                } else {
                    document.querySelector('main').innerHTML = '<div class="container"><h2>Projekt nenalezen</h2><p>Požadovaný projekt neexistuje.</p></div>';
                }
            });
    }
}

/**
 * Render a project page
 * @param {Object} project - Project data
 */
function renderProjectPage(project) {
    const mainElement = document.querySelector('main');
    
    let linksHTML = '';
    if (project.links && project.links.length > 0) {
        linksHTML = `
            <div class="project-links">
                <h3>Související odkazy</h3>
                <ul class="links-list">
                    ${project.links.map(link => `<li><a href="${link.url}" target="_blank">${link.title}</a></li>`).join('')}
                </ul>
            </div>
        `;
    }
    
    mainElement.innerHTML = `
        <div class="container">
            <div class="project-detail">
                <div class="project-header">
                    <img src="${project.thumbnail || '../assets/images/placeholder.jpg'}" alt="${project.title}" class="project-thumbnail">
                    <div class="project-header-info">
                        <h2>${project.title}</h2>
                        <p>${project.type === 'youtube' ? 'YouTube kanál' : 'Projekt'}</p>
                    </div>
                </div>
                
                <div class="project-content">
                    <p>${project.description}</p>
                </div>
                
                ${linksHTML}
            </div>
            
            <a href="../index.html" class="project-link">← Zpět na hlavní stránku</a>
        </div>
    `;
    
    // For YouTube projects, we could also embed videos or playlists
    if (project.type === 'youtube') {
        fetchYouTubeData(project);
    }
}

/**
 * Fetch YouTube data for a project
 * @param {Object} project - Project data
 */
function fetchYouTubeData(project) {
    // In a real implementation, we'd fetch videos from YouTube API:
    /*
    fetch(`https://www.googleapis.com/youtube/v3/search?part=snippet&channelId=${project.channelId}&maxResults=5&order=date&type=video&key=${YOUTUBE_API_KEY}`)
        .then(response => response.json())
        .then(data => {
            const videos = data.items;
            renderYouTubeVideos(videos);
        })
        .catch(error => {
            console.error('Error fetching YouTube videos:', error);
        });
    */
    
    // For demo purposes, we'll just add a placeholder
    const projectContent = document.querySelector('.project-content');
    projectContent.innerHTML += `
        <div class="youtube-content">
            <h3>Poslední videa</h3>
            <p>Zde by se zobrazila poslední videa z kanálu (v produkční verzi).</p>
        </div>
    `;
}

// Initialize project page if applicable
document.addEventListener('DOMContentLoaded', initProjectPage);

/**
 * Get sample projects for demo purposes (duplicate of function in projects.js)
 */
function getSampleProjects() {
    return [
        {
            id: "tone-myslite-vazne",
            type: "youtube",
            title: "Tone Myslite Vážně",
            channelId: "UCxxxxxxx",
            description: "Kanál zaměřený na vážnou hudbu a hudební teorii. Náš kanál se zabývá různými aspekty klasické hudby, včetně historického kontextu, analýzy skladeb, technických aspektů hudební teorie a mnoha dalších témat. Přinášíme vám rozhovory s předními umělci, recenze koncertů a nahrávek, a také výukové materiály pro studenty hudby.",
            thumbnail: "../assets/images/tone-thumbnail.jpg",
            links: [
                {
                    title: "Oficiální web",
                    url: "https://example.com/tone"
                },
                {
                    title: "Spotify",
                    url: "https://spotify.com/tone"
                }
            ]
        },
        {
            id: "care-cast-medical",
            type: "youtube",
            title: "CareCast Medical",
            channelId: "UCyyyyyy",
            description: "Medicínský podcast a kanál s nejnovějšími informacemi z oblasti zdravotnictví. Náš tým lékařů a zdravotnických odborníků přináší aktuální informace o nejnovějších výzkumech, léčebných postupech a zdravotnických trendech. Zaměřujeme se na srozumitelnou prezentaci složitých medicínských témat široké veřejnosti i odborníkům.",
            thumbnail: "../assets/images/carecast-thumbnail.jpg",
            links: [
                {
                    title: "Medicínské materiály",
                    url: "https://example.com/medical-docs.pdf"
                },
                {
                    title: "Podcast",
                    url: "https://podcasts.example.com/carecast"
                }
            ]
        },
        {
            id: "hci-research",
            type: "research",
            title: "HCI Research",
            description: "Výzkumný projekt zaměřený na Human-Computer Interaction a uživatelské rozhraní. Projekt se zabývá inovativními způsoby interakce člověka s počítačem, s důrazem na intuitivní a přístupná rozhraní. Výzkum zahrnuje uživatelské testování, prototypování nových interakčních metod a aplikaci kognitivní psychologie v designu uživatelských rozhraní.",
            thumbnail: "../assets/images/hci-thumbnail.jpg",
            links: [
                {
                    title: "Výzkumná zpráva",
                    url: "https://example.com/hci-report.pdf"
                },
                {
                    title: "GitHub repozitář",
                    url: "https://github.com/example/hci-research"
                }
            ]
        }
    ];
}
