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
