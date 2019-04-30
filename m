From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v3 5/7] dt-bindings: ti-lmu: Modify dt bindings for the
 LM3697
Date: Tue, 30 Apr 2019 17:07:32 -0500
Message-ID: <34f72f44-9385-a42a-4e44-94ae6a04fe98@ti.com>
References: <20190430191730.19450-1-dmurphy@ti.com>
 <20190430191730.19450-6-dmurphy@ti.com> <20190430220527.GC20410@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190430220527.GC20410@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
List-Id: linux-leds@vger.kernel.org



On 4/30/19 5:05 PM, Pavel Machek wrote:
> On Tue 2019-04-30 14:17:28, Dan Murphy wrote:
>> The LM3697 is a single function LED driver. The single function LED
>> driver needs to reside in the LED directory as a dedicated LED driver
>> and not as a MFD device.  The device does have common brightness and ramp
>> features and those can be accomodated by a TI LMU framework.
>>
>> The LM3697 dt binding needs to be moved from the ti-lmu.txt and a dedicated
>> LED dt binding needs to be added.  The new LM3697 LED dt binding will then
>> reside in the Documentation/devicetree/bindings/leds directory and follow the
>> current LED and general bindings guidelines.
>>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>
>> v3 - No changes added Reviewed-by Rob - https://lore.kernel.org/patchwork/patch/1058762/
>>
>> v2 - Made changes to reference ti,brightness-resolution to the ti-lmu.txt -
>> https://lore.kernel.org/patchwork/patch/1054501/
>>
>>  .../devicetree/bindings/leds/leds-lm3697.txt  | 73 +++++++++++++++++++
>>  .../devicetree/bindings/mfd/ti-lmu.txt        | 27 +------
>>  2 files changed, 74 insertions(+), 26 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3697.txt
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-lm3697.txt b/Documentation/devicetree/bindings/leds/leds-lm3697.txt
>> new file mode 100644
>> index 000000000000..02378f33c9ab
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/leds-lm3697.txt
>> @@ -0,0 +1,73 @@
>> +* Texas Instruments - LM3697 Highly Efficient White LED Driver
>> +
>> +The LM3697 11-bit LED driver provides high-
>> +performance backlight dimming for 1, 2, or 3 series
>> +LED strings while delivering up to 90% efficiency.
>> +
>> +This device is suitable for display and keypad Lighting
> 
> "lightning."

Heh.  Don't think you meant lightning but I get what you are saying

s/Lighting/lighting

Dan

> 									Pavel
> 
