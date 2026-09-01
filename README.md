# Railway 3proxy (HTTP + SOCKS5)

Lightweight high-performance proxy server based on **3proxy** (written in C).
Optimized for easy deployment on **Railway** + custom domain.

## Features

- HTTP/HTTPS Proxy (default port 3128)
- SOCKS5 Proxy (default port 1080)
- Username + Password authentication
- Very low resource usage
- Ready for Railway

## Deploy to Railway

1. Deploy from GitHub repo `railway-3proxy`
2. Tambahkan **Environment Variables** berikut:

| Variable          | Contoh             | Wajib | Keterangan                          |
|-------------------|--------------------|-------|-------------------------------------|
| `PROXY_LOGIN`     | `bro`              | Ya    | Username proxy                      |
| `PROXY_PASSWORD`  | `passwordkuat123`  | Ya    | Password proxy                      |
| `PROXY_PORT`      | `3128`             | Tidak | Port HTTP proxy (default 3128)      |
| `SOCKS_PORT`      | `1080`             | Tidak | Port SOCKS5 (default 1080)          |
| `MAX_CONNECTIONS` | `512`              | Tidak | Max connections                     |

3. Setelah deploy berhasil:
   - Settings → **Networking** → Generate Domain (untuk HTTP)
   - Atau tambahkan **Custom Domain** kamu
   - **Untuk SOCKS5 (Minecraft)**: aktifkan **TCP Proxy** dan set internal port ke `1080`

## Cara Pakai

### HTTP Proxy
```
Host     : your-app.up.railway.app (atau domain kamu)
Port     : 3128
Username : sesuai PROXY_LOGIN
Password : sesuai PROXY_PASSWORD
```

### SOCKS5 (disarankan untuk Minecraft)
```
Host     : xxx.proxy.rlwy.net (dari TCP Proxy Railway)
Port     : port yang dikasih Railway
Username : sesuai PROXY_LOGIN
Password : sesuai PROXY_PASSWORD
```

## Catatan Penting

- **Wajib** isi `PROXY_LOGIN` dan `PROXY_PASSWORD`
- Railway egress dibayar per GB
- Pilih region **Singapore** biar deket server MC

## Credit

Based on [tarampampam/3proxy](https://github.com/tarampampam/3proxy-docker) + official 3proxy (C language).
