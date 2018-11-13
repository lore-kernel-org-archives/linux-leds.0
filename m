From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 04/24] dt-bindings: leds: Add function and color
 properties
Date: Tue, 13 Nov 2018 21:57:21 +0100
Message-ID: <dfb5bd23-bcb9-7501-a608-969cb0464168@gmail.com>
References: <1541542052-10081-1-git-send-email-jacek.anaszewski@gmail.com>
 <1541542052-10081-5-git-send-email-jacek.anaszewski@gmail.com>
 <5bea0eb8.1c69fb81.6b921.80e6@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5bea0eb8.1c69fb81.6b921.80e6@mx.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, Baolin Wang <baolin.wang@linaro.org>, Daniel Mack <daniel@zonque.org>, Dan Murphy <dmurphy@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Oleh Kravchenko <oleg@kaa.org.ua>, Sakari Ailus <sakari.ailus@linux.intel.com>, Simon Shields <simon@lineageos.org>, Xiaotong Lu <xiaotong.lu@spreadtrum.com>
List-Id: linux-leds@vger.kernel.org

On 11/12/2018 07:27 PM, Rob Herring wrote:
> On Tue, Nov 06, 2018 at 11:07:12PM +0100, Jacek Anaszewski wrote:
>> Introduce dedicated properties for conveying information about
>> LED function and color. Mark old "label" property as deprecated.
>>
>> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>> Cc: Baolin Wang <baolin.wang@linaro.org>
>> Cc: Daniel Mack <daniel@zonque.org>
>> Cc: Dan Murphy <dmurphy@ti.com>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: Oleh Kravchenko <oleg@kaa.org.ua>
>> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
>> Cc: Simon Shields <simon@lineageos.org>
>> Cc: Xiaotong Lu <xiaotong.lu@spreadtrum.com>
>> ---
>>  Documentation/devicetree/bindings/leds/common.txt | 52 +++++++++++++++++++----
>>  1 file changed, 44 insertions(+), 8 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
>> index aa13998..3efc826 100644
>> --- a/Documentation/devicetree/bindings/leds/common.txt
>> +++ b/Documentation/devicetree/bindings/leds/common.txt
>> @@ -10,14 +10,20 @@ can influence the way of the LED device initialization, the LED components
>>  have to be tightly coupled with the LED device binding. They are represented
>>  by child nodes of the parent LED device binding.
>>  
>> +
>>  Optional properties for child nodes:
>>  - led-sources : List of device current outputs the LED is connected to. The
>>  		outputs are identified by the numbers that must be defined
>>  		in the LED device binding documentation.
>> +- function: LED functon. Use one of the LED_FUNCTION_* prefixed definitions
>> +	    from the header include/dt-bindings/leds/functions.h.
>> +	    If there is no matching LED_FUNCTION available, add a new one.
>> +- color : Color of the LED.
>>  - label : The label for this LED. If omitted, the label is taken from the node
>>  	  name (excluding the unit address). It has to uniquely identify
>>  	  a device, i.e. no other LED class device can be assigned the same
>> -	  label.
>> +	  label. This property is deprecated - use 'function' and 'color'
>> +	  properties instead.
> 
> I don't know if I'd go as far a deprecating.
> 
> One thing to consider is how we handle multiple of the same function? Do 
> we allow an index on function names? What if an index isn't meaningful 
> and we need "front" vs. "rear" for example? Maybe label is still needed 
> there. 

I believe that 'label' property with its old semantics must be preserved
for backwards compatibility - it so far has been used inconsistently for
conveying variations of devicename:color:function sections. If provided,
then it's been taken as-is for LED class device name, or concatenated
with the devicename hard-coded in the driver.

Regarding the differentiation between the LEDs with functions of
same kind - OK, I agree, we will need another section.

What seems to fits the best is the reference to the device it is
logically associated with.

The question is whether the devicename should be provided in DT
literally, or by phandle, and then retrieved in runtime, basing on the
sysfs entry, like in case of input-leds bridge which for USB keyboard
creates LEDs named e.g.:

input5::capslock
input5::numlock
input5::scrolllock

Probably we will have to allow for some flexibility in this regard,
to allow for providing devicename literally like "rear", "front",
or like above input case.

-- 
Best regards,
Jacek Anaszewski
