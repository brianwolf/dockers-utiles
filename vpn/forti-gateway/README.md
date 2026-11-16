# Guía de Uso: Gateway VPN (Paraguay ➔ Argentina FortiVPN)

Guía operativa diaria para encender, autenticar (2FA), conectar y apagar el túnel VPN entre **Paraguay (Cliente)** y **Argentina (Servidor FortiVPN)** utilizando el `Makefile` del proyecto.

---

## 1. Configuración Previa (Archivo `.env`)

En el servidor de Argentina (`~/forti-gateway`), asegúrate de tener configurado el archivo `.env` con tu clave de autenticación de Tailscale:

```ini
TS_AUTHKEY=k123456789CNTRL-abcdefghijklmnop
```

---

## 2. En el Servidor (Argentina) — Encender y Autenticar el Túnel

1. **Abre una terminal (Konsole) y entra a la carpeta del proyecto:**

   ```bash
   cd ~/forti-gateway
   ```

2. **Construye y levanta los contenedores:**

   ```bash
   make up
   ```

3. **Ingresa el código de doble factor (2FA) de FortiVPN:**

   ```bash
   make auth
   ```

   * Cuando aparezca `Two-factor authentication token:`, escribe el código de tu autenticador y presiona **Enter**.
   * Espera a que aparezca el mensaje: `INFO: Tunnel is up and running`.

4. **Sal de la consola SIN apagar la VPN (Paso Crítico):**
   Presiona **`Ctrl + P`** seguido inmediatamente de **`Ctrl + Q`**.
   *(Nota: No uses `Ctrl + C`, ya que eso cerraría la conexión VPN).*

---

## 3. En el Cliente (Paraguay) — Conectarse y Desconectarse

### Activar salida por Argentina

Para que todo el tráfico de la PC en Paraguay salga a través de la VPN corporativa de Argentina:

```bash
sudo tailscale set --exit-node=gateway-argentina
```

* **Comprobación rápida:** Ejecuta `curl ifconfig.me` o abre tu navegador; ya deberías tener acceso a los recursos internos y salir con la IP de Argentina.

### Desactivar salida por Argentina (volver a internet normal de Paraguay)

Cuando termines de trabajar y quieras volver a tu conexión directa local:

```bash
sudo tailscale set --exit-node=
```

---

## 4. Referencia de Comandos del `Makefile` (Servidor Argentina)

Todos estos comandos se ejecutan dentro de `~/forti-gateway`:

| Comando | Descripción |
| :--- | :--- |
| `make` o `make help` | Muestra la lista de comandos disponibles con su descripción. |
| `make up` | Construye las imágenes (si es necesario) y levanta los contenedores en segundo plano. |
| `make auth` | Conecta la consola a `fortivpn-client` para ingresar el token 2FA. |
| `make logs` | Muestra los registros (logs) en tiempo real de FortiVPN y Tailscale (`Ctrl + C` para salir). |
| `make restart` | Reinicia ambos contenedores. |
| `make down` | Detiene y elimina los contenedores (conserva el estado de Tailscale para no pedir clave de nuevo). |
| `make clean` | **Limpieza total:** detiene contenedores, elimina imágenes y borra la carpeta `./tailscale-state`. |
