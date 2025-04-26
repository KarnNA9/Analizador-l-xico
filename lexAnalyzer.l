%option noyywrap // NO QUITAR
%{
#include <stdio.h>

#define COMMENT 400
#define floatdcl 401
#define intdcl 402
#define fnum 403
#define inum 404
#define print 405
#define id 406
#define assign 407
#define plus 408

extern FILE *yyin; 
%}
%%
[ \t]+                 ;
\/\/[^\n]*              { return COMMENT; }
f                       { return floatdcl; }
i                       { return intdcl; }
[0-9]+\.[0-9]+       |
\.[0-9]+                { return fnum; }
[0-9]+                  { return inum; }
print                   { return print; }
[a-zA-Z]                { return id; }
=                       { return assign; }
\+                      { return plus; }
\n                      { return '\n'; }
%%


int main(int argc, char *argv[])
{
    int val;
    FILE *out;

    yyin = fopen("entrada.txt", "r");
    if (!yyin) {
        perror("No se pudo abrir entrada.txt");
        return 1;
    }

    out = fopen("salida.txt", "w");
    if (!out) {
        perror("No se pudo abrir salida.txt");
        fclose(yyin);
        return 1;
    }

    while ((val = yylex())) {
        if (val == '\n') {
            fprintf(out, "\n"); // Cuando veas un salto de línea, escribe uno
            continue;
        }
        switch (val) {
            case COMMENT:
                fprintf(out, "COMMENT ");
                break;
            case floatdcl:
                fprintf(out, "floatdcl ");
                break;
            case intdcl:
                fprintf(out, "intdcl ");
                break;
            case fnum:
                fprintf(out, "fnum ");
                break;
            case inum:
                fprintf(out, "inum ");
                break;
            case assign:
                fprintf(out, "assign ");
                break;
            case plus:
                fprintf(out, "plus ");
                break;
            case print:
                fprintf(out, "print ");
                break;
            case id:
                fprintf(out, "id ");
                break;
            default: // Esto no debería apareces (Dios mediante)
                fprintf(out, "OTHER(%d) ", val);
                break;
        }
    }
    fclose(yyin);
    fclose(out);
    return 0;
}
