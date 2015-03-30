From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v3] DT: Add documentation for the mfd Maxim max77693
Date: Mon, 30 Mar 2015 15:46:38 +0200
Message-ID: <551953BE.50506@samsung.com>
References: <1427709149-15014-1-git-send-email-j.anaszewski@samsung.com>
 <1427709149-15014-2-git-send-email-j.anaszewski@samsung.com>
 <20150330115729.GG17971@leverpostej> <55194509.1070008@samsung.com>
 <20150330132002.GA29200@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <20150330132002.GA29200@leverpostej>
Sender: linux-media-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "kyungmin.park@samsung.com" <kyungmin.park@samsung.com>, "pavel@ucw.cz" <pavel@ucw.cz>, "cooloney@gmail.com" <cooloney@gmail.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, "sakari.ailus@iki.fi" <sakari.ailus@iki.fi>, "s.nawrocki@samsung.com" <s.nawrocki@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Lee Jones <lee.jones@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Hi Mark,

On 03/30/2015 03:20 PM, Mark Rutland wrote:
> Hi,
>
>>>> +Optional properties:
>>>> +- maxim,trigger-type : Flash trigger type.
>>>> +	Possible trigger types:
>>>> +		LEDS_TRIG_TYPE_EDGE (0) - Rising edge of the signal triggers
>>>> +			the flash,
>>>> +		LEDS_TRIG_TYPE_LEVEL (1) - Strobe pulse length controls duration
>>>> +			of the flash.
>>>
>>> Surely this is required? What should be assumed if this property isn't
>>> present?
>>
>> LEDS_TRIG_TYPE_LEVEL allows for an ISP to do e.g. short flash blink
>> before the actual strobe - it is used for eliminating photographs with
>> closed eyes, or can serve for probing ambient light conditions.
>>
>> With LEDS_TRIG_TYPE_EDGE flash strobe is triggered on rising edge
>> and lasts until programmed timeout expires.
>>
>> This setting is tightly related to a camera sensor, which generates
>> the strobe signal. Effectively it depends on board configuration.
>
> My comment wasn't to do with the semantics of eitehr option but rather
> the optionality of the property.
>
> Surely it's vital to know what this should be, and hence this property
> should be required rather than optional?
>
> If it isn't required, what would the assumed default be?

Default is LEDS_TRIG_TYPE_EDGE.

-- 
Best Regards,
Jacek Anaszewski
