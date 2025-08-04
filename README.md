# AppVersum

A new Flutter project.

## Getting Started

FlutterFlow projects are built to run on the Flutter _stable_ release.

## Configuring the backend endpoint

The app retrieves the current video URL from a backend service. The base URL
is read from the `SERVER_URL` compile-time environment variable and defaults to
`http://10.0.2.2:8080`.

Run the app with a custom server URL:

```bash
flutter run --dart-define=SERVER_URL=http://<host>:<port>
```

Platform specific hosts:

- **Android emulator** – `http://10.0.2.2:<port>` points to the host machine.
- **iOS simulator** – `http://localhost:<port>` reaches the host machine.
- **Physical devices** – use your machine's IP address, e.g.
  `http://192.168.1.100:<port>`.

The app requests the current video from `${SERVER_URL}/current-video`.
