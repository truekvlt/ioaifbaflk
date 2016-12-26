//
//  BMManager.h
//  BMlib
//
//  Created by Anton Komissarov on 20/03/16.
//  Copyright © 2016 BrainModes. All rights reserved.
//

#ifndef BMManager_h
#define BMManager_h

//#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "BMEEGData.h"
#import "BMGlobal.h"

/** \enum BM_Status
 *  \brief Ennumerates all the possible BM_Status in the connection sequence, not all are currently being used.
 */
typedef enum {
    BM_Status_Disconnected,
    BM_Status_LostConnection,
    BM_Status_SearchingDevices,
    BM_Status_DeviceSelected,
    BM_Status_Connecting,
    BM_Status_ReConnecting,
    BM_Status_Connected,
    BM_Status_Receiving,
    BM_Status_Processing,
    BM_Status_Stabilizing,
    BM_Status_Stable,
    BM_Status_Calibrating,
    BM_Status_Calibrated
} _BM_Status;

@interface BMManager : NSObject

- (id) init;

/** \fn BMManager* sharedInstance
 *  \brief use this function to instantiate BMManager.
 *  This function only allows to have one object of the class. If this class have already been instanciated before, 
 *  the function will return a pointer to the that previous instance.
 */
+ (BMManager*) sharedInstance;

// getter functions

/** \fn double getLastMetric
 *  \brief provides one last value of specified metric
 *  \param metricType at the moment RELAX_CUMULATIVE, RELAX_MOMENTARY, FOCUS_CUMULATIVE, FOCUS_MOMENTARY are supported
 */
- (double) getLastMetric: (BM_DataType) metricType;

/** \fn double getLastArtifact
 *  \brief provides one last value of artifact
 */
- (double) getLastArtifact;

/** \fn museValues* getMetrics
 *  \brief provides a linked list of new values for specified metric.
 *  \param metricType at the moment RELAX_CUMULATIVE, RELAX_MOMENTARY, FOCUS_CUMULATIVE and FOCUS_MOMENTARY are supported.
 *  \return a linked list of museValues. This list ends with NULL. If there were no new values, NULL is returned.
 */
- (museValues*) getMetrics: (BM_DataType) metricType;

/** \fn museValues* getArtifacts
 *  \brief provides a linked list of new values for artifact.
 *  \return a linked list of museValues. This list ends with NULL. If there were no new values, NULL is returned.
 */
- (museValues*) getArtifacts;
- (rawData*) getEEG;
- (NSArray*) getRecordedDataFromDSP: (BM_DataType) dataType;
- (NSArray*) getRecordedDataFromMuse: (BM_DataType) dataType;

/** \fn float getBatteryLevel
 *  \brief provides battery level of the headset as a float between 0 (empty) and 1 (fully charged)
 */
- (float) getBatteryLevel;

/** \fn int* getContactQuality
 *  \brief Provides contact quality for each channel as an array of integers of size 4. Values can vary from 1 (best contact quality) to 4 (no contact)
 */
- (int*) getContactQuality;

// status functions

/** \fn bool isReceivingDataPackets
 *  \brief Determine if receiving data packets (i.e. EEG, alpha, beta, theta, etc) from the device is blocked (false) or not (true).
 */
- (BOOL) isReceivingDataPackets;

/** \fn bool isLoggingPackets
 *  \brief Determine if logging of packets coming from the devices is activated (true)
 */
- (BOOL) isLoggingPackets;

/** \fn bool isDroppingPackets
 *  \brief Determine if filling data buffers is blocked (true) or not (false)
 */
- (BOOL) isDroppingPackets;

/** \fn bool isHeadsetConnected
 *  \brief Determine if headset is connected (true)
 */
- (BOOL) isHeadsetConnected;

/** \fn bool isCalibrated
 *  \brief Determine if the device has already been calibrated
 */
- (BOOL) isCalibrated;

/** \fn bool isCalibrating
 *  \brief Determine if a calibration is currently in progress
 */
- (BOOL) isCalibrating;

/** \fn bool isProcessing
 *  \brief Determine if the processing module is activated
 */
- (BOOL) isProcessing;

/** \fn bool isConnectionStable
 *  \brief Determine if connection is stable (i.e. at least 2 electrodes have had a connection during last 5 sec)
 */
- (BOOL) isConnectionStable;

// processing management functions

/** \fn void connectToHeadset
 *  \brief Establishes connection to muse headset
 */
- (void) connectToHeadset;

/** \fn void reConnectToHeadset
 *  \brief Tries to reconnect to muse headset
 */
- (void) reConnectToHeadset;

/** \fn void setCalibrationTime
 *  \brief Set the number of seconds to collect packets for computing thresholds.
 *  \param seconds number of seconds to set
 */
- (void) setCalibrationTime: (int) seconds;

/** \fn int getCalibrationTime
 *  \brief Get the number of seconds to collect packets for computing thresholds.
 */
- (int) getCalibrationTime;

/** \fn int  getSecondsReaminingCalibration
 *  \brief Get the remaining number of seconds to collect packets for computing thresholds.
 */
- (int) getSecondsRemainingCalibration;

/** \fn void startCalibration
 *  \brief Sends a signal to processing module to start calibration. The processing module starts in disabled mode
 *  so make sure to call turnProcessingOn function if you didn't already.
 */
- (void) startCalibration;

/** \fn void resetCalibration
 *  \brief Clears calibrated flag thus forcing recalibrating once re-connected.
 */
- (void) resetCalibration;

/** \fn void startReceivingDataPackets
 *  \brief Allows attending incoming data packets (i.e. EEG, alpha, beta, theta, etc).
 *  Contact quality and battery life are not affected (they are always enabled)
 */
- (void) startReceivingDataPackets;

/** \fn void stopReceivingDataPackets
 *  \brief Stops attending incoming data packets (i.e. EEG, alpha, beta, theta, etc)
 *  Contact quality and battery life are not affected (they are always enabled)
 */
- (void) stopReceivingDataPackets;

/** \fn void startLoggingPackets
 *  \brief Allows immediately filling array with data-packets for logging (regardless of the data-stability)
 */
- (void) startLoggingPackets;

/** \fn void stopLoggingPackets
 *  \brief Stops storing data into arrays for logging
 */
- (void) stopLoggingPackets;

/** \fn void startDroppingPackets
 *  \brief Stops filling the buffers.
 */
- (void) startDroppingPackets;

/** \fn void stopDroppingPackets
 *  \brief Allows immediately filling the buffers with data-packets (regardless of the data-stability)
 */
- (void) stopDroppingPackets;

/** \fn void turnProcessingOn
 *  \brief Activate BMProcessor
 */
- (void) turnProcessingOn;

/** \fn void turnProcessingOff
 *  \brief Deactivate BMProcessor
 */
- (void) turnProcessingOff;

/** \fn void setUserId
 *  \brief sets the user id used when saving data
 *
 *  \param userId (alphanumerical)
 */
- (void) setUserId:(NSString *)userId;

// data saving / management functions

/** \fn void clearRecordedDataFromMuse
 *  \brief clear local storage arrays that hold data coming from device.
 *  \param dataType Type of data to clear. Can be RAW, ALPHA, BETA, THETA or ARTIFACT
 */
- (void) clearRecordedDataFromMuse: (BM_DataType) dataType;

/** \fn void clearRecordedDataFromDSP
 *  \brief clear local storage arrays that hold data computed by processing module.
 *  \param dataType Type of data to clear. Can be RELAX_CUMULATIVE, RELAX_MOMENTARY, FOCUS_CUMULATIVE or FOCUS_MOMENTARY
 */
- (void) clearRecordedDataFromDSP: (BM_DataType) dataType;

/** \fn void writeDataToFile
 *  \brief write everything that was collected to the file. If no username was set, the data will be saved
 *          into none.muse file.
 */
- (BOOL) writeDataToFile;

/** \fn void resetNewSession
 *  \brief resets status of the session to new session.
 */
- (void) resetNewSession;

- (void) setDataLabel: (NSString*) label;

/** \fn id updateStatus
 *  \brief Returns the id referred to the current status and launches the connection & calibration
 */
- (int)  updateStatus;

/** \fn bool setBandsForMetric
 *  \brief sets bands and percentiles for specific metric
 *  \param metricType specifies type of metric to be altered. Can be RELAX_MOMENTARY or FOCUS_MOMENTARY
 *  \param bandTypeHi specifies band
 *  \param percentileHi
 *  \param bandTypeLo
 *  \param percentileLo
 *  \return true if success, false otherwise
 */
- (BOOL) setBandsForMetric: (BM_DataType) metricType
                bandTypeHi: (BM_DataType) bandTypeHi
              percentileHi: (double) percentileHi
                bandTypeLo: (BM_DataType) bandTypeLo
              percentileLo: (double) percentileLo;

/** \fn double getThresholdAtIndex
 *  \brief returns threshold from specified cell in thresholds matrix
 *  \param index1 row of thresholds matrix. 0 is relaxation, 1 is concentration
 *  \param index2 column of thresholds matrix. 0 is lower bound, 1 is upper bound.
 *  \return value of specified threshold.
 */
- (double) getThresholdAtIndex1: (int) index1 index2: (int) index2;

/** \fn NSArray* getBandsForMetric
 *  \brief return a 2x2 matrix with bands used for metric computation
 *  \return 2x2 matrix. First row represents relaxation metric, second represents concentration metric.
 */
- (NSArray*) getBandsForMetric;


/** \fn bool updateThresholds
 *  \brief changes thresholds for specified metric by specified value.
 *  \param metricType specifies type of metric to be altered. Can be RELAX_MOMENTARY or FOCUS_MOMENTARY
 *  \param value the value to be added to lower bound and substracted from upper bound.
 *  \return true if thresholds were successfully updated and false otherwise.
 */
- (BOOL) updateThresholds: (BM_DataType) metricType ByValue: (double) value;

/* TODO
 following status functions:
 headset connected (check if the corresponding variable is set to false when headset gets disconnected)
 disconnect from device
 list of headsets
 testing
 
 record contact quality
 record 2 classes of data (for classifier)
 include omar's function.
 
 */

@end

#endif /* BMManager_h */
