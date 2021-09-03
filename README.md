# Compilador para evaluar expresiones booleanas

Este compilador se le ingresan expresiones booleanas y devolverá t o f haciendo referencia
a falso o verdadero.

## Ejemplos

### AND

```
t ^ f
```
### OR

```
t v f
```
### NOT

```
-f
```

### Expresiones complejas

```
-(tvf) ^ f v (fv(--t))
```