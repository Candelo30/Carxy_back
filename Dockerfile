FROM python:3.9-slim

# Instalar dependencias del sistema para MySQL y otros paquetes
RUN apt-get update && apt-get install -y \
    default-libmysqlclient-dev \
    build-essential \
    gcc \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Crear un entorno virtual
ENV NIXPACKS_PATH=/opt/venv/bin:$NIXPACKS_PATH
RUN python -m venv --copies /opt/venv

# Activar el entorno virtual e instalar las dependencias de Python
COPY . /app/.
WORKDIR /app
RUN . /opt/venv/bin/activate && pip install --upgrade pip && pip install -r requirements.txt

# Comando por defecto para ejecutar la aplicación
CMD ["/opt/venv/bin/python", "manage.py", "runserver", "0.0.0.0:8000"]
