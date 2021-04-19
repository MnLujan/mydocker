# Certbot

Imagen utilizada para generar certificados por Let's Encrypt.


Para realizar el deploy debera tener **Docker** y **docker compose** en su host, en caso contrario, hacer click [aqui]() para ver la guia de instalacion.

## Generacion de Certificados

Como primer paso realice los cambios en el archvio `.env` insertando los dominios que se desea obtener certificados. 

Una vez editado y guardado los cambios, como root ejecute:

```
docker-compose -f docker-compose.yml up
```

Certbot generara los certificados respectivos y creara un enlace simbolico a estos. En el directorio especifico, dando mas facilidad de acceso los archivos.

---

[Martin Lujan - 2021 ](https://www.linkedin.com/in/martinlujan-/)