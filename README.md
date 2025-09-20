# Car Listings React App

This is a small React + Vite project that reproduces the dark car-listings UI from your design and includes routing and client-side search/filtering.

Getting started (Windows PowerShell):

1. Open PowerShell and change to the project folder:

```
cd "C:\Users\sadej\Desktop\Strona Samochodowa"
```

2. Install dependencies (Node.js 18+ recommended):

```
npm install
```

3. Run the frontend dev server:

```
npm run dev
```

Production (build + serve from Express):

```
npm install
npm run start-prod
```

The `start-prod` script runs `npm run build` to create a `dist/` folder and then starts the Express server which will serve the static files from `dist/`. This ensures that visiting the server root (eg. http://localhost:3001 when running the server) returns the same UI you see in the dev mode.

4. Backend (Express + MariaDB)

You can run the backend API in two ways:

- Locally (requires MySQL installed):

	- Create a `.env` file from `.env.example` and set DB credentials.
	- Import SQL schema to create and seed the database: use MySQL client to run `db/schema.sql`.
	- Start the server:

	```powershell
	npm run start-server
	```

-- Using Docker Compose (recommended for quick local setup):

	```powershell
	docker compose up --build
	```

	This will bring up a MariaDB container and the Node server; server will be accessible at http://localhost:3001 and the frontend (vite) should fetch `/api/listings` from that endpoint if you configure proxy or run both locally. MariaDB is compatible with the provided SQL schema (the `db/schema.sql` works with MariaDB as-is).

Notes about development setup
- The frontend fetches listings from `/api/listings`. When running Vite dev server and Node server concurrently, you can configure a proxy in `vite.config.js` or run the frontend and backend on same domain in production. For quick local development either run frontend and backend separately and set the frontend fetch URL to `http://localhost:3001/api/listings` or configure Vite proxy.


What I included
- Vite + React scaffold (in this folder)
- React Router routes: `/` (home) and `/listing/:id` (detail)
- Sample data in `src/data/listings.js`
- Components in `src/shared` and pages in `src/pages`
- Styles in `src/styles.css`

Notes and next steps
- The images are remote Unsplash URLs. For offline use, replace them with local assets in `public/` and update paths.
- You can expand filters (year, price range) easily in `src/pages/Home.jsx`.
- To build for production run `npm run build` and `npm run preview` to check the built app.
