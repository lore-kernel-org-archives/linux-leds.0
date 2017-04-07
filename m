From: Felix Brack <fb-GovowT2ENgg@public.gmane.org>
Subject: Re: [PATCH v2] Extend pca9532 device tree support
Date: Fri, 7 Apr 2017 10:22:48 +0200
Message-ID: <ec012568-f540-4e87-d8c4-4065fbcd1c2a@ltec.ch>
References: <1490880833-22199-1-git-send-email-fb@ltec.ch>
 <b54c77d5-b4f7-9517-8c5b-9200c766204a@gmail.com> <20170406155005.GA10363@amd>
 <a8509d26-6e35-e2f7-9784-90f3c54accbf@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a8509d26-6e35-e2f7-9784-90f3c54accbf-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, riku.voipio-X3B1VOXEql0@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

Hello Jacek,

On 06.04.2017 21:00, Jacek Anaszewski wrote:
> Hi Pavel,
> 
> On 04/06/2017 05:50 PM, Pavel Machek wrote:
>> Hi!
>>
>>>> diff --git a/Documentation/devicetree/bindings/leds/leds-pca9532.txt b/Documentation/devicetree/bindings/leds/leds-pca9532.txt
>>>> index 198f3ba..8374075 100644
>>>> --- a/Documentation/devicetree/bindings/leds/leds-pca9532.txt
>>>> +++ b/Documentation/devicetree/bindings/leds/leds-pca9532.txt
>>>> @@ -17,6 +17,8 @@ Optional sub-node properties:
>>>>  	- label: see Documentation/devicetree/bindings/leds/common.txt
>>>>  	- type: Output configuration, see dt-bindings/leds/leds-pca9532.h (default NONE)
>>>>  	- linux,default-trigger: see Documentation/devicetree/bindings/leds/common.txt
>>>> +	- default-state: see Documentation/devicetree/bindings/leds/common.txt
>>>> +	  This property is only valid for sub-nodes of type <PCA9532_TYPE_LED>.
>>>>  
>>>>  Example:
>>>>    #include <dt-bindings/leds/leds-pca9532.h>
>>>> @@ -33,6 +35,14 @@ Example:
>>>>        label = "pca:green:power";
>>>>        type = <PCA9532_TYPE_LED>;
>>>>      };
>>>> +    kernel-booting {
>>>> +    	type = <PCA9532_TYPE_LED>;
>>>> +    	default-state = "on";
>>>> +    };
>>>> +    sys-stat {
>>>> +    	type = <PCA9532_TYPE_LED>;
>>>> +    	default-state = "keep"; // don't touch, was set by U-Boot
>>>> +    };
>>>
>>> Adjusted above indentation to match the preceding lines.
>>
>>>> @@ -475,6 +494,16 @@ pca9532_of_populate_pdata(struct device *dev, struct device_node *np)
>>>>  		of_property_read_u32(child, "type", &pdata->leds[i].type);
>>>>  		of_property_read_string(child, "linux,default-trigger",
>>>>  					&pdata->leds[i].default_trigger);
>>>> +		if (!of_property_read_string(child, "default-state", &state)) {
>>>> +			if (!strcmp(state, "on"))
>>>> +				pdata->leds[i].state = PCA9532_ON;
>>>> +			else if (!strcmp(state, "keep"))
>>>> +				pdata->leds[i].state = PCA9532_KEEP;
>>>> +			else if (!strcmp(state, "pwm0"))
>>>> +				pdata->leds[i].state = PCA9532_PWM0;
>>>> +			else if (!strcmp(state, "pwm1"))
>>>> +				pdata->leds[i].state = PCA9532_PWM1;
>>>> +		}
>>>>  		if (++i >= maxleds) {
>>>>  			of_node_put(child);
>>>>  			break;
>>
>> This seems to look for "pwm0" and "pwm1" strings, which do not seem to
>> be documented.
>>
>> Plus... is it useful to have default-state? We already have default
>> trigger. If we keep the value by default (on PC, we do something like
>> that) this patch should not be neccessary?
> 
> Thanks for the heads-up. Dropping the patch for now.

No, please do not drop the patch.

> I guess that pwm0/1 got propagated to v2 by an omission.
> 

Yes, I agree. However the two strings do not break anything and behave
analog to the 'on' or 'keep' string. Though this code could be removed
if absolutely necessary. An alternative would be to add a description
for the strings. Just to be clear: these strings have nothing to with
the exposition of device specific registers to the DT.

> Regarding default-on: Felix, do you have any use case that require
> default-on set to "keep"?
> 

This patch is not about 'default-on' which is a value that could be
assigned to the property 'linux,default-trigger' (according to DT
bindings documentation file 'common.txt').
My patch does not introduce anything new with the'keep' state, it rather
completes the existing bindings according to the description in
Documentation/devicetree/bindings/leds/common.txt which states:

....
- default-state : The initial state of the LED. Valid values are "on",
"off", and "keep". If the LED is already on or off and the default-state
property is set the to same value, then no glitch should be produced
where the LED momentarily turns off (or on). The "keep" setting will
keep the LED at whatever its current state is, without producing a
glitch.  The default is off if this property is not present.
....

One of my use cases is to turn a LED on by U-Boot. This LED must remain
on until eventually, under certain conditions, some userland code
changes it's state.
Setting 'default-state' to 'keep' is how you can sort of tell the
kernel, or better the driver, 'not to initialize the LED' which would
turn it off.

kind regards, Felix
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
