import random

def generar_imei():
    numeroAleatorio = "".join([str(random.randint(0,9)) for _ in range(15)])
    return numeroAleatorio
