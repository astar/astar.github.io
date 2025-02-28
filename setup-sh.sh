#!/bin/bash
# Script to set up the HCI Homepage project structure for GitHub Pages

# Set error handling
set -e

# Print colorful messages
print_green() {
    echo -e "\e[32m$1\e[0m"
}

print_blue() {
    echo -e "\e[34m$1\e[0m"
}

print_red() {
    echo -e "\e[31m$1\e[0m"
}

# Create base project directory
BASE_DIR="hci-homepage"

print_blue "Setting up HCI Homepage project structure..."

# Create main directory if it doesn't exist
if [ -d "$BASE_DIR" ]; then
    print_red "Directory $BASE_DIR already exists. Please remove it or use a different name."
    exit 1
fi

mkdir -p "$BASE_DIR"
cd "$BASE_DIR"

# Create directory structure
print_blue "Creating directory structure..."
mkdir -p assets/css
mkdir -p assets/js
mkdir -p assets/images
mkdir -p config
mkdir -p projects
mkdir -p docs

# Create placeholder images
print_blue "Creating placeholder images..."
touch assets/images/placeholder.jpg
touch assets/images/tone-thumbnail.jpg
touch assets/images/carecast-thumbnail.jpg
touch assets/images/hci-thumbnail.jpg
touch assets/images/orchestra.jpg
touch assets/images/health-infographic.jpg
touch assets/images/interaction-diagram.jpg

# Create dummy documents for demo purposes
print_blue "Creating dummy documents..."
touch docs/music-sheets.pdf
touch docs/medical-docs.pdf
touch docs/hci-report.pdf

# Create HTML files
print_blue "Creating HTML files..."

# Create index.html
cat > index.html << 'EOF'
<!DOCTYPE html>
<html lang="cs">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HCI Homepage</title>
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&display=swap" rel="stylesheet">
</head>
<body>
    <header>
        <h1>HCI Homepage</h1>
        <nav>
            <ul>
                <li><a href="#calendar">Kalendář</a></li>
                <li><a href="#projects">Projekty</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <section id="calendar" class="container">
            <h2>Předvádění v sauně</h2>
            <div class="calendar-container">
                <div class="calendar-header">
                    <button id="prev-month">&lt;</button>
                    <h3 id="month-year"></h3>
                    <button id="next-month">&gt;</button>
                </div>
                <div class="weekdays"></div>
                <div class="calendar-days"></div>
            </div>
            <div id="events-list" class="events-container">
                <h3>Události</h3>
                <ul class="events-list"></ul>
            </div>
        </section>

        <section id="projects" class="container">
            <h2>Projekty</h2>
            <div id="projects-container" class="projects-grid"></div>
        </section>
    </main>

    <footer>
        <p>© <span id="current-year"></span> HCI Homepage</p>
    </footer>

    <script src="assets/js/calendar.js"></script>
    <script src="assets/js/projects.js"></script>
    <script src="assets/js/main.js"></script>
</body>
</html>
EOF

# Create project template
cat > projects/project-template.html << 'EOF'
<!DOCTYPE html>
<html lang="cs">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Project Title - HCI Homepage</title>
    <link rel="stylesheet" href="../assets/css/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&display=swap" rel="stylesheet">
</head>
<body>
    <header>
        <h1>HCI Homepage</h1>
        <nav>
            <ul>
                <li><a href="../index.html#calendar">Kalendář</a></li>
                <li><a href="../index.html#projects">Projekty</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <!-- Project content will be loaded dynamically -->
    </main>

    <footer>
        <p>© <span id="current-year"></span> HCI Homepage</p>
    </footer>

    <script src="../assets/js/main.js"></script>
</body>
</html>
EOF

# Create project pages from template
for PROJECT in "tone-myslite-vazne" "care-cast-medical" "hci-research"; do
    cp projects/project-template.html "projects/$PROJECT.html"
done

# Create CSS file
print_blue "Creating CSS file..."
cat > assets/css/style.css << 'EOF'
/* Base styles inspired by xkcd, Edward Tufte, and Hitchhiker's Guide */
:root {
    --primary-color: #333;
    --secondary-color: #555;
    --accent-color: #4285f4;
    --background-color: #f8f8f8;
    --card-background: #fff;
    --border-color: #ddd;
    --text-color: #333;
    --light-text: #777;
    --success-color: #0f9d58;
    --warning-color: #f4b400;
    --error-color: #db4437;
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Inter', sans-serif;
    line-height: 1.6;
    color: var(--text-color);
    background-color: var(--background-color);
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
}

header {
    padding: 40px 0 20px;
    margin-bottom: 40px;
    border-bottom: 1px solid var(--border-color);
}

header h1 {
    font-size: 2.5rem;
    margin-bottom: 20px;
    font-weight: 700;
}

nav ul {
    list-style: none;
    display: flex;
    gap: 20px;
}

nav a {
    text-decoration: none;
    color: var(--accent-color);
    font-weight: 500;
    font-size: 1.1rem;
    transition: color 0.3s;
}

nav a:hover {
    color: var(--primary-color);
}

.container {
    margin-bottom: 60px;
}

h2 {
    font-size: 2rem;
    margin-bottom: 30px;
    color: var(--primary-color);
    border-bottom: 1px solid var(--border-color);
    padding-bottom: 10px;
}

h3 {
    font-size: 1.5rem;
    margin-bottom: 15px;
    color: var(--secondary-color);
}

footer {
    padding: 20px 0;
    text-align: center;
    border-top: 1px solid var(--border-color);
    color: var(--light-text);
    margin-top: 40px;
}

/* Calendar Styles */
.calendar-container {
    background-color: var(--card-background);
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
    padding: 20px;
    margin-bottom: 30px;
}

.calendar-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
}

.calendar-header button {
    background: none;
    border: 1px solid var(--border-color);
    width: 30px;
    height: 30px;
    border-radius: 50%;
    cursor: pointer;
    font-size: 1rem;
    transition: all 0.3s;
}

.calendar-header button:hover {
    background-color: var(--accent-color);
    color: white;
    border-color: var(--accent-color);
}

.weekdays {
    display: grid;
    grid-template-columns: repeat(7, 1fr);
    text-align: center;
    font-weight: bold;
    margin-bottom: 10px;
}

.calendar-days {
    display: grid;
    grid-template-columns: repeat(7, 1fr);
    gap: 5px;
}

.day {
    height: 40px;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    border-radius: 50%;
    transition: all 0.3s;
}

.day:hover {
    background-color: var(--border-color);
}

.current-day {
    background-color: var(--accent-color);
    color: white;
}

.event-day {
    position: relative;
}

.event-day::after {
    content: '';
    position: absolute;
    bottom: 5px;
    width: 6px;
    height: 6px;
    background-color: var(--accent-color);
    border-radius: 50%;
}

.events-container {
    background-color: var(--card-background);
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
    padding: 20px;
}

.events-list {
    list-style: none;
}

.events-list li {
    padding: 10px 0;
    border-bottom: 1px solid var(--border-color);
}

.events-list li:last-child {
    border-bottom: none;
}

.event-time {
    font-weight: bold;
    margin-right: 10px;
    color: var(--accent-color);
}

/* Projects Styles */
.projects-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
    gap: 20px;
}

.project-card {
    background-color: var(--card-background);
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
    overflow: hidden;
    transition: transform 0.3s, box-shadow 0.3s;
}

.project-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
}

.project-image {
    width: 100%;
    height: 180px;
    object-fit: cover;
}

.project-info {
    padding: 20px;
}

.project-title {
    font-size: 1.2rem;
    margin-bottom: 10px;
    color: var(--primary-color);
}

.project-description {
    color: var(--secondary-color);
    margin-bottom: 15px;
    line-height: 1.5;
}

.project-link {
    display: inline-block;
    text-decoration: none;
    color: var(--accent-color);
    font-weight: 500;
    transition: color 0.3s;
}

.project-link:hover {
    color: var(--primary-color);
}

/* Project detail page */
.project-detail {
    background-color: var(--card-background);
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
    padding: 30px;
    margin-bottom: 30px;
}

.project-header {
    display: flex;
    align-items: center;
    margin-bottom: 30px;
}

.project-thumbnail {
    width: 100px;
    height: 100px;
    border-radius: 8px;
    object-fit: cover;
    margin-right: 20px;
}

.project-header-info h2 {
    margin-bottom: 10px;
    border-bottom: none;
}

.project-content {
    margin-bottom: 30px;
}

.project-links {
    background-color: var(--background-color);
    padding: 20px;
    border-radius: 8px;
}

.project-links h3 {
    margin-bottom: 15px;
}

.links-list {
    list-style: none;
}

.links-list li {
    margin-bottom: 10px;
}

.links-list a {
    color: var(--accent-color);
    text-decoration: none;
    transition: color 0.3s;
}

.links-list a:hover {
    color: var(--primary-color);
}

/* Responsive adjustments */
@media (max-width: 768px) {
    .projects-grid {
        grid-template-columns: 1fr;
    }
    
    .calendar-container, .events-container {
        padding: 15px;
    }
    
    .day {
        height: 35px;
    }
}

/* Tufte-inspired elements */
blockquote {
    border-left: 3px solid var(--accent-color);
    padding-left: 15px;
    margin: 20px 0;
    font-style: italic;
    color: var(--secondary-color);
}

.sidenote {
    float: right;
    width: 200px;
    margin-right: -250px;
    font-size: 0.9rem;
    line-height: 1.4;
    color: var(--light-text);
    padding: 5px 10px;
    border-left: 1px solid var(--border-color);
}

/* XKCD-inspired elements */
.xkcd-sketch {
    font-family: "Comic Sans MS", cursive;
    max-width: 600px;
    margin: 0 auto;
    padding: 20px;
    line-height: 1.4;
}

.xkcd-sketch img {
    display: block;
    margin: 15px auto;
    max-width: 100%;
}

.xkcd-caption {
    font-style: italic;
    text-align: center;
    margin-top: 10px;
    color: var(--light-text);
}
EOF

# Create JavaScript files
print_blue "Creating JavaScript files..."

# Create calendar.js
cat > assets/js/calendar.js << 'EOF'
/**
 * Calendar functionality for the HCI Homepage
 * Fetches and displays events from a Google Calendar
 */

// Google Calendar API Key (you'll need to replace this with your own)
const CALENDAR_API_KEY = "YOUR_API_KEY"; // Will need to be replaced with a real API key
const CALENDAR_ID = "e35dd65db3dfc2ab93b2b9b30cf18039831c11b6bc7d38c30ad8358a4323da25@group.calendar.google.com";

// Current date
let currentDate = new Date();
let selectedDate = new Date();
let events = [];

/**
 * Initialize the calendar
 */
function initCalendar() {
    renderCalendar();
    fetchEvents();
    
    // Add event listeners for navigation
    document.getElementById('prev-month').addEventListener('click', () => {
        currentDate.setMonth(currentDate.getMonth() - 1);
        renderCalendar();
    });
    
    document.getElementById('next-month').addEventListener('click', () => {
        currentDate.setMonth(currentDate.getMonth() + 1);
        renderCalendar();
    });
}

/**
 * Render the calendar for the current month
 */
function renderCalendar() {
    const year = currentDate.getFullYear();
    const month = currentDate.getMonth();
    
    // Update header
    const monthNames = ["Leden", "Únor", "Březen", "Duben", "Květen", "Červen", 
                        "Červenec", "Srpen", "Září", "Říjen", "Listopad", "Prosinec"];
    document.getElementById('month-year').textContent = `${monthNames[month]} ${year}`;
    
    // Render weekdays
    const weekdays = ["Po", "Út", "St", "Čt", "Pá", "So", "Ne"];
    const weekdaysEl = document.querySelector('.weekdays');
    weekdaysEl.innerHTML = '';
    weekdays.forEach(day => {
        const dayEl = document.createElement('div');
        dayEl.textContent = day;
        weekdaysEl.appendChild(dayEl);
    });
    
    // Render days
    const daysEl = document.querySelector('.calendar-days');
    daysEl.innerHTML = '';
    
    // Get first day of month and last day of month
    const firstDay = new Date(year, month, 1);
    const lastDay = new Date(year, month + 1, 0);
    
    // Get day of first day (0 = Sunday, 1 = Monday, ..., 6 = Saturday)
    // Convert to Monday-based (0 = Monday, 1 = Tuesday, ..., 6 = Sunday)
    let firstDayIndex = firstDay.getDay() - 1;
    if (firstDayIndex < 0) firstDayIndex = 6; // Sunday becomes 6
    
    // Add empty cells for days before first day of month
    for (let i = 0; i < firstDayIndex; i++) {
        const dayEl = document.createElement('div');
        dayEl.classList.add('day', 'empty');
        daysEl.appendChild(dayEl);
    }
    
    // Add days of month
    const today = new Date();
    for (let i = 1; i <= lastDay.getDate(); i++) {
        const dayEl = document.createElement('div');
        dayEl.classList.add('day');
        dayEl.textContent = i;
        
        const dateToCheck = new Date(year, month, i);
        
        // Check if this day has events
        if (hasEvents(dateToCheck)) {
            dayEl.classList.add('event-day');
        }
        
        // Check if this is today
        if (today.getFullYear() === year && 
            today.getMonth() === month && 
            today.getDate() === i) {
            dayEl.classList.add('current-day');
        }
        
        // Add click event to select date
        dayEl.addEventListener('click', () => {
            document.querySelectorAll('.day').forEach(d => d.classList.remove('selected-day'));
            dayEl.classList.add('selected-day');
            selectedDate = new Date(year, month, i);
            renderEvents();
        });
        
        daysEl.appendChild(dayEl);
    }
}

/**
 * Check if a date has events
 * @param {Date} date - Date to check
 * @returns {boolean} - True if date has events
 */
function hasEvents(date) {
    return events.some(event => {
        const eventStart = new Date(event.start.dateTime || event.start.date);
        const eventEnd = new Date(event.end.dateTime || event.end.date);
        
        return date.getFullYear() === eventStart.getFullYear() && 
               date.getMonth() === eventStart.getMonth() && 
               date.getDate() === eventStart.getDate();
    });
}

/**
 * Fetch events from Google Calendar
 */
function fetchEvents() {
    // Since we can't directly fetch from Google Calendar without CORS issues in GitHub Pages,
    // we'll use a fallback approach with sample data
    
    // In a real implementation, you would use something like:
    /*
    const startDate = new Date(currentDate.getFullYear(), currentDate.getMonth(), 1);
    const endDate = new Date(currentDate.getFullYear(), currentDate.getMonth() + 1, 0);
    
    fetch(`https://www.googleapis.com/calendar/v3/calendars/${CALENDAR_ID}/events?key=${CALENDAR_API_KEY}&timeMin=${startDate.toISOString()}&timeMax=${endDate.toISOString()}`)
        .then(response => response.json())
        .then(data => {
            events = data.items;
            renderCalendar(); // Re-render to show event indicators
            renderEvents();
        })
        .catch(error => {
            console.error('Error fetching calendar events:', error);
        });
    */
    
    // For demo purposes, we'll use sample data
    events = getSampleEvents();
    renderCalendar(); // Re-render to show event indicators
    renderEvents();
}

/**
 * Get sample events for demo purposes
 * @returns {Array} - Sample events
 */
function getSampleEvents() {
    const now = new Date();
    const year = now.getFullYear();
    const month = now.getMonth();
    
    return [
        {
            summary: "Předvádění v sauně - Workshop",
            start: {
                dateTime: new Date(year, month, 15, 14, 0, 0).toISOString()
            },
            end: {
                dateTime: new Date(year, month, 15, 16, 0, 0).toISOString()
            }
        },
        {
            summary: "Diskuze o HCI",
            start: {
                dateTime: new Date(year, month, 20, 10, 0, 0).toISOString()
            },
            end: {
                dateTime: new Date(year, month, 20, 12, 0, 0).toISOString()
            }
        },
        {
            summary: "Večerní sauna",
            start: {
                dateTime: new Date(year, month, 25, 18, 0, 0).toISOString()
            },
            end: {
                dateTime: new Date(year, month, 25, 20, 0, 0).toISOString()
            }
        }
    ];
}

/**
 * Render events for the selected date
 */
function renderEvents() {
    const eventsListEl = document.querySelector('.events-list');
    eventsListEl.innerHTML = '';
    
    // Filter events for selected date
    const selectedEvents = events.filter(event => {
        const eventStart = new Date(event.start.dateTime || event.start.date);
        
        return selectedDate.getFullYear() === eventStart.getFullYear() && 
               selectedDate.getMonth() === eventStart.getMonth() && 
               selectedDate.getDate() === eventStart.getDate();
    });
    
    // If no events, show message
    if (selectedEvents.length === 0) {
        const noEventsEl = document.createElement('li');
        noEventsEl.textContent = "Žádné události pro tento den";
        eventsListEl.appendChild(noEventsEl);
        return;
    }
    
    // Render events
    selectedEvents.forEach(event => {
        const eventEl = document.createElement('li');
        
        // Format time if available
        let timeString = "";
        if (event.start.dateTime) {
            const startTime = new Date(event.start.dateTime);
            const endTime = new Date(event.end.dateTime);
            
            const formatTime = (date) => {
                return date.toLocaleTimeString('cs-CZ', { hour: '2-digit', minute: '2-digit' });
            };
            
            timeString = `<span class="event-time">${formatTime(startTime)} - ${formatTime(endTime)}</span>`;
        }
        
        eventEl.innerHTML = `${timeString}${event.summary}`;
        eventsListEl.appendChild(eventEl);
    });
}

// Initialize calendar when DOM is loaded
document.addEventListener('DOMContentLoaded', initCalendar);
EOF

# Create projects.js
cat > assets/js/projects.js << 'EOF'
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
EOF

# Create main.js
cat > assets/js/main.js << 'EOF'
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
EOF

# Create projects.json
print_blue "Creating projects configuration file..."
cat > config/projects.json << 'EOF'
{
  "projects": [
    {
      "id": "tone-myslite-vazne",
      "type": "youtube",
      "title": "Tone Myslite Vážně",
      "channelId": "Tonemyslitevazne",
      "youtubeURL": "https://www.youtube.com/@Tonemyslitevazne",
      "description": "Kanál zaměřený na vážnou hudbu a hudební teorii. Náš kanál se zabývá různými aspekty klasické hudby, včetně historického kontextu, analýzy skladeb, technických aspektů hudební teorie a mnoha dalších témat.",
      "thumbnail": "assets/images/tone-thumbnail.jpg",
      "links": [
        {
          "title": "Oficiální web",
          "url": "https://example.com/tone",
          "type": "link"
        },
        {
          "title": "Playlist klasické skladby",
          "url": "https://www.youtube.com/playlist?list=example",
          "type": "link"
        },
        {
          "title": "Notový materiál",
          "url": "docs/music-sheets.pdf",
          "type": "document"
        },
        {
          "title": "Ukázka orchestru",
          "url": "assets/images/orchestra.jpg",
          "type": "image"
        }
      ],
      "additionalContent": "Náš kanál vznikl v roce 2020 s cílem přiblížit klasickou hudbu širšímu publiku. Spolupracujeme s hudebníky, pedagogy a dalšími odborníky, abychom přinášeli kvalitní a zajímavý obsah."
    },
    {
      "id": "care-cast-medical",
      "type": "youtube",
      "title": "CareCast Medical",
      "channelId": "CareCastMedical",
      "youtubeURL": "https://www.youtube.com/@CareCastMedical",
      "description": "Medicínský podcast a kanál s nejnovějšími informacemi z oblasti zdravotnictví. Náš tým lékařů a zdravotnických odborníků přináší aktuální informace o nejnovějších výzkumech, léčebných postupech a zdravotnických trendech.",
      "thumbnail": "assets/images/carecast-thumbnail.jpg",
      "links": [
        {
          "title": "Medicínské materiály",
          "url": "docs/medical-docs.pdf",
          "type": "document"
        },
        {
          "title": "Podcast",
          "url": "https://podcasts.example.com/carecast",
          "type": "link"
        },
        {
          "title": "Infografika zdraví",
          "url": "assets/images/health-infographic.jpg",
          "type": "image"
        }
      ],
      "additionalContent": "CareCast Medical je platforma zaměřená na vzdělávání v oblasti zdraví. Naším posláním je poskytovat přesné a aktuální zdravotnické informace způsobem, který je srozumitelný pro širokou veřejnost i odborníky."
    },
    {
      "id": "hci-research",
      "type": "research",
      "title": "HCI Research",
      "description": "Výzkumný projekt zaměřený na Human-Computer Interaction a uživatelské rozhraní. Projekt se zabývá inovativními způsoby interakce člověka s počítačem, s důrazem na intuitivní a přístupná rozhraní.",
      "thumbnail": "assets/images/hci-thumbnail.jpg",
      "links": [
        {
          "title": "Výzkumná zpráva",
          "url": "docs/hci-report.pdf",
          "type": "document"
        },
        {
          "title": "GitHub repozitář",
          "url": "https://github.com/example/hci-research",
          "type": "link"
        },
        {
          "title": "Diagram interakce",
          "url": "assets/images/interaction-diagram.jpg",
          "type": "image"
        }
      ],
      "additionalContent": "Tento výzkumný projekt je podporován grantem pro inovace v oblasti uživatelských rozhraní. Naším cílem je vyvinout nové paradigma pro interakci člověka s digitálními zařízeními, které bude intuitivnější, přístupnější a efektivnější."
    }
  ]
}
EOF

# Create .gitignore
print_blue "Creating .gitignore..."
cat > .gitignore << 'EOF'
# OS generated files
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# IDE files
.idea/
.vscode/
*.sublime-project
*.sublime-workspace

# Node.js
node_modules/
npm-debug.log
yarn-error.log
package-lock.json
yarn.lock

# Build and temp files
.tmp/
.temp/
.cache/
dist/
build/

# Local env files
.env
.env.local
.env.development.local
.env.test.local
.env.production.local
EOF

# Create README.md
print_blue "Creating README.md..."
cat > README.md << 'EOF'
# HCI Homepage

A clean, minimalist website for showcasing Human-Computer Interaction projects, with a calendar integration and a configurable project system.

## Features

- Calendar displaying events from a Google Calendar
- Project showcase system configurable via JSON
- YouTube channel integration
- Clean, minimalist design inspired by xkcd, Edward Tufte, and The Hitchhiker's Guide to the Galaxy
- Responsive design for all devices

## Setup

1. Clone this repository
2. Add your API keys:
   - Google Calendar API key in `assets/js/calendar.js`
   - YouTube API key in `assets/js/projects.js`
3. Customize the projects in `config/projects.json`
4. Deploy to GitHub Pages

## Project Structure

- `index.html` - Main page
- `assets/` - CSS, JavaScript, and images
- `config/` - Configuration files
- `projects/` - Project detail pages
- `docs/` - Documentation and other resources

## Configuration

### Projects

Projects are configured in `config/projects.json`. Each project has the following structure:

```json
{
  "id": "project-id",
  "type": "youtube|research|other",
  "title": "Project Title",
  "description": "Project description",
  "thumbnail": "path/to/thumbnail.jpg",
  "links": [
    {
      "title": "Link Title",
      "url": "https://example.com",
      "type": "link|document|image"
    }
  ],
  "additionalContent": "Additional content for the project page"
}
```

## License

MIT
EOF

# Set up GitHub Pages
print_blue "Setting up GitHub Pages..."
cat > .github/workflows/gh-pages.yml << 'EOF'
name: Deploy to GitHub Pages

on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Deploy to GitHub Pages
        uses: JamesIves/github-pages-deploy