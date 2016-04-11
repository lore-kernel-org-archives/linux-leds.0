From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2 1/1] leds: pca9532: Add device tree binding
Date: Mon, 11 Apr 2016 10:38:34 +0200
Message-ID: <570B628A.4090406@samsung.com>
References: <1460013772-129968-1-git-send-email-preid@electromag.com.au>
 <1460013772-129968-2-git-send-email-preid@electromag.com.au>
 <5706686F.7070102@samsung.com> <570B42F4.5070002@electromag.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:34801 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751567AbcDKIij (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 11 Apr 2016 04:38:39 -0400
In-reply-to: <570B42F4.5070002@electromag.com.au>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Phil Reid <preid@electromag.com.au>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, riku.voipio@iki.fi, rpurdie@rpsys.net, devicetree@vger.kernel.org, linux-leds@vger.kernel.org

On 04/11/2016 08:23 AM, Phil Reid wrote:
> On 7/04/2016 10:02 PM, Jacek Anaszewski wrote:
>> Hi Phil,
>>
>> Thanks for the update. Few more remarks below.
>>
>> On 04/07/2016 09:22 AM, Phil Reid wrote:
>>> This patch adds basic device tree support for the pca9532 LEDs.
>>>
>>> Signed-off-by: Phil Reid <preid@electromag.com.au>
>>> ---
>>>   .../devicetree/bindings/leds/leds-pca9532.txt      | 42 +++++++++++++
>>>   drivers/leds/leds-pca9532.c                        | 69
>>> ++++++++++++++++++++--
>>>   include/dt-bindings/leds/leds-pca9532.h            | 23 ++++++++
>>>   include/linux/leds-pca9532.h                       | 18 ++----
>>>   4 files changed, 135 insertions(+), 17 deletions(-)
>>>   create mode 100644
>>> Documentation/devicetree/bindings/leds/leds-pca9532.txt
>>>   create mode 100644 include/dt-bindings/leds/leds-pca9532.h
>>>
>>> diff --git a/Documentation/devicetree/bindings/leds/leds-pca9532.txt
>>> b/Documentation/devicetree/bindings/leds/leds-pca9532.txt
>>> new file mode 100644
>>> index 0000000..284b96c
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/leds/leds-pca9532.txt
>>> @@ -0,0 +1,42 @@
>>> +*NXP - pca9532 PWM LED Driver
>>> +
>>> +The PCA9532 family is SMBus I/O expander optimized for dimming LEDs.
>>> +The PWM support 256 steps.
>>> +
>>> +Required properties:
>>> +    - compatible:
>>> +        "nxp,pca9530"
>>> +        "nxp,pca9531"
>>> +        "nxp,pca9532"
>>> +        "nxp,pca9533"
>>> +    - reg -  I2C slave address
>>> +
>>> +Each led is represented as a sub-node of the nxp,pca9530.
>>> +
>>> +Optional sub-node properties:
>>> +    - label: Name for this LED. If omitted, the label is taken from
>>> the node name.
>>
>> Please also add a reference to common led bindings, as this property is
>> documented there:
>> "(see Documentation/devicetree/bindings/leds/common.txt):"
> done.
>
>>
>>> +    - type: Output configuration, see
>>> dt-bindings/leds/leds-pca9532.h (default NONE)
>>> +    - state: Initial LED state (default OFF)
>>
>> We already have "default-on" trigger for this purpose.
> Not sure it does exactly the same thing.
> This setting also associates a led with a particular PWM controller.
> The chip has 2 shared PWM that each led can be controlled by.

default-on trigger sets the LED to max_brightness on init.
As I see pca9532_set_brightness() sets PCA9532_ON state if
passed LED_FULL and uses PCA9532_PWM0 for other values
greater than zero.

So, maybe it would make more sense if we used default-on trigger to
initialize LED to LED_FULL on init, but provide another DT property
'default-pwm' to determine which PWM block should be used by default?
Currently I see that driver uses only PWM0:

led->state = PCA9532_PWM0; /* Thecus: hardcode one pwm */

Alternatively the driver could expose a dedicated sysfs attribute
for changing the default pwm. This is of course out of this patch
scope.

-- 
Best regards,
Jacek Anaszewski
