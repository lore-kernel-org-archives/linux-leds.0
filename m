From: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3 5/6] Documentation: bindings: add documentation for
 ir-spi device driver
Date: Thu, 10 Nov 2016 08:46:35 +0100
Message-ID: <13210179-ea3f-6106-e3c0-fa30b83e23cc@samsung.com>
References: <20161102104010.26959-1-andi.shyti@samsung.com>
 <CGME20161102104149epcas5p4da68197e232df7ad922f2f9cb0714a43@epcas5p4.samsung.com>
 <20161102104010.26959-6-andi.shyti@samsung.com>
 <70f4426b-e2e6-1fb7-187a-65ed4bce0668@samsung.com>
 <20161103101048.ofyoko4mkcypf44u@gangnam.samsung>
 <70e31ed5-e1ec-cac3-3c3d-02c75f1418bd@samsung.com>
 <20161109182621.ttfxtdt32q3cqce7@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20161109182621.ttfxtdt32q3cqce7@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Andi Shyti <andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Sean Young <sean-hENCXIMQXOg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

On 11/09/2016 07:26 PM, Rob Herring wrote:
> On Thu, Nov 03, 2016 at 11:39:21AM +0100, Jacek Anaszewski wrote:
>> On 11/03/2016 11:10 AM, Andi Shyti wrote:
>>> Hi Jacek,
>>>
>>>> Only DT bindings of LED class drivers should be placed in
>>>> Documentation/devicetree/bindings/leds. Please move it to the
>>>> media bindings.
>>>
>>> that's where I placed it first, but Rob asked me to put it in the
>>> LED directory and Cc the LED mailining list.
>>>
>>> That's the discussion of the version 2:
>>>
>>> https://lkml.org/lkml/2016/9/12/380
>>>
>>> Rob, Jacek, could you please agree where I can put the binding?
>>
>> I'm not sure if this is a good approach. I've noticed also that
>> backlight bindings have been moved to leds, whereas they don't look
>> similarly.
>>
>> We have common.txt LED bindings, that all LED class drivers' bindings
>> have to follow. Neither backlight bindings nor these ones do that,
>> which introduces some mess.
>
> And there are probably LED bindings that don't follow common.txt either.
>
>> Eventually adding a sub-directory, e.g. remote_control could make it
>> somehow logically justified, but still - shouldn't bindings be
>> placed in the documentation directory related to the subsystem of the
>> driver they are predestined to?
>
> No. While binding directories often mirror the driver directories, they
> are not the same. Bindings are grouped by types of h/w and IR LEDs are a
> type of LED.
>
> If you prefer a sub-dir, that is fine with me.

Fine. So how about sub-dir "ir" ?

-- 
Best regards,
Jacek Anaszewski
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
