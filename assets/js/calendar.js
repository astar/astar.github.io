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
