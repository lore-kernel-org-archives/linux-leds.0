From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2 3/9] Documentation: dt-bindings: leds: add LM3633 LED
 binding information
Date: Mon, 30 Nov 2015 13:26:51 +0100
Message-ID: <565C408B.9070703@samsung.com>
References: <1448521025-2796-1-git-send-email-milo.kim@ti.com>
 <1448521025-2796-4-git-send-email-milo.kim@ti.com>
 <56583C32.5030307@samsung.com> <565C0677.4030606@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:45101 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752822AbbK3M0z (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 30 Nov 2015 07:26:55 -0500
In-reply-to: <565C0677.4030606@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: "Kim, Milo" <milo.kim@ti.com>
Cc: robh+dt@kernel.org, lee.jones@linaro.org, broonie@kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Milo,

On 11/30/2015 09:19 AM, Kim, Milo wrote:
> Hi Jacek,
>
> On 11/27/2015 8:19 PM, Jacek Anaszewski wrote:
>> Hi Milo,
>>
>> On 11/26/2015 07:56 AM, Milo Kim wrote:
>>> LM3633 LED device is one of TI LMU device list.
>>>
>>> Cc: Rob Herring <robh+dt@kernel.org>
>>> Cc: devicetree@vger.kernel.org
>>> Cc: Lee Jones <lee.jones@linaro.org>
>>> Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
>>> Cc: Mark Brown <broonie@kernel.org>
>>> Cc: linux-leds@vger.kernel.org
>>> Cc: linux-kernel@vger.kernel.org
>>> Signed-off-by: Milo Kim <milo.kim@ti.com>
>>> ---
>>>    .../devicetree/bindings/leds/leds-lm3633.txt       | 24
>>> ++++++++++++++++++++++
>>>    1 file changed, 24 insertions(+)
>>>    create mode 100644
>>> Documentation/devicetree/bindings/leds/leds-lm3633.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/leds/leds-lm3633.txt
>>> b/Documentation/devicetree/bindings/leds/leds-lm3633.txt
>>> new file mode 100644
>>> index 0000000..a553894
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/leds/leds-lm3633.txt
>>> @@ -0,0 +1,24 @@
>>> +TI LMU LM3633 LED device tree bindings
>>> +
>>> +Required properties:
>>> +  - compatible: "ti,lm3633-leds"
>>> +
>>> +Child nodes:
>>> +  Each node matches with LED control bank.
>>> +  Please refer to the datasheet [1].
>>
>> leds/common.txt documentation says that child nodes represent discrete
>> LED elements.
>>
>>> +  Required properties of a child node:
>>> +  - led-sources: List of enabled channels from 0 to 5.
>>> +                 Please refer to LED binding [2].
>>
>> led-sources property should contain always one element -

Here I should have added that this would have been the correct approach
for this device. For led flash controllers where we have one LED
connected to two outputs there are two element in the led-sources array.

>> a control bank identifier that the iout is to be associated with.
>> For example, if there are three LEDs and they should be controlled
>> with control bank A, then the bindings should look as follows
>> (assuming that control bank identifiers start from 0 [A:0, B:1,
>> C:2, etc. - it has to be also explicitly stated in the documentation]:
>
> My understanding is 'led-sources' means output channel rather than
> control bank. Output channel is visible and intuitive - just output LED.
> On the other hand, control banks works inside the silicon, LM3633.
> I'm not sure other LED devices have control bank or not, but output
> channel is common concept.

There is no "channel" notion present in the leds/common.txt
documentation.

led-sources property is documented as "list of device current outputs
the LED is connected to." In case of your device the LVLEDn pins can be
configured so that they are routed to the common current output.

led-sources property has been initially designed for representing
one-LED-to many-iouts relation, but it can be equally well exploited for
representing many-LEDs-to-one-iout relation, if used in conjunction
with DT child nodes.

>>
>> lvled1 {
>>     led-sources = <2>;
>>     led-max-microamp = <1000>;
>> }
>>
>> lvled2 {
>>     led-sources = <2>;
>>     led-max-microamp = <29000>;
>> }
>>
>> lvled3 {
>>     led-sources = <2>;
>>     led-max-microamp = <7000>;
>> }
>
> For this reason, I don't understand this LED configuration - one output
> channel with multiple LED devices. LED child node should be matched with
> led class device.

I can't find any claim saying that child node should represent
LED class device. Instead, there is a statement saying that
discrete LED components "are represented by child nodes of the parent
LED device binding". What is more e.g. leds-bcm6328.txt bindings don't
expose LED class device for the LEDs marked as hardware controlled.

Device tree describes hardware, and above bindings properly reflect
hardware arrangement - there are three LEDs and each of them
is connected to the same current output. Please note that
common/leds.txt documentation doesn't make any reservation saying
that current output necessarily reflects a hardware pin.

In case of LM3633 the real current outputs are banks and multiplexing
that occurs between banks and LVLEDn pins can be conveniently expressed
with the bindings I proposed above.

> If three output channels are controlled by one control bank, then it
> should be represented as below.
>
> lvled-group-A {
>      led-sources = <0>, <1>, <2>;
>      led-max-microamp = <some value>;
> }
>
> Please let me know if I misunderstand.

You silently assumed some definition of a "channel". led-sources means
in fact current sources, and when device is configured so that three
output pins are routed to the same current source, then in fact
they share common current source.

-- 
Best Regards,
Jacek Anaszewski
