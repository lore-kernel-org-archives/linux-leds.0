From: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH/RFC v9 06/19] DT: Add documentation for the mfd Maxim
 max77693
Date: Mon, 08 Dec 2014 11:29:15 +0100
Message-ID: <54857D7B.8050304@samsung.com>
References: <1417622814-10845-1-git-send-email-j.anaszewski@samsung.com>
 <1417622814-10845-7-git-send-email-j.anaszewski@samsung.com>
 <20141204100706.GP14746@valkosipuli.retiisi.org.uk>
 <54804840.4030202@samsung.com> <20141204161201.GB29080@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20141204161201.GB29080@amd>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

Hi Pavel,

On 12/04/2014 05:12 PM, Pavel Machek wrote:
> Hi!
>
>>>> +- maxim,boost-mode :
>>>> +	In boost mode the device can produce up to 1.2A of total current
>>>> +	on both outputs. The maximum current on each output is reduced
>>>> +	to 625mA then. If there are two child led nodes defined then boost
>>>> +	is enabled by default.
>>>> +	Possible values:
>>>> +		MAX77693_LED_BOOST_OFF - no boost,
>>>> +		MAX77693_LED_BOOST_ADAPTIVE - adaptive mode,
>>>> +		MAX77693_LED_BOOST_FIXED - fixed mode.
>>>> +- maxim,boost-vout : Output voltage of the boost module in millivolts.
>>>> +- maxim,vsys-min : Low input voltage level in millivolts. Flash is not fired
>>>> +	if chip estimates that system voltage could drop below this level due
>>>> +	to flash power consumption.
>>>> +
>>>> +Required properties of the LED child node:
>>>> +- label : see Documentation/devicetree/bindings/leds/common.txt
>>>> +- maxim,fled_id : Identifier of the fled output the led is connected to;
>>>
>>> I'm pretty sure this will be needed for about every chip that can drive
>>> multiple LEDs. Shouldn't it be documented in the generic documentation?
>>
>> OK.
>
> Well... "fled_id" is not exactly suitable name. On other busses, it
> would be "reg = <1>"?

I'm ok with "reg". This scheme is used for pca963x.txt and is described
as "number of LED line". We could define it similarly in the common.txt.
A device would have to specify the range of allowed values though.
I would add such a note to the generic binding.

Regards,
Jacek
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
