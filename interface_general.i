%{
#define SWIG_FILE_WITH_INIT // for numpy
%}

// %include <windows.i>

%include <cpointer.i>
%include <carrays.i>
%include <cmalloc.i>
%include <cdata.i> 

%include <std::string>
%include <std_vector.i>
%include <std_array.i>
%include <std_map.i>
%include <std_pair.i>
%include <std_shared_ptr.i>

%include "numpy.i"

// for %include <cpointer.i>
%pointer_class(int, IntPointer);
%pointer_class(float, FloatPointer);
%pointer_class(double, DoublePointer);
%pointer_class(unsigned char, UnsignedCharPointer);

// for %include <cpointer.i>
%pointer_cast(int*, void*, castIntPointer2VoidPointer);
%pointer_cast(void*, int*, castVoidPointer2IntPointer);

// for %include <carrays.i>
%array_class(int, IntArrayPointer)
%array_class(float, FloatArrayPointer)
%array_class(double, DoubleArrayPointer)
%array_class(unsigned char, UnsignedCharArrayPointer)

// for %include <cmalloc.i>
%allocators(int)
%allocators(float)
%allocators(double)
%allocators(unsigned char)
%allocators(char)

// for %include <std_vector.i>
%template(VectorInt) std::vector<int>;
%template(VectorDouble) std::vector<double>;
%template(VectorFloat) std::vector<float>;
%template(VectorUnsignedChar) std::vector<unsigned char>;
%template(VectorChar) std::vector<char>;
%template(VectorString) std::vector<std::string>;

// for %include "numpy.i"
%init %{
import_array();
%}

%apply (double* IN_ARRAY2, int DIM1, int DIM2) { (double* IN_ARRAY2_1, int DIM1_1, int DIM2_1), (double* IN_ARRAY2_2, int DIM1_2, int DIM2_2), (double* IN_ARRAY2_3, int DIM1_3, int DIM2_3) };
%apply (double* IN_FARRAY2, int DIM1, int DIM2) { (double* IN_FARRAY2_1, int DIM1_1, int DIM2_1), (double* IN_FARRAY2_2, int DIM1_2, int DIM2_2), (double* IN_FARRAY2_3, int DIM1_3, int DIM2_3) };
%apply (double* IN_ARRAY2, int DIM1, int DIM2) { (double* IN_ARRAY2_1, int DIM1_1, int DIM2_1), (double* IN_ARRAY2_2, int DIM1_2, int DIM2_2), (double* IN_ARRAY2_3, int DIM1_3, int DIM2_3) };
%apply (unsigned char** ARGOUTVIEWM_ARRAY3, int* DIM1, int* DIM2, int* DIM3) { (unsigned char** ARGOUTVIEWM_ARRAY3_1, int* DIM1_1, int* DIM2_1, int* DIM3_1), (unsigned char** ARGOUTVIEWM_ARRAY3_2, int* DIM1_2, int* DIM2_2, int* DIM3_2), (unsigned char** ARGOUTVIEWM_ARRAY3_3, int* DIM1_3, int* DIM2_3, int* DIM3_3) }

//for tt in ['double', 'float', 'int', 'unsigned char']:
//    ss = '%apply {} *OUTPUT {{ '.format(tt)
//    for i in range(1, 21):
//        ss += '{} *OUTPUT_{}, '.format(tt, i)
//    ss = ss[:-2] + ' };'
//    print(ss)
%apply double *OUTPUT { double *OUTPUT_1, double *OUTPUT_2, double *OUTPUT_3, double *OUTPUT_4, double *OUTPUT_5, double *OUTPUT_6, double *OUTPUT_7, double *OUTPUT_8, double *OUTPUT_9, double *OUTPUT_10, double *OUTPUT_11, double *OUTPUT_12, double *OUTPUT_13, double *OUTPUT_14, double *OUTPUT_15, double *OUTPUT_16, double *OUTPUT_17, double *OUTPUT_18, double *OUTPUT_19, double *OUTPUT_20 };
%apply float *OUTPUT { float *OUTPUT_1, float *OUTPUT_2, float *OUTPUT_3, float *OUTPUT_4, float *OUTPUT_5, float *OUTPUT_6, float *OUTPUT_7, float *OUTPUT_8, float *OUTPUT_9, float *OUTPUT_10, float *OUTPUT_11, float *OUTPUT_12, float *OUTPUT_13, float *OUTPUT_14, float *OUTPUT_15, float *OUTPUT_16, float *OUTPUT_17, float *OUTPUT_18, float *OUTPUT_19, float *OUTPUT_20 };
%apply int *OUTPUT { int *OUTPUT_1, int *OUTPUT_2, int *OUTPUT_3, int *OUTPUT_4, int *OUTPUT_5, int *OUTPUT_6, int *OUTPUT_7, int *OUTPUT_8, int *OUTPUT_9, int *OUTPUT_10, int *OUTPUT_11, int *OUTPUT_12, int *OUTPUT_13, int *OUTPUT_14, int *OUTPUT_15, int *OUTPUT_16, int *OUTPUT_17, int *OUTPUT_18, int *OUTPUT_19, int *OUTPUT_20 };
%apply unsigned char *OUTPUT { unsigned char *OUTPUT_1, unsigned char *OUTPUT_2, unsigned char *OUTPUT_3, unsigned char *OUTPUT_4, unsigned char *OUTPUT_5, unsigned char *OUTPUT_6, unsigned char *OUTPUT_7, unsigned char *OUTPUT_8, unsigned char *OUTPUT_9, unsigned char *OUTPUT_10, unsigned char *OUTPUT_11, unsigned char *OUTPUT_12, unsigned char *OUTPUT_13, unsigned char *OUTPUT_14, unsigned char *OUTPUT_15, unsigned char *OUTPUT_16, unsigned char *OUTPUT_17, unsigned char *OUTPUT_18, unsigned char *OUTPUT_19, unsigned char *OUTPUT_20 };




%include "exception.i"

%exception { 
    try { 
        $action 
    } catch (const std::exception &e) { 
        SWIG_exception(SWIG_RuntimeError, e.what()); 
    } 
} 

%include "header.h"