From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH 3/5] dt-bindings: ti-lmu: Modify dt bindings for the
 LM3697
Date: Thu, 4 Apr 2019 14:34:49 -0500
Message-ID: <cdd8693f-8293-6336-6f0a-38a5d4fa7151@ti.com>
References: <20190325142403.30447-1-dmurphy@ti.com>
 <20190325142403.30447-4-dmurphy@ti.com>
 <4e38128a-fa8f-aa94-284f-2c5a4906e17d@gmail.com>
 <83e31761-714d-db83-8c35-cf45243cb50b@ti.com>
 <4983e0b6-ae2b-9d15-0408-fdb23869711a@gmail.com>
 <28007702-cee0-079b-ccda-864f98a7b520@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <28007702-cee0-079b-ccda-864f98a7b520@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, robh+dt@kernel.org, pavel@ucw.cz
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Jacek

On 4/4/19 2:27 PM, Dan Murphy wrote:
<snip>

>>>>
>>>
>>> Actually I was thinking this property could move to common.txt
>>> LM3697 would use it and it is also defined in leds-pwm.txt leds-netxbig.txt
>>
>> It was considered back in 2014 when I was working on LED flash
>> class framework. It was then assessed inappropriate for describing
>> physical property of a device. It needs to be kept in mind that
>> it was in the context of flash LEDs, where currents are much
>> higher than for common LEDs. Since then we have been always using
>> led-max-microamp.
>>
>> With max-brightness in Device Tree there is also another problem -
>> we don't know what it really means - greater allowed current or
>> greater resolution.
>>
>> Why not allow for maximum available brightness resolution for ti-lmu
>> always when the amperage is not an issue?
>>

Missed answering this question.  Full scale ramping only works in 8-bit mode as the
LSB is used for the ramp.  This is why, if the customer does not want ramping and wants full 11 bit control
they can set this parameter for 11 bit brightness control.  Otherwise I default this to the 8 bit control as the preferred
method.

7.3.4.1 8-Bit Control (Preferred)
The preferred operating mode is to control the high-voltage LED brightness by setting the Control Bank LSB
register (3 LSB's) to zero and using only the Control Bank MSB register (8 MSB's). In this mode the LM3697
controls the 3 LSB's to ramp the high-voltage LED current using all 11-bits.

Ramping does work in 11 bit mode but the ramp time may be shorter based on the brightness value set.

Of course the code can be made smarter that if the optional ramp properties are available then set 8 bit automatically
but it cannot assume 11 bit if they are not.

Dan

<snip>

-- 
------------------
Dan Murphy
