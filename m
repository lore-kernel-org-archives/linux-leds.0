From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 1/2] dt: bindings: lp5024: Introduce the lp5024 and lp5018
 RGB driver
Date: Thu, 10 Jan 2019 19:44:43 +0100
Message-ID: <1702dfd6-b08f-c1ff-e46d-1366618bedb0@gmail.com>
References: <20181219162626.12297-1-dmurphy@ti.com>
 <20181219162626.12297-2-dmurphy@ti.com>
 <dc2283f9-db85-1eaf-f046-3fbbd4adcace@gmail.com>
 <2d2d5dcd-9c23-e901-daac-9b79aa5a5e82@ti.com>
 <6c62956e-7789-58ba-5437-f2e033f2825c@gmail.com>
 <366cbf6d-94fa-fea9-be58-07ddb09cff3a@ti.com>
 <df59c10d-7038-cb4a-45f0-7420254c6398@gmail.com>
 <ec0393b7-118e-1f3b-d5af-86ecdf66412a@ti.com>
 <ae700129-7b59-c92b-0c0a-b57a6f230ff7@gmail.com>
 <adcd7987-f7fc-ae1f-9aa4-cebcbf01ad58@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <adcd7987-f7fc-ae1f-9aa4-cebcbf01ad58@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>, robh+dt@kernel.org, pavel@ucw.cz
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Dan,

On 1/9/19 10:31 PM, Dan Murphy wrote:
> Jacek
> 
> On 1/9/19 3:28 PM, Jacek Anaszewski wrote:
>> On 1/9/19 10:12 PM, Dan Murphy wrote:
>>> On 1/9/19 2:12 PM, Jacek Anaszewski wrote:
>>>> Hi Dan,
>>>>
>>>> On 1/8/19 10:22 PM, Dan Murphy wrote:
>>>>> On 1/8/19 3:16 PM, Jacek Anaszewski wrote:
>>>>>> On 1/8/19 9:53 PM, Dan Murphy wrote:
>>>>>>> Jacek
>>>>>>>
>>>>>>> On 1/8/19 2:33 PM, Jacek Anaszewski wrote:
>>>>>>>> Dan,
>>>>>>>>
>>>>>>>> On 12/19/18 5:26 PM, Dan Murphy wrote:
>>>>>>>>> Introduce the bindings for the Texas Instruments LP5024 and the LP5018
>>>>>>>>> RGB LED device driver.  The LP5024/18 can control RGB LEDs individually
>>>>>>>>> or as part of a control bank group.  These devices have the ability
>>>>>>>>> to adjust the mixing control for the RGB LEDs to obtain different colors
>>>>>>>>> independent of the overall brightness of the LED grouping.
>>>>>>>>>
>>>>>>>>> Datasheet:
>>>>>>>>> http://www.ti.com/lit/ds/symlink/lp5024.pdf
>>>>>>>>>
>>>>>>>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>>>>>>>> ---
>>>>>>>>>       .../devicetree/bindings/leds/leds-lp5024.txt  | 63 +++++++++++++++++++
>>>>>>>>>       1 file changed, 63 insertions(+)
>>>>>>>>>       create mode 100644 Documentation/devicetree/bindings/leds/leds-lp5024.txt
>>>>>>>>>
>>>>>>>>> diff --git a/Documentation/devicetree/bindings/leds/leds-lp5024.txt b/Documentation/devicetree/bindings/leds/leds-lp5024.txt
>>>>>>>>> new file mode 100644
>>>>>>>>> index 000000000000..9567aa6f7813
>>>>>>>>> --- /dev/null
>>>>>>>>> +++ b/Documentation/devicetree/bindings/leds/leds-lp5024.txt
>>>>>>>>> @@ -0,0 +1,63 @@
>>>>>>>>> +* Texas Instruments - LP5024/18 RGB LED driver
>>>>>>>>> +
>>>>>>>>> +The LM3692x is an ultra-compact, highly efficient,
>>>>>>>>> +white-LED driver designed for LCD display backlighting.
>>>>>>>>> +
>>>>>>>>> +The main difference between the LP5024 and L5018 is the number of
>>>>>>>>> +RGB LEDs they support.  The LP5024 supports twenty four strings while the
>>>>>>>>> +LP5018 supports eighteen strings.
>>>>>>>>> +
>>>>>>>>> +Required properties:
>>>>>>>>> +    - compatible:
>>>>>>>>> +        "ti,lp5018"
>>>>>>>>> +        "ti,lp5024"
>>>>>>>>> +    - reg :  I2C slave address
>>>>>>>>> +    - #address-cells : 1
>>>>>>>>> +    - #size-cells : 0
>>>>>>>>> +
>>>>>>>>> +Optional properties:
>>>>>>>>> +    - enable-gpios : gpio pin to enable/disable the device.
>>>>>>>>> +    - vled-supply : LED supply
>>>>>>>>> +
>>>>>>>>> +Required child properties:
>>>>>>>>> +    - reg : Is the child node iteration.
>>>>>>>>> +    - led-sources : LP5024 - 0 - 7
>>>>>>>>> +            LP5018 - 0 - 5
>>>>>>>>> +            Declares the LED string or strings that the child node
>>>>>>>>> +            will control.  If ti,control-bank is set then this
>>>>>>>>> +            property will contain multiple LED IDs.
>>>>>>>>> +
>>>>>>>>> +Optional child properties:
>>>>>>>>> +    - label : see Documentation/devicetree/bindings/leds/common.txt
>>>>>>>>> +    - linux,default-trigger :
>>>>>>>>> +       see Documentation/devicetree/bindings/leds/common.txt
>>>>>>>>> +    - ti,control-bank : Indicates that the LED strings declared in the
>>>>>>>>> +                led-sources property are grouped within a control
>>>>>>>>> +                bank for brightness and mixing control.
>>>>>>>>> +
>>>>>>>>> +Example:
>>>>>>>>> +
>>>>>>>>> +led-controller@28 {
>>>>>>>>> +    compatible = "ti,lp5024";
>>>>>>>>> +    reg = <0x28>;
>>>>>>>>> +    #address-cells = <1>;
>>>>>>>>> +    #size-cells = <0>;
>>>>>>>>> +
>>>>>>>>> +    enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
>>>>>>>>> +    vled-supply = <&vbatt>;
>>>>>>>>> +
>>>>>>>>> +    led@0 {
>>>>>>>>> +        reg = <0>;
>>>>>>>>> +        led-sources = <1>;
>>>>>>>>> +    };
>>>>>>>>> +
>>>>>>>>> +    led@1 {
>>>>>>>>> +        reg = <1>;
>>>>>>>>> +        led-sources = <0 6>;
>>>>>>>>> +        ti,control-bank;
>>>>>>>>
>>>>>>>> Do you really need ti,control-bank? Doesn't led-sources array size
>>>>>>>> greater than 1 mean that the node describes control bank?
>>>>>>>>
>>>>>>>
>>>>>>> That will work too.
>>>>>>
>>>>>>>> Also, does it make sense to have only two LEDs in the bank?
>>>>>>>
>>>>>>> The array can populate all 7 LEDs in a single node.  I only show 2 here as the example.
>>>>>>> See the description above of the led-sources
>>>>>>
>>>>>> OK, I confused RGB LED modules with banks.
>>>>>>
>>>>>> Shouldn't we allow for defining either strings or RGB LED
>>>>>> triplets somehow then?
>>>>>>
>>>>>
>>>>> Well that is what this should be doing.  If you define a single LED in LED sources then
>>>>> the triplet is controlled via the associated LEDx_brightness register.
>>>>
>>>> led-sources should map to iouts directly.
>>>> So, for RGB LED modules I would expect:
>>>>
>>>> LED0: led-sources = <0 1 2>;
>>>> LED1: led-sources = <3 4 5>;
>>>> LED2: led-sources = <6 7 8>;
>>>> and so on.
>>>
>>>>
>>>> for banks:
>>>>
>>>> Bank A with iouts 0,3,6,9: led-sources<0 3 6 9>;
>>>> Bank B with iouts 2,4,10:  led-sources<2 4 10>;
>>>> Bank C with iouts 5,8,11,14,17: led-sources<5 8 11 14 17>;
>>>>
>>>
>>> Ok the led-sources would need to be different then this as I don't define the sources for banks.
>>>
>>> The led-sources for the banks and the individual groups will have different meanings within the same
>>> document.  I was attempting to keep the led-sources mapped to the LEDx_brightness registers as opposed to
>>> the hardware outputs since the RGB LEDs are controlled and grouped by a single brightness register and if banked then
>>> it would be controlled by the bank brightness register.
>>>
>>> Describing these in the DT seems wrought with potential issues as the data sheet defines what outputs map to what bank and LED
>>> registers.
>>
>> Yes, that's why I mentioned the need for validation of led-sources.
>> But they have to be iouts. This property was introduced specifically
>> for such purposes.
>>
> 
> Yes Pavel also mentioned that as well.
> 
> I will look into validating the sources.  But there will be no mapping of the sources to the output that is done
> in the hardware.  This would just be a data sheet mapping since the outputs are not configurable.

Hmm, isn't the mapping defined in the hardware via LED_CONFIG0 register?
I have an impression that it defines whether LED belongs to an RGB LED
module or to a bank. Basing on that I created my DT example above.

-- 
Best regards,
Jacek Anaszewski
