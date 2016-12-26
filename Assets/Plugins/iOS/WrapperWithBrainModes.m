//
//  WrapperWithBrainModes.m
//  WrapperWithBrainModes
//
//  Created by Jessica Palmer on 06/04/16.
//  Copyright © 2016 Jessica Palmer. All rights reserved.
//
// ** README **
//
// This is a wrapper for the BrainModes Library
// This needs to be wrapped in C# to be used in Unity.


#import <Foundation/Foundation.h>
#import "BMManager.h"
#import "BMGlobal.h"
#import "BMEEGData.h"


BMManager* BMManInstance;

// ** VITAL FUNCTIONS **

// This function must be executed on initiation
// It is required to use the BrainModes library
// Ex. In Unity, make a script run OnStart() call this function

void bmInit() {
    
    BMManInstance = [BMManager sharedInstance];
    [BMManInstance connectToHeadset];
    // For allowing logging data packets, i.e. alphas_from_muse
    [BMManInstance startLoggingPackets];
    [BMManInstance turnProcessingOn];
    [BMManInstance setUserId:@"demo"];
    //[BMManInstance startCalibration];
    
    NSLog(@"BMLib initiated");
}

// Example of a connection-control routine
// Shows how to chain the BM functions
// to allow rapid connection/reconnection
int bmUpdate() {
    //first checking connection status
    if (![BMManInstance isHeadsetConnected])
    {
        //already working, then lost connection
        if ([BMManInstance isReceivingDataPackets])
        {
            NSLog(@"Status: headset disconnected.");
            [BMManInstance reConnectToHeadset];
            /* forces recalibrating once reconnecting */
            //[self resetCalibration];
            return BM_Status_LostConnection;
        }
        else
        {
            //not connected yet
            [BMManInstance connectToHeadset];
            NSLog(@"Status: headset connecting.");
            return BM_Status_Connecting;
        }
    }
    else
    {
        if (![BMManInstance isReceivingDataPackets])
        {
            [BMManInstance startReceivingDataPackets];
            NSLog(@"Status: headset receiving packets.");
            return BM_Status_Receiving;
        }
        
        if (![BMManInstance isProcessing])
        {
            [BMManInstance turnProcessingOn];
            NSLog(@"Status: headset processing.");
            return BM_Status_Processing;
        }
        
        if (![BMManInstance isCalibrated])
        {
            if ([BMManInstance isConnectionStable])
            {
                if ([BMManInstance isCalibrating])
                {
                    //NSLog(@"Status: starting calibration.");
                    if ([BMManInstance getSecondsRemainingCalibration]==0)
                        [BMManInstance setDataLabel:@"Calibration Finished"];
                    return BM_Status_Calibrating; // calibrating
                }
                else
                {
                    //nothing, we wait until the user requests calibration
                    NSLog(@"Status: waiting for the UI-client to launch calibration.");
                    return BM_Status_Stable; // starting calibration
                }
            }
            else
            {
                NSLog(@"Status: Waiting the signals to become stable.");
                return BM_Status_Stabilizing; // just waiting for the connection to be stable
            }
        }
        else {
            return BM_Status_Calibrated;
        }
    }
}

// ** UTILITY FUNCTIONS **

// This function will start calibration
// Metric will be available if calibration was successful
// Calibration can only be executed if the device is stable
void bmCalibrate() {
    [BMManInstance startCalibration];
    [BMManInstance setDataLabel:@"Starting Calibration"];
}

// This will return the cumulative value of the metic
// In this case, it's "RELAX_CUMULATIVE"
// Returns float from 0 - 1
// 0 = min relaxation // 1 = max relaxation
// will also return 0 if calibration has not been completed

// TODO: THIS IS DEPRECIATED! ** PLEASE USE bmRelaxCumulative()

float bmCumulative() {
    if (bmUpdate()==BM_Status_Calibrated)
        return [BMManInstance getLastMetric:RELAX_CUMULATIVE];
    else
        return 0;
}

// This will return the cumulative value of the relax metic
// Returns float from 0 - 1
// 0 = min relaxation // 1 = max relaxation
float bmRelaxCumulative() {
    return [BMManInstance getLastMetric:RELAX_CUMULATIVE];
}

// This will return the cumulative value of the focus metic
// Returns float from 0 - 1
// 0 = min foxus // 1 = max focus
float bmFocusCumulative() {
    return [BMManInstance getLastMetric:FOCUS_CUMULATIVE];
}

// ** SIMPLE STATUS FUNCTIONS  **

// Bool whether a headset is connected
BOOL isHeadsetConnected() {
    return [BMManInstance isHeadsetConnected];
}

// Bool whether BM is getting packets from the headset
BOOL isReceivingDataPackets() {
	return [BMManInstance isReceivingDataPackets];
}

// Bool whether the user is calibrated
BOOL isCalibrated() {
    return [BMManInstance isCalibrated];
}
    
// Bool whether the user is in the process of calibrating
BOOL isCalibrating() {
    return [BMManInstance isCalibrating];   
}

// Bool whether BM is successfully processing EEG
BOOL isProcessing() {
    return [BMManInstance isProcessing]; 
}  
    
// Bool whether BM connection is stable
BOOL isConnectionStable() {
    return [BMManInstance isConnectionStable];   
}

// ** DATA SAVING FUNCTIONS **

// Write all the data of the session to file
// The file is stored in iTunes as a text file
// To access, iTunes > device > apps > BM > drag text file to computer > open
void bmWriteDataToFile(){
    [BMManInstance writeDataToFile];
    
}

// IDK if this is correct... hope it works.
// Set a data label for the saved data.
void setDataLabel(char *label){
    
    [BMManInstance setDataLabel: [NSString stringWithUTF8String:label]];
     
     }

// ** THIS IS DEPRECIATED! ** PLEASE USE: a metric function
// NOTE: IS THIS BEING USED? REMOVE IF NOT IN USE. IDK
float theGemFloat() {
    return 0.0f;
    /*float diff = (float) 1.0 - (float) 0.0;
     return (((float) (arc4random() % ((unsigned)RAND_MAX + 1)) / RAND_MAX) * diff) + (float) 0.0;*/
}

// ** DETAILED STATUS FUNCTIONS **

// Returns a value for battery life
// Returns value from 0 - 1
float bmBatteryLife() {
    return [BMManInstance getBatteryLevel];
}

// Returns contact quality per electrode. There are 4.
// Pass 0 - 3 to this function to get the contact for each sensor.
// Contact quality can be an int from 1-4
// 1 = best contact, 4 = no contact
int bmContactQuality(const int channel) {
    return [BMManInstance getContactQuality][channel];
}

// Returns if there is an artefact
// 0 = no artefact
// 1 = blink
int bmArtifact() {
    return [BMManInstance getLastArtifact];
}


// Decreases the combined threshold
BOOL thresholdsDown() {
    return [BMManInstance updateThresholds:RELAX_MOMENTARY ByValue:-0.025];
    return [BMManInstance updateThresholds:FOCUS_MOMENTARY ByValue:+0.025];
}

// Increases the combined threshold
BOOL thresholdsUp() {
    return [BMManInstance updateThresholds:RELAX_MOMENTARY ByValue:+0.025];
    return [BMManInstance updateThresholds:FOCUS_MOMENTARY ByValue:-0.025];
}


// Returns the remaining calibration time in seconds
int bmSecondsRemainingCalibration() {
    return [BMManInstance getSecondsRemainingCalibration];
}

double getThreshold(int ind1, int ind2) {
    return [BMManInstance getThresholdAtIndex1: ind1 index2: ind2];
}

// get status
int bmUpdateStatus(){
	return [BMManInstance updateStatus];
}
