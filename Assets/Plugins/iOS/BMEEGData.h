/** \file EEGData.h
 *  \brief C header file defining structs used for buffers.
 *
 *  The main struct is abtData, which consists of several structs
 *  abtValue for each type of data and one dspOuput for the processed data.
 *  The buffers are initiated inside of MuseManager Class
 */

#ifndef EEGDATA_H_
#define EEGDATA_H_

typedef struct _museValues museValues;

/** \struct _abtValues
 *  \brief A struct for storing different types of data.
 *
 *  The struct has necessary properties for a circular buffer and consists of
 *  a pointer to the next element (museValues* next), a variable to store the
 *  value (float value), and a timestamp (double timestamp). The timestamp
 *  is also used for feedback between modules, i.e. LoggingListener Class
 *  only writes into an element, if timestamp equals -1 and BMProcessor Class
 *  only reads an element, if timestamp if bigger, than the last it has read.
 */

struct _museValues {
    museValues* next;        /**< \brief pointer to the next element of buffer. */
    double timestamp;       /**< \brief timestamp of packet on arrival. */
    double value;            /**< \brief alpha, beta or theta value from muse (average of all channels). */
};

typedef struct _rawData rawData;

struct _rawData {
    rawData* next;
    double timestamp;
    double value[4];
};

typedef struct _dspOutput dspOutput;

/** \struct _dspOutput
 *  \brief A struct for storing processed data from BMProcessor Class
 *
 *  The struct holds values of computed thresholds for each type of data,
 *  averages of each type of data over a window of certain size as well as
 *  timestamps of each data type which is the first package in such window.
 *  newAlpha, newBeta and newTheta are used to notify LoggingListener
 *  Class, that those were update by BMProcessor Class.
 */

struct _dspOutput {
    museValues* avgAlphas,
              * avgBetas,
              * avgThetas;
    
    museValues* relaxMomens,        /**< \brief buffer for momentary values for relaxation metric */
              * relaxCumuls,        /**< \brief buffer for cumulative values for relaxation metric */
    
              * focusMomens,        /**< \brief buffer for momentary values for concentration metric */
              * focusCumuls;        /**< \brief buffer for cumulative values for concentration metric */
    
    double thresholds[2][2];         /**< \brief alpha, beta and theta thresholds computed by BMProcessor (first row for relaxation metic, second row for concentration metric) */
    //double thresholdsLo[3];         /**< \brief alpha, beta and theta thresholds computed by BMProcessor (lower percentile) */
    
    
    //double  alphaThresholdRelax,           /**< \brief alpha threshold computed by BMProcessor (relaxation metric) */
    //        betaThresholdRelax,            /**< \brief  beta threshold computed by BMProcessor (relaxation metric) */
    //        thetaThresholdRelax,           /**< \brief theta threshold computed by BMProcessor (relaxation metric) */
    
    //        alphaThresholdFocus,           /**< \brief alpha threshold computed by BMProcessor (concentration metric) */
    //        betaThresholdFocus,            /**< \brief  beta threshold computed by BMProcessor (concentration metric) */
    //        thetaThresholdFocus;           /**< \brief theta threshold computed by BMProcessor (concentration metric) */
};


typedef struct _museData museData;

/** \struct _abtData
 *  \brief A struct that holds pointers to other structs
 *
 *  This struct is supposed to make forwarding of buffers easier by
 *  by keeping them all together
 */

struct _museData {
    short museConnected;   /**< \brief 1 if a headset is connected and 0 if not. */
    short museStable;      /**< \brief represents stability of connection. Can be 0 or 1. */
    short museCalibrated;  /**< \brief 1 if already calibrated and 0 if not. */
    float battLevel;       /**< \brief Battery level from 0 to 1. */
    int contactQuality[4]; /**< \brief Contact Quality for 4 channels */
    
    museValues* alphas,  /**< \brief pointer to buffer for alpha band values from muse (average of all channels) */
              * betas,   /**< \brief pointer to buffer for  beta band values from muse (average of all channels) */
              * thetas;  /**< \brief pointer to buffer for theta band values from muse (average of all channels) */
    
    museValues* artifact;
    dspOutput* dspOut;  /**< \brief pointer a struct holding values computed by BMProcessor */
    rawData* rawEEG;
};

#endif // EEGDATA_H_
