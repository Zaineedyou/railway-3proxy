# Railway 3proxy (HTTP + SOCKS5)

Lightweight high-performance proxy server based on **3proxy** (written in C).
Optimized for easy deployment on **Railway** + custom domain.

## Features

- HTTP/HTTPS Proxy (port 3128)
- SOCKS5 Proxy (port 1080)
- Username + Password authentication
- Very low resource usage
- Ready for Railway

## Deploy to Railway

1. Fork atau langsung pakai repo ini
2. Di Railway → **New Project** → **Deploy from GitHub repo**
3. Pilih repo `railway-3proxy`
4. Tambahkan Environment Variables:

| Variable       | Contoh              | Wajib | Keterangan                    |
|----------------|---------------------|-------|-------------------------------|
| `PROXY_USER`   | `bro`               | Ya    | Username proxy                |
| `PROXY_PASS`   | `passwordkuat123`   | Ya    | Password proxy                |
| `HTTP_PORT`    | `3128`              | Tidak | Port HTTP proxy (default 3128)|
| `SOCKS_PORT`   | `1080`              | Tidak | Port SOCKS5 (default 1080)    |
| `MAXCONN`      | `500`               | Tidak | Max connections               |

5. Setelah deploy berhasil:
   - Settings → **Networking** → Generate Domain (untuk HTTP)
   - Atau tambahkan **Custom Domain** kamu
   - Untuk SOCKS5: aktifkan **TCP Proxy** dan set internal port ke `1080`

## Cara Pakai

### HTTP Proxy
```
Host: your-domain.up.railway.app (atau domain kamu)
Port: 3128 (atau port yang kamu set)
Username: sesuai PROXY_USER
Password: sesuai PROXY_PASS
```

### SOCKS5
```
Host: your-tcp-proxy.proxy.rlwy.net (dari TCP Proxy Railway)
Port: port yang dikasih Railway
Username / Password: sama
```

## Catatan Penting

- **Jangan** deploy tanpa `PROXY_USER` dan `PROXY_PASS`.
- Railway egress dibayar per GB, monitor usage kamu.
- Untuk performa terbaik, pilih region Singapore.

## Credit

Based on official [3proxy](https://github.com/3proxy/3proxy) (C language).
