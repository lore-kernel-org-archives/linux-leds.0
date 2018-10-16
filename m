From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v3 2/9] dt-bindings: ti-lmu: Remove LM3697
Date: Tue, 16 Oct 2018 08:25:36 -0500
Message-ID: <aa401333-9650-c925-2085-6e6d17b576bd@ti.com>
References: <20181011165123.32198-3-dmurphy@ti.com>
 <20181011182734.GA7973@amd> <4fcb91c7-b2b2-798d-8a41-fa1b475086e0@ti.com>
 <8c1559e1-b703-4c98-8bd9-7c9993bd59f5@gmail.com>
 <20181012162619.GA28573@bogus> <20181012180312.GB5565@amd>
 <60cc9238-aba2-aa6a-64a4-2b5e20835549@gmail.com>
 <CAL_Jsq+Yspr_iNP1eYanvtmiuMf-xNEZ0suDH3tQayV=V5r5=g@mail.gmail.com>
 <73647af4-0258-49a9-d9b6-eeef7e7813dc@gmail.com>
 <5c7f03cc-4d45-6010-523d-46721c218731@ti.com> <20181015214512.GA2001@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181015214512.GA2001@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Rob Herring <robh@kernel.org>, Lee Jones <lee.jones@linaro.org>, Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Thanks

On 10/15/2018 04:45 PM, Pavel Machek wrote:
> Hi!
> 
>>>> Given this one seems to have not really been finished, it's probably
>>>> okay to make changes in this case. Still, it would be good to see
>>>> patches structured so that it's obvious we're breaking things. But how
>>>> the patches are structured doesn't matter until there's some agreement
>>>> on the end result.
>>>
>>> OK, so if I'm getting it right, the correct patch structure in this case
>>> means that changes removing bindings from MFD and moving them along
>>> with the modifications to the LED subsystem should be placed in a single
>>> patch.
>>>
>>> Dan, could you please arrange the next patch set version accordingly?
>>
>> Yes I can squash the DT bindings patches and call it a "move and modify"
> 
> You can do move without problems. But if you plan to modify them,
> please try to change as little as possible, make it separate patch and
> explain why new version is better than old one.
> 

I have been thinking of how to do this.  Since the 2 devices are part of the current
binding there really is not a way to move them.  Since there are still MFD capable
devices available.

I would still need to remove the current active binding and create a new binding in the LED
bindings directory.

I would have to remove and create in the same patch.

Dan

> Thanks,
> 									Pavel
> 


-- 
------------------
Dan Murphy
