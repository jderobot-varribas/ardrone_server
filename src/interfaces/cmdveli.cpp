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
 *       Alberto Martín Florido <almartinflorido@gmail.com>	
 */

#include "ardrone_server/interfaces/cmdveli.h"

namespace cmdvel
{
	CMDVelI::CMDVelI()
	{
		std::cout << "cmdvel start" << std::endl;

	}
	
	CMDVelI::~CMDVelI()
	{
	
	}
	
	Ice::Int CMDVelI::setCMDVelData(jderobot::CMDVelDataPtr const & data, Ice::Current const & c)
	{
		setCMDVel(data);
	}
}



