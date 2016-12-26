//
//  Global.h
//  brainScores
//
//  Created by BrainModes on 09/01/16.
//  Copyright © 2016 Adalberto Llarena. All rights reserved.
//

/*Used to defined the defualt parameters used when compiling the library*/

#ifndef Global_h
#define Global_h

#define HISTORY_SIZE 30 //seconds of past history
#define SECONDS_CALIB 30 //seconds for initial calibration
#define SECONDS_AVERAGE 1 // Period of time to be averaged by BMProcessor

#define MUSE_MIN_SECONDS_STABLE 3
#define MUSE_MIN_CONNECTED_SENSORS 2

#define CURR_METRIC_REWARD 0.002f*50.0f
#define CURR_METRIC_PUNISH -0.002f*50.0f

// buffer sizes
#define CUMULATIVE_BUFFER_SIZE 61
#define AVERAGE_OUTPUT_BUFFER_SIZE 61
#define MOMENTARY_BUFFER_SIZE 61
#define RAW_DATA_BUFFER_SIZE 301
#define INPUT_BUFFER_SIZE 61

// test
//#define _TEST_LIB 1 // 1 for testing the whole lib

typedef enum {
    RAW, ALPHA, BETA, THETA, RELAX_MOMENTARY, RELAX_CUMULATIVE, FOCUS_MOMENTARY, FOCUS_CUMULATIVE, ARTIFACT
} BM_DataType;

typedef enum {
    BASIC, LINEAR
} BM_MetricClassifier;



#endif /* Global_h */
