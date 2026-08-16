# CLAUDE.md — marketing-pages

## Qué es
Landings de **propuesta comercial** de GlennGO (marketing digital: web + Google Ads + Meta Ads + REPLai Pilot IA). Sitio estático puro — HTML/CSS/JS en un solo archivo por marca, sin framework, sin build.

## Producción
- https://marketing.glenngo.com/ → `glenngo/`
- https://marketing.replaipilot.com/ → `replai-pilot/`

Misma página con distinto branding (logo, footer, CTA). **El contenido (precios, servicios, combos, tabla) está duplicado: si cambias algo en una marca, casi siempre hay que reflejarlo en la otra.**

## Estructura
```
glenngo/index.html          Landing branding GlennGO (+ logo_GlennGo.svg)
replai-pilot/index.html     Landing branding REPLai Pilot (+ replaipilot-h-dark.svg)
nginx.conf                  3 server blocks por server_name (default → glenngo), port 3000
Dockerfile                  nginx:alpine, copia las 2 carpetas + conf, EXPOSE 3000
```

## Deploy
Coolify app **"marketing-pages"** (uuid `c10c8p4zm7aw8ygiodzw6oy5`), estático + nginx multi-dominio.

1. `git push origin main` → webhook GitHub→Coolify → rebuild automático (~1-2 min)
2. Verificar en vivo las 2 URLs después de publicar

Webhook: URL `https://coolify.glenngo.com/webhooks/source/github/events/manual`, content-type json, evento push. El secret vive en Coolify (campo cifrado en BD — NUNCA editar con SQL directo) y en GitHub (Settings → Webhooks). No commitear secrets.

## Reglas de trabajo
1. **Antes de trabajar**: `git fetch` + comparar `HEAD` vs `origin/main` (proyecto paralelo con HERMES). Si hay remoto nuevo, `git pull` primero.
2. Cambios quirúrgicos: solo lo pedido. El estilo del código ya establecido manda.
3. Verificación obligatoria: diff de producción vs local (`curl -s --ssl-no-revoke <url> | tr -d '\r'` vs `tr -d '\r' < archivo`) — en Windows curl necesita `--ssl-no-revoke`.
4. Español en comentarios/docs/commits. Commits: `feat:` `fix:` `docs:` `chore:`.
5. Mobile responsive siempre (Glenn trabaja desde celular).
