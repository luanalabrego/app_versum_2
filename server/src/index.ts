import express from 'express';

const app = express();
const PORT = process.env.PORT || 8080;

const CURRENT_VIDEO_URL =
  process.env.CURRENT_VIDEO_URL || 'https://example.com/video.mp4';

app.get('/current-video', (_req, res) => {
  res.json({ url: CURRENT_VIDEO_URL });
});

app.listen(PORT, () => {
  console.log(`Server listening on port ${PORT}`);
});
