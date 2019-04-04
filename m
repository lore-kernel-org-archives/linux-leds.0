From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 3/5] dt-bindings: ti-lmu: Modify dt bindings for the
 LM3697
Date: Thu, 4 Apr 2019 20:39:41 +0200
Message-ID: <4983e0b6-ae2b-9d15-0408-fdb23869711a@gmail.com>
References: <20190325142403.30447-1-dmurphy@ti.com>
 <20190325142403.30447-4-dmurphy@ti.com>
 <4e38128a-fa8f-aa94-284f-2c5a4906e17d@gmail.com>
 <83e31761-714d-db83-8c35-cf45243cb50b@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <83e31761-714d-db83-8c35-cf45243cb50b@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>, robh+dt@kernel.org, pavel@ucw.cz
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Dan,

On 4/3/19 10:23 PM, Dan Murphy wrote:
> Jacek
> 
> On 4/3/19 3:10 PM, Jacek Anaszewski wrote:
>> Hi Dan,
>>
>> Thank you for the patch.
>>
>> You need Lee Jones on CC for this series.
>>
> 
> Yes I saw I missed Lee.
> 
>> One more comment below.
>>
>> On 3/25/19 3:24 PM, Dan Murphy wrote:
>>> The LM3697 is a single function LED driver. The single function LED
>>> driver needs to reside in the LED directory as a dedicated LED driver
>>> and not as a MFD device.  The device does have common brightness and ramp
>>> features and those can be accomodated by a TI LMU framework.
>>>
>>> The LM3697 dt binding needs to be moved from the ti-lmu.txt and a dedicated
>>> LED dt binding needs to be added.  The new LM3697 LED dt binding will then
>>> reside in the Documentation/devicetree/bindings/leds directory and follow the
>>> current LED and general bindings guidelines.
>>>
>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>> ---
>>>    .../devicetree/bindings/leds/leds-lm3697.txt  | 77 +++++++++++++++++++
>>>    .../devicetree/bindings/mfd/ti-lmu.txt        | 26 +------
>>>    2 files changed, 78 insertions(+), 25 deletions(-)
>>>    create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3697.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/leds/leds-lm3697.txt b/Documentation/devicetree/bindings/leds/leds-lm3697.txt
>>> new file mode 100644
>>> index 000000000000..a780f11acd38
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/leds/leds-lm3697.txt
>>> @@ -0,0 +1,77 @@
>>> +* Texas Instruments - LM3697 Highly Efficient White LED Driver
>>> +
>>> +The LM3697 11-bit LED driver provides high-
>>> +performance backlight dimming for 1, 2, or 3 series
>>> +LED strings while delivering up to 90% efficiency.
>>> +
>>> +This device is suitable for display and keypad Lighting
>>> +
>>> +Required properties:
>>> +    - compatible:
>>> +        "ti,lm3697"
>>> +    - reg :  I2C slave address
>>> +    - #address-cells : 1
>>> +    - #size-cells : 0
>>> +
>>> +Optional properties:
>>> +    - enable-gpios : GPIO pin to enable/disable the device
>>> +    - vled-supply : LED supply
>>> +
>>> +Required child properties:
>>> +    - reg : 0 - LED is Controlled by bank A
>>> +        1 - LED is Controlled by bank B
>>> +    - led-sources : Indicates which HVLED string is associated to which
>>> +            control bank.  This is a zero based property so
>>> +            HVLED1 = 0, HVLED2 = 1, HVLED3 = 2.
>>> +            Additional information is contained
>>> +            in Documentation/devicetree/bindings/leds/common.txt
>>> +
>>> +Optional child properties:
>>> +    - max_brightness - This determines whether to use 8 bit brightness mode
>>> +               or 11 bit brightness mode.  If this value is not
>>> +               set the device is defaulted to the preferred 8bit
>>> +               brightness mode per 7.3.4.1 of the data sheet.
>>> +               The values are 255 (8bit) or 2047 (11bit).
>>
>> We should use led-max-microamp for that, if possible.
>>
> 
> Actually I was thinking this property could move to common.txt
> LM3697 would use it and it is also defined in leds-pwm.txt leds-netxbig.txt

It was considered back in 2014 when I was working on LED flash
class framework. It was then assessed inappropriate for describing
physical property of a device. It needs to be kept in mind that
it was in the context of flash LEDs, where currents are much
higher than for common LEDs. Since then we have been always using
led-max-microamp.

With max-brightness in Device Tree there is also another problem -
we don't know what it really means - greater allowed current or
greater resolution.

Why not allow for maximum available brightness resolution for ti-lmu
always when the amperage is not an issue?


> But I could rename it to led-max-microamp and figure out an algo to convert to max brightness
> 
> Dan
> 

-- 
Best regards,
Jacek Anaszewski
