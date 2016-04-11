From: Phil Reid <preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
Subject: Re: [PATCH v2 1/1] leds: pca9532: Add device tree binding
Date: Mon, 11 Apr 2016 17:25:22 +0800
Message-ID: <570B6D82.6040807@electromag.com.au>
References: <1460013772-129968-1-git-send-email-preid@electromag.com.au>
 <1460013772-129968-2-git-send-email-preid@electromag.com.au>
 <5706686F.7070102@samsung.com> <570B42F4.5070002@electromag.com.au>
 <570B628A.4090406@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <570B628A.4090406-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, riku.voipio-X3B1VOXEql0@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

On 11/04/2016 4:38 PM, Jacek Anaszewski wrote:
> On 04/11/2016 08:23 AM, Phil Reid wrote:
>> On 7/04/2016 10:02 PM, Jacek Anaszewski wrote:
>>> Hi Phil,
>>>
>>> Thanks for the update. Few more remarks below.
>>>
>>> On 04/07/2016 09:22 AM, Phil Reid wrote:
>>>> This patch adds basic device tree support for the pca9532 LEDs.
>>>>
>>>> Signed-off-by: Phil Reid <preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
>>>> ---
>>>>   .../devicetree/bindings/leds/leds-pca9532.txt      | 42 +++++++++++++
>>>>   drivers/leds/leds-pca9532.c                        | 69
>>>> ++++++++++++++++++++--
>>>>   include/dt-bindings/leds/leds-pca9532.h            | 23 ++++++++
>>>>   include/linux/leds-pca9532.h                       | 18 ++----
>>>>   4 files changed, 135 insertions(+), 17 deletions(-)
>>>>   create mode 100644
>>>> Documentation/devicetree/bindings/leds/leds-pca9532.txt
>>>>   create mode 100644 include/dt-bindings/leds/leds-pca9532.h
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/leds/leds-pca9532.txt
>>>> b/Documentation/devicetree/bindings/leds/leds-pca9532.txt
>>>> new file mode 100644
>>>> index 0000000..284b96c
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/leds/leds-pca9532.txt
>>>> @@ -0,0 +1,42 @@
>>>> +*NXP - pca9532 PWM LED Driver
>>>> +
>>>> +The PCA9532 family is SMBus I/O expander optimized for dimming LEDs.
>>>> +The PWM support 256 steps.
>>>> +
>>>> +Required properties:
>>>> +    - compatible:
>>>> +        "nxp,pca9530"
>>>> +        "nxp,pca9531"
>>>> +        "nxp,pca9532"
>>>> +        "nxp,pca9533"
>>>> +    - reg -  I2C slave address
>>>> +
>>>> +Each led is represented as a sub-node of the nxp,pca9530.
>>>> +
>>>> +Optional sub-node properties:
>>>> +    - label: Name for this LED. If omitted, the label is taken from
>>>> the node name.
>>>
>>> Please also add a reference to common led bindings, as this property is
>>> documented there:
>>> "(see Documentation/devicetree/bindings/leds/common.txt):"
>> done.
>>
>>>
>>>> +    - type: Output configuration, see
>>>> dt-bindings/leds/leds-pca9532.h (default NONE)
>>>> +    - state: Initial LED state (default OFF)
>>>
>>> We already have "default-on" trigger for this purpose.
>> Not sure it does exactly the same thing.
>> This setting also associates a led with a particular PWM controller.
>> The chip has 2 shared PWM that each led can be controlled by.
>
> default-on trigger sets the LED to max_brightness on init.
> As I see pca9532_set_brightness() sets PCA9532_ON state if
> passed LED_FULL and uses PCA9532_PWM0 for other values
> greater than zero.
>
> So, maybe it would make more sense if we used default-on trigger to
> initialize LED to LED_FULL on init, but provide another DT property
> 'default-pwm' to determine which PWM block should be used by default?
> Currently I see that driver uses only PWM0:
>
> led->state = PCA9532_PWM0; /* Thecus: hardcode one pwm */
>
> Alternatively the driver could expose a dedicated sysfs attribute
> for changing the default pwm. This is of course out of this patch
> scope.
>
I'll drop the state bit for this patch.
I ideally need to have the 2 PWMs controlling the LEDs but it's
going to take a bit more work.

-- 
Regards
Phil Reid


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
