#include "mex.h"
#include "eigenmex.h"

using namespace Eigen;
using namespace std;

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[]){
    if(nrhs!=1){ mexErrMsgTxt("nrhs!=1"); return; }
    /// Input
    ConstMatrixWrap I_size = wrap(prhs[0]); ///< output image size
    // ConstMatrixWrap I = wrap(prhs[0]); ///< one patch per column
    /// Output
    MatrixWrap I = wrap(plhs[0]=mxCreateDoubleMatrix((int) I_size(0), (int) I_size(1), mxREAL));
      
    for(int col=0; col<I.cols(); col++)
        for(int row=0; row<I.rows(); row++)
            I(row,col) = (col > I.cols()/2) ? 1.0 : 0.0;
}






















