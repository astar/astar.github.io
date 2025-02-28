/**
 * Projects functionality for the HCI Homepage
 * Loads projects from a JSON configuration file
 */

// Projects configuration path
const PROJECTS_CONFIG_PATH = 'config/projects.json';

// YouTube API key (you'll need to replace this with your own)
const YOUTUBE_API_KEY = "YOUR_API_KEY"; // Will need to be replaced with a real API key

/**
 * Initialize projects
 */
function initProjects() {
    fetchProjects();
}

/**
 * Fetch projects from configuration file
 */
function fetchProjects() {
    fetch(PROJECTS_CONFIG_PATH)
        .then(response => response.json())
        .then(data => {
            renderProjects(data.projects);
        })
        .catch(error => {
            console.error('Error fetching projects:', error);
            // Use sample data if fetch fails (for demo purposes)
            renderProjects(getSampleProjects());
        });
}

/**
 * Render projects on the page
 * @param {Array} projects - List of projects
 */
function renderProjects(projects) {
    const projectsContainer = document.getElementById('projects-container');
    projectsContainer.innerHTML = '';
    
    projects.forEach(project => {
        const projectEl = document.createElement('div');
        projectEl.classList.add('project-card');
        
        // Handle YouTube projects differently
        if (project.type === 'youtube') {
            renderYouTubeProject(projectEl, project);
        } else {
            renderRegularProject(projectEl, project);
        }
        
        projectsContainer.appendChild(projectEl);
    });
}

/**
 * Render a YouTube project
 * @param {HTMLElement} container - Container element
 * @param {Object} project - Project data
 */
function renderYouTubeProject(container, project) {
    // In a real implementation, we'd fetch channel data from YouTube API:
    /*
    fetch(`https://www.googleapis.com/youtube/v3/channels?part=snippet,statistics&id=${project.channelId}&key=${YOUTUBE_API_KEY}`)
        .then(response => response.json())
        .then(data => {
            const channel = data.items[0];
            
            container.innerHTML = `
                <img src="${channel.snippet.thumbnails.medium.url}" alt="${channel.snippet.title}" class="project-image">
                <div class="project-info">
                    <h3 class="project-title">${channel.snippet.title}</h3>
                    <p class="project-description">${channel.snippet.description.substring(0, 150)}${channel.snippet.description.length > 150 ? '...' : ''}</p>
                    <a href="projects/${project.id}.html" class="project-link">Více informací</a>
                </div>
            `;
        })
        .catch(error => {
            console.error('Error fetching YouTube channel:', error);
            renderFallbackProject(container, project);
        });
    */
    
    // For demo purposes, use project data directly
    container.innerHTML = `
        <img src="${project.thumbnail || 'assets/images/placeholder.jpg'}" alt="${project.title}" class="project-image">
        <div class="project-info">
            <h3 class="project-title">${project.title}</h3>
            <p class="project-description">${project.description.substring(0, 150)}${project.description.length > 150 ? '...' : ''}</p>
            <a href="projects/${project.id}.html" class="project-link">Více informací</a>
        </div>
    `;
}

/**
 * Render a regular project
 * @param {HTMLElement} container - Container element
 * @param {Object} project - Project data
 */
function renderRegularProject(container, project) {
    container.innerHTML = `
        <img src="${project.thumbnail || 'assets/images/placeholder.jpg'}" alt="${project.title}" class="project-image">
        <div class="project-info">
            <h3 class="project-title">${project.title}</h3>
            <p class="project-description">${project.description.substring(0, 150)}${project.description.length > 150 ? '...' : ''}</p>
            <a href="projects/${project.id}.html" class="project-link">Více informací</a>
        </div>
    `;
}

/**
 * Render a fallback project when API calls fail
 * @param {HTMLElement} container - Container element
 * @param {Object} project - Project data
 */
function renderFallbackProject(container, project) {
    container.innerHTML = `
        <img src="assets/images/placeholder.jpg" alt="${project.title}" class="project-image">
        <div class="project-info">
            <h3 class="project-title">${project.title}</h3>
            <p class="project-description">${project.description || 'Popis není k dispozici'}</p>
            <a href="projects/${project.id}.html" class="project-link">Více informací</a>
        </div>
    `;
}

/**
 * Get sample projects for demo purposes
 * @returns {Array} - Sample projects
 */
function getSampleProjects() {
    return [
        {
            id: "tone-myslite-vazne",
            type: "youtube",
            title: "Tone Myslite Vážně",
            channelId: "UCxxxxxxx", // Replace with actual channel ID
            description: "Kanál zaměřený na vážnou hudbu a hudební teorii.",
            thumbnail: "assets/images/tone-thumbnail.jpg",
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
            channelId: "UCyyyyyy", // Replace with actual channel ID
            description: "Medicínský podcast a kanál s nejnovějšími informacemi z oblasti zdravotnictví.",
            thumbnail: "assets/images/carecast-thumbnail.jpg",
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
            description: "Výzkumný projekt zaměřený na Human-Computer Interaction a uživatelské rozhraní.",
            thumbnail: "assets/images/hci-thumbnail.jpg",
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

// Initialize projects when DOM is loaded
document.addEventListener('DOMContentLoaded', initProjects);
