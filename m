From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 1/2] leds: ncp5623: Add device tree binding documentation
Date: Wed, 22 Jun 2016 10:52:59 +0200
Message-ID: <576A51EB.8090800@samsung.com>
References: <1466494154-3786-1-git-send-email-florian.vaussard@heig-vd.ch>
 <1466494154-3786-2-git-send-email-florian.vaussard@heig-vd.ch>
 <57695D02.2000109@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:50770 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750799AbcFVIzX (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 22 Jun 2016 04:55:23 -0400
In-reply-to: <57695D02.2000109@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Florian Vaussard <florian.vaussard@gmail.com>
Cc: devicetree@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Florian Vaussard <florian.vaussard@heig-vd.ch>

On 06/21/2016 05:28 PM, Jacek Anaszewski wrote:
> Hi Florian,
>
> Thanks for the patch. I have two remarks below.
>
> On 06/21/2016 09:29 AM, Florian Vaussard wrote:
>> Add device tree binding documentation for On Semiconductor NCP5623 I2C
>> LED driver. The driver can independently control the PWM of the 3
>> channels with 32 levels of intensity.
>>
>> The current delivered by the current source can be controlled using the
>> led-max-microamp property. In order to control this value, it is also
>> necessary to know the current on the Iref pin, hence the
>> onnn,led-iref-microamp property. It is usually set using an external
>> bias resistor, following Iref = Vref/Rbias with Vref=0.6V.
>>
>> Signed-off-by: Florian Vaussard <florian.vaussard@heig-vd.ch>
>> ---
>>   .../devicetree/bindings/leds/leds-ncp5623.txt      | 44
>> ++++++++++++++++++++++
>>   1 file changed, 44 insertions(+)
>>   create mode 100644
>> Documentation/devicetree/bindings/leds/leds-ncp5623.txt
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-ncp5623.txt
>> b/Documentation/devicetree/bindings/leds/leds-ncp5623.txt
>> new file mode 100644
>> index 0000000..0dc8345
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/leds-ncp5623.txt
>> @@ -0,0 +1,44 @@
>> +* ON Semiconductor - NCP5623 3-Channel LED Driver
>> +
>> +The NCP5623 is a 3-channel I2C LED driver. The brightness of each
>> +channel can be independently set using 32 levels. Each LED is
>> represented
>> +as a sub-node of the device.
>> +
>> +Required properties:
>> +  - compatible: Should be "onnn,ncp5623"
>> +  - reg: I2C slave address (fixed to 0x38)
>> +  - #address-cells: must be 1
>> +  - #size-cells: must be 0
>> +  - onnn,led-iref-microamp: Current on the Iref pin in microampere
>
> I think that you don't need this property. Just provide the formula for
> calculating led-max-microamp value, similarly as you're doing that in
> the commit message.
>
>> +  - led-max-microamp: Desired maximum current for each LED in
>> microampere
>> +                      (maximum 30000uA)
>
> Please add instead of (maximum ...):
>
> Valid values: min - max, step by N (rounded {up|down})
>
> E.g.
>
> Valid values: 10000 - 30000, step by 1000 (rounded down)
>
>> +
>> +LED sub-node properties:
>> +  - reg : LED channel number (0..2)
>> +  - For other LED properties see:
>> +      Documentation/devicetree/bindings/leds/common.txt
>> +
>> +Example:
>> +
>> +led1: ncp5623@38 {
>> +    #address-cells = <1>;
>> +    #size-cells = <0>;
>> +    compatible = "onnn,ncp5623";
>> +    reg = <0x38>;
>> +
>> +    led1_r@0 {
>> +        label = "ncp:power:red";
>> +        reg = <0>;
>> +        linux,default-trigger = "default-on";

Please add also led-max-microamp to all child nodes in this example.

>> +    };
>> +
>> +    led1_b@1 {
>> +        label = "ncp:power:blue";
>> +        reg = <1>;
>> +    };
>> +
>> +    led1_g@2 {
>> +        label = "ncp:power:green";
>> +        reg = <2>;
>> +    };
>> +};
>>
>
>


-- 
Best regards,
Jacek Anaszewski
