From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [RFC PATCH] leds: multicolor: Add sysfs interface definition
Date: Wed, 30 Jan 2019 13:59:33 -0600
Message-ID: <333a146a-a469-5b72-5e81-ff7f522dc598@ti.com>
References: <20190130183005.833-1-dmurphy@ti.com>
 <f3792d44-1a43-318b-1b12-d6d69275c3a8@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f3792d44-1a43-318b-1b12-d6d69275c3a8@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, robh+dt@kernel.org, pavel@ucw.cz
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Jacek

On 1/30/19 1:37 PM, Jacek Anaszewski wrote:
> Hi Dan,
> 
> Thank you for the RFC.
> 
> One vital thing is missing - documentation of brightness file must
> be updated to define its semantics for LED multi color class.
> 
> Either we need brightness-model file returning only "onoff" option
> available, or, for time being, fix the max_brightness for LED multi
> color class to 1 (which will map to max intensity level for each color).
> 

I can make max_brightness default to 1 if not set by the LED driver.

But the LP50xx has brightness controls so setting max_brightness from the driver should over ride
the max of 1 in the upper level.  

For devices that do not support brightness as a separate control we can create a file called
max_brightness_<color> that defines the max that a specific color can be set to.  If max_brightness
is set to 1 then create max_brightness_<color>.  If max_brightness > 1 then do not create the files.

I don't think we have fully vetted the brightness-model yet so I prefer to omit
it and possibly introduce that later.

Dan

> Best regards,
> Jacek Anaszewski
> 
> On 1/30/19 7:30 PM, Dan Murphy wrote:
>> Add a documentation of LED Multicolor LED class specific
>> sysfs attributes.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>   .../ABI/testing/sysfs-class-led-multicolor    | 38 +++++++++++++++++++
>>   1 file changed, 38 insertions(+)
>>   create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor
>>
>> diff --git a/Documentation/ABI/testing/sysfs-class-led-multicolor b/Documentation/ABI/testing/sysfs-class-led-multicolor
>> new file mode 100644
>> index 000000000000..19f8da9b150e
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-class-led-multicolor
>> @@ -0,0 +1,38 @@
>> +What:        /sys/class/leds/<led>/color/sync_enable
>> +Date:        January 2019
>> +KernelVersion:    5.0
>> +Contact:    Dan Murphy <dmurphy@ti.com>
>> +Description:    read/write
>> +        Writing a 1 to this file will enable the sychronization of all
>> +        the defined color LEDs within the LED node.  Writing a 0 to
>> +        this file will disable syncing.
>> +
>> +What:        /sys/class/leds/<led>/color/sync
>> +Date:        January 2019
>> +KernelVersion:    5.0
>> +Contact:    Dan Murphy <dmurphy@ti.com>
>> +Description:    write only
>> +        Writing a 1 to this file while sync_enable is set to 1 will
>> +        synchronize all defined LEDs within the LED node.  All LEDs
>> +        defined will be configured based on the brightness that has
>> +        been requested.
>> +
>> +        If sync_enable is set to 0 then writing a 1 to sync has no
>> +        affect on the LEDs.
>> +
>> +What:        /sys/class/leds/<led>/color/<led color>
>> +Date:        January 2019
>> +KernelVersion:    5.0
>> +Contact:    Dan Murphy <dmurphy@ti.com>
>> +Description:    read/write
>> +        These files are dynamically created based on the colors defined
>> +        by the registrar of the class.
>> +        The led color(s) can be but not limited to red, green, blue,
>> +        white, amber and violet.  If sync is enabled then writing the
>> +        brightness value of the LED is deferred until a 1 is
>> +        written to /sys/class/leds/<led>/color/sync.  If syncing is
>> +        disabled then the LED brightness value will be written
>> +        immediately to the LED driver.
>> +
>> +        The value of the color is from 0 to
>> +        /sys/class/leds/<led>/max_brightness.
>>
> 


-- 
------------------
Dan Murphy
