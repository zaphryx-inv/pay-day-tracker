# PayTracker 💰

A smart work hours tracker and pay planner with intelligent date suggestions.

## Features

- 📊 Track work hours with date and notes
- 💵 Calculate estimated pay based on hourly rate
- 🎯 Smart algorithm suggests optimal pay request dates
- 📱 Mobile-friendly iOS-style design
- 💾 All data stored locally in your browser

## How It Works

The app uses a weighted algorithm to suggest the best day to request payment:
- Avoids weekends (optional)
- Avoids dates similar to previous months
- Prioritizes mid-month dates (8-15)
- Prevents predictable patterns

## Usage

1. Open `index.html` in your browser
2. Set your hourly rate in Settings
3. Log your work hours
4. Get smart suggestions for payment requests

## Tech Stack

- HTML5
- TailwindCSS
- Lucide Icons
- Vanilla JavaScript
- LocalStorage API

## Live Demo

Visit: [https://zaphryx-inv.github.io/pay-day-tracker/](https://zaphryx-inv.github.io/pay-day-tracker/)

## License

MIT
