From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] Add attributes neccessary for LED flashes to
 devicetree/bindings/leds/common.txt
Date: Fri, 21 Nov 2014 08:38:33 +0100
Message-ID: <546EEBF9.9080006@samsung.com>
References: <20141120131713.GC27527@amd>
 <20141120150349.GZ8907@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-reply-to: <20141120150349.GZ8907@valkosipuli.retiisi.org.uk>
Sender: linux-doc-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, linux-doc@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net
List-Id: linux-leds@vger.kernel.org

Hi Pavel, Sakari,

On 11/20/2014 04:03 PM, Sakari Ailus wrote:
> Hi Pavel,
>
> On Thu, Nov 20, 2014 at 02:17:13PM +0100, Pavel Machek wrote:
>>
>> Add attributes neccessary for LED flashes to
>> devicetree/bindings/leds/common.txt .
>>
>> This will allow me to add device tree support for adp1653 i2c flash
>> LED driver, and allow Jacek Anaszewski to add support for more LED
>> drivers..
>>
>> Signed-off-by: Pavel Machek <pavel@ucw.cz>
>>
>> diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
>> index 2d88816..e9acbbc 100644
>> --- a/Documentation/devicetree/bindings/leds/common.txt
>> +++ b/Documentation/devicetree/bindings/leds/common.txt
>> @@ -14,6 +14,15 @@ Optional properties for child nodes:
>>        "ide-disk" - LED indicates disk activity
>>        "timer" - LED flashes at a fixed, configurable rate
>>
>> +- max-microamp : maximum intensity in microamperes of the LED
>> +  	         (torch LED for flash devices)
>> +- flash-max-microamp : maximum intensity in microamperes of the
>> +                       flash LED; it is mandatory if the LED should
>> +		       support the flash mode
>> +- flash-timeout-microsec : timeout in microseconds after which the flash
>> +                           LED is turned off
>
> It might be good to add a note that these may be arrays, depending on the
> device.
>

This binding is for a sub-node representing a single led.
Do you know devices which would require an array of max currents
for a sub-led?

Regards,
Jacek
