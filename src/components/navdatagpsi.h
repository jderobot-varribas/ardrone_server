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

#ifndef NAVDATAGPSI_H
#define NAVDATAGPSI_H

#include "ardrone_server/ardrone_sdk.h"
#include <jderobot/navdatagps.h>



namespace ardrone {
namespace navdatagps {

class NavdataGPSI: virtual public jderobot::NavdataGPS
{
public:
    NavdataGPSI();
    virtual ~NavdataGPSI();
    virtual jderobot::NavdataGPSData getNavdataGPS(Ice::Current const & c);

private:
    jderobot::NavdataGPSData gpsdata_defaults_;
};

}//NS
}//NS

#endif // NAVDATAGPSI_H
