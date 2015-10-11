/*
 *  Copyright (C) 1997-2015 JDE Developers Team
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see http://www.gnu.org/licenses/.
 *  Authors :
 *       Victor Arribas Raigadas <.varribas.urjc@gmail.com>
 */

#ifndef ARDRONE_NAVDATAGPS_ICE
#define ARDRONE_NAVDATAGPS_ICE

/*
byte  8 bits
short 16 bits
int   32 bits
long  64 bits
*/

module jderobot{
module ardrone {

    const byte N_CHANNELS = 12;

    struct SatelliteInfo{
        byte sat;    /* Satellite ID */
        byte c_n0;   /* Satellite C/N0 */
    };
    sequence<SatelliteInfo> Satellites;

    class NavdataGPSData
    {
        short tag;
        short size;
        double latitude;
        double longitude;
        double elevation;
        double hdop;
        int   data_available;
        bool zero_validated;
        bool wpt_validated;
        double lat0;
        double long0;
        double lat_fused;
        double long_fused;

        int gps_state;

        float X_traj;
        float X_ref;
        float Y_traj;
        float Y_ref;

        float theta_p;
        float phi_p;
        float theta_i;
        float phi_i;
        float theta_d;
        float phi_d;

        double vdop;
        double pdop;

        float speed;
        int  lastFrameTimestamp;
        float degree;
        float degree_magnetic;
        float ehpe;
        float ehve;

        float c_n0;  /* Signal to noise ratio (average of the four best satellites) */
        int  nbsat;  /* Number of acquired satellites */
        Satellites channels;

        bool is_gps_plugged;
        int ephemerisStatus;

        float vx_traj;
        float vy_traj;


        int firmwareStatus;

    };

    interface NavdataGPS {
        idempotent NavdataGPSData getNavdataGPS();
    };


}; //ardrone
}; //jderobot
#endif
