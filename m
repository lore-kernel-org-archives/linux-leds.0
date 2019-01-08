From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH 1/2] dt: bindings: lp5024: Introduce the lp5024 and lp5018
 RGB driver
Date: Tue, 8 Jan 2019 14:53:36 -0600
Message-ID: <2d2d5dcd-9c23-e901-daac-9b79aa5a5e82@ti.com>
References: <20181219162626.12297-1-dmurphy@ti.com>
 <20181219162626.12297-2-dmurphy@ti.com>
 <dc2283f9-db85-1eaf-f046-3fbbd4adcace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <dc2283f9-db85-1eaf-f046-3fbbd4adcace@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, robh+dt@kernel.org, pavel@ucw.cz
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Jacek

On 1/8/19 2:33 PM, Jacek Anaszewski wrote:
> Dan,
> 
> On 12/19/18 5:26 PM, Dan Murphy wrote:
>> Introduce the bindings for the Texas Instruments LP5024 and the LP5018
>> RGB LED device driver.  The LP5024/18 can control RGB LEDs individually
>> or as part of a control bank group.  These devices have the ability
>> to adjust the mixing control for the RGB LEDs to obtain different colors
>> independent of the overall brightness of the LED grouping.
>>
>> Datasheet:
>> http://www.ti.com/lit/ds/symlink/lp5024.pdf
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>   .../devicetree/bindings/leds/leds-lp5024.txt  | 63 +++++++++++++++++++
>>   1 file changed, 63 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/leds/leds-lp5024.txt
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-lp5024.txt b/Documentation/devicetree/bindings/leds/leds-lp5024.txt
>> new file mode 100644
>> index 000000000000..9567aa6f7813
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/leds-lp5024.txt
>> @@ -0,0 +1,63 @@
>> +* Texas Instruments - LP5024/18 RGB LED driver
>> +
>> +The LM3692x is an ultra-compact, highly efficient,
>> +white-LED driver designed for LCD display backlighting.
>> +
>> +The main difference between the LP5024 and L5018 is the number of
>> +RGB LEDs they support.  The LP5024 supports twenty four strings while the
>> +LP5018 supports eighteen strings.
>> +
>> +Required properties:
>> +    - compatible:
>> +        "ti,lp5018"
>> +        "ti,lp5024"
>> +    - reg :  I2C slave address
>> +    - #address-cells : 1
>> +    - #size-cells : 0
>> +
>> +Optional properties:
>> +    - enable-gpios : gpio pin to enable/disable the device.
>> +    - vled-supply : LED supply
>> +
>> +Required child properties:
>> +    - reg : Is the child node iteration.
>> +    - led-sources : LP5024 - 0 - 7
>> +            LP5018 - 0 - 5
>> +            Declares the LED string or strings that the child node
>> +            will control.  If ti,control-bank is set then this
>> +            property will contain multiple LED IDs.
>> +
>> +Optional child properties:
>> +    - label : see Documentation/devicetree/bindings/leds/common.txt
>> +    - linux,default-trigger :
>> +       see Documentation/devicetree/bindings/leds/common.txt
>> +    - ti,control-bank : Indicates that the LED strings declared in the
>> +                led-sources property are grouped within a control
>> +                bank for brightness and mixing control.
>> +
>> +Example:
>> +
>> +led-controller@28 {
>> +    compatible = "ti,lp5024";
>> +    reg = <0x28>;
>> +    #address-cells = <1>;
>> +    #size-cells = <0>;
>> +
>> +    enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
>> +    vled-supply = <&vbatt>;
>> +
>> +    led@0 {
>> +        reg = <0>;
>> +        led-sources = <1>;
>> +    };
>> +
>> +    led@1 {
>> +        reg = <1>;
>> +        led-sources = <0 6>;
>> +        ti,control-bank;
> 
> Do you really need ti,control-bank? Doesn't led-sources array size
> greater than 1 mean that the node describes control bank?
> 

That will work too.

> Also, does it make sense to have only two LEDs in the bank?

The array can populate all 7 LEDs in a single node.  I only show 2 here as the example.
See the description above of the led-sources


Dan

> 
>> +    };
>> +
>> +}
>> +
>> +For more product information please see the link below:
>> +http://www.ti.com/lit/ds/symlink/lp5024.pdf
>>
> 


-- 
------------------
Dan Murphy
