From: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
Subject: Re: dts: fun with chip names Re: [PATCH v3 1/2] dt: bindings:
 lm3692x: Add bindings for lm3692x LED driver
Date: Thu, 16 Nov 2017 15:40:25 -0600
Message-ID: <ec3f88a4-268b-3e4c-56a1-fe38ee1d3097@ti.com>
References: <20171115194203.13572-1-dmurphy@ti.com>
 <20171116154139.wed7qmpmv2ffyzv2@rob-hp-laptop>
 <d3483e49-650d-1d68-bec6-eeb84d8ac48a@ti.com> <20171116201121.GA28848@amd>
 <CAL_Jsq+aysVR9U2Wquwwv7cjjO7wO8EXBg1Ja82u6s5t1yeJUw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+aysVR9U2Wquwwv7cjjO7wO8EXBg1Ja82u6s5t1yeJUw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux LED Subsystem <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

On 11/16/2017 02:36 PM, Rob Herring wrote:
> On Thu, Nov 16, 2017 at 2:11 PM, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org> wrote:
>> Hi!
>>
>>>>> +Required properties:
>>>>> +  - compatible:
>>>>> +          "ti,lm3692x"
>>>>
>>>> Don't use wildcards in compatible strings.
>>>
>>> Do you mean to remove the x?  How do we denote a family of parts
>>> then?
>>
>> I guess you should specify the exact chip.
>>
>> Which will present interesting problem for me on Nokia N9/N950; in one
>> case, compatible chip is produced by two companies, and it looks like
>> some machines have one and some have the other; but we'd like to share
>> the dts as user has no chance telling them apart (and it is not
>> important, anyway).
>>
>> In second case, chip is refered as APDS990X and I don't know where to
>> get more exact data.
> 
> There's always exceptions to rules. Just make the case for it. IIRC,
> there was the same case for the BT chip.
> 

Not sure how I got looped into the dts fun.  But I am going to call out the specific chips out in the
compatible strings.  There are currently only 2 devices supported by this driver.  The delta
between the chips is one supports a third string of LEDs.  1 bit in 1 register.

Dan

> Rob
> 


-- 
------------------
Dan Murphy
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
