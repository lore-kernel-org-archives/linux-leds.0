From: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH/RFC v8 11/14] DT: Add documentation for the mfd Maxim
 max77693
Date: Mon, 01 Dec 2014 13:58:31 +0100
Message-ID: <547C65F7.4090801@samsung.com>
References: <1417166286-27685-1-git-send-email-j.anaszewski@samsung.com>
 <1417166286-27685-12-git-send-email-j.anaszewski@samsung.com>
 <20141129192607.GB17355@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20141129192607.GB17355@amd>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, SangYoung Son <hello.son-T5JinQjy6aBBDgjK7y7TUQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

Hi Pavel,

Thanks for the review.

On 11/29/2014 08:26 PM, Pavel Machek wrote:
> Hi!
>
>> diff --git a/Documentation/devicetree/bindings/mfd/max77693.txt b/Documentation/devicetree/bindings/mfd/max77693.txt
>> index 01e9f30..50a8dad 100644
>> --- a/Documentation/devicetree/bindings/mfd/max77693.txt
>> +++ b/Documentation/devicetree/bindings/mfd/max77693.txt
>> @@ -41,6 +41,62 @@ Optional properties:
>>   	 To get more informations, please refer to documentaion.
>>   	[*] refer Documentation/devicetree/bindings/pwm/pwm.txt
>>
>> +- led-flash : the LED submodule device node
>> +
>> +There are two led outputs available - fled1 and fled2. Each of them can
>> +control a separate led or they can be connected together to double
>> +the maximum current for a single connected led. One led is represented
>> +by one child node.
>> +
>> +Required properties:
>> +- compatible : must be "maxim,max77693-flash"
>> +
>> +Optional properties:
>> +- maxim,fleds : array of current outputs in order: fled1, fled2
>> +	Note: both current outputs can be connected to a single led
>> +	Possible values:
>> +		0 - the output is left disconnected,
>> +		1 - a diode is connected to the output.
>
> Is this one needed? Just ommit child note if it is not there.

It is needed because you can have one led connected two both
outputs. This allows to describe such a design.

>> +- maxim,trigger-type : Array of trigger types in order: flash, torch
>> +	Possible trigger types:
>> +		0 - Rising edge of the signal triggers the flash/torch,
>> +		1 - Signal level controls duration of the flash/torch.
>> +- maxim,trigger : Array of flags indicating which trigger can activate given led
>> +	in order: fled1, fled2
>> +	Possible flag values (can be combined):
>> +		1 - FLASH pin of the chip,
>> +		2 - TORCH pin of the chip,
>> +		4 - software via I2C command.
>
> Is it good idea to have bitfields like this?
>
> Make these required properties of the subnode?

This is related to a single property: trigger. I think that splitting
it to three properties would make unnecessary noise in the
binding.

Best Regards,
Jacek Anaszewski

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
