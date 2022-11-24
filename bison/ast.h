#include <stdlib.h>
typedef struct _ast ast;
typedef ast* pAst;

struct _ast {

  pAst l;
  pAst r;
  pAst n;
};


