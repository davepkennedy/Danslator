#include <Python/Python.h>
#include <sstream>

#include "driver.h"

PyDoc_STRVAR (Danslator_module_documentation, "A toddler->adult translation module");

static PyObject* Py_TransError;
static void
translation_error (const char* msg)
{
    PyErr_SetString (Py_TransError, msg);
}

PyDoc_STRVAR (Danslator_translate_documentation, "Translate a toddler sentence");
static PyObject*
Danslator_translate (PyObject* self, PyObject* args) {
    char* toddler_speak;
    if (!PyArg_ParseTuple (args, "s", &toddler_speak)) {
        return NULL;
    }
    
    std::istringstream input (toddler_speak);
    std::ostringstream output;

    Driver driver (&input, &output);
    driver.parse ();
    if (driver.hasError ())
    {
        translation_error (driver.getError ().c_str ());
        return NULL;
    }
    return Py_BuildValue ("s", output.str ().c_str ());
}

static struct PyMethodDef Danslator_methods [] = {
    {"translate", Danslator_translate, METH_VARARGS, Danslator_translate_documentation},
    {NULL, NULL}
};

extern "C" {
void
initDanslator (void) {
    Py_InitModule4 (
        "Danslator",
        Danslator_methods,
        Danslator_module_documentation,
        NULL,
        PYTHON_API_VERSION);
    Py_TransError = PyErr_NewException ("Danslator.ParseError", NULL, NULL);
}
}
