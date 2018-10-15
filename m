From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v3 2/9] dt-bindings: ti-lmu: Remove LM3697
Date: Mon, 15 Oct 2018 14:14:49 -0500
Message-ID: <5c7f03cc-4d45-6010-523d-46721c218731@ti.com>
References: <20181011165123.32198-1-dmurphy@ti.com>
 <20181011165123.32198-3-dmurphy@ti.com> <20181011182734.GA7973@amd>
 <4fcb91c7-b2b2-798d-8a41-fa1b475086e0@ti.com>
 <8c1559e1-b703-4c98-8bd9-7c9993bd59f5@gmail.com>
 <20181012162619.GA28573@bogus> <20181012180312.GB5565@amd>
 <60cc9238-aba2-aa6a-64a4-2b5e20835549@gmail.com>
 <CAL_Jsq+Yspr_iNP1eYanvtmiuMf-xNEZ0suDH3tQayV=V5r5=g@mail.gmail.com>
 <73647af4-0258-49a9-d9b6-eeef7e7813dc@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <73647af4-0258-49a9-d9b6-eeef7e7813dc@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Rob Herring <robh@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>, Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Jacek

On 10/15/2018 02:13 PM, Jacek Anaszewski wrote:
> On 10/15/2018 02:56 AM, Rob Herring wrote:
>> On Sat, Oct 13, 2018 at 1:46 PM Jacek Anaszewski
>> <jacek.anaszewski@gmail.com> wrote:
>>>
>>> On 10/12/2018 08:03 PM, Pavel Machek wrote:
>>>> Hi!
>>>>
>>>>>>>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>>>>>>>
>>>>>>>> NAK.
>>>>>>>
>>>>>>> Thanks for the NAK.
>>>>>>>
>>>>>>> This NAK was NAK'd by other maintainer in the V2 RFC patchset
>>>>>>>
>>>>>>> https://lore.kernel.org/patchwork/patch/993171/
>>>>>>
>>>>>> I confirm. LM3697 is a standalone device and not a cell of any
>>>>>> MFD device.
>>>>>>
>>>>>> Waiting for DT maintainer's ack.
>>>>>
>>>>> You all sort out what you want... I can't follow it all, and I'm not
>>>>> going to spend the time trying to figure out what is going on here.
>>>>
>>>> This is what I want:
>>>>
>>>>> As this is worded, changing the driver is a Linux problem and irrelevant
>>>>> to the binding. Now if you want to move documentation to a location that
>>>>> makes more sense, then fine. But structure patches that way and make it
>>>>> clear that from an binding ABI perspective, nothing is changing.
>>>>
>>>> ...but apparently I did not have enough authority to get it.
>>>>
>>>> (I'm ok with move, and it is possible that binding does need some
>>>> fixups besides the move; still it should be done as fixup not as a new
>>>> binding).
>>>
>>> There is a fundamental question - should the bindings be considered
>>> an ABI, even though there is no mainline "*.dts" implementation basing
>>> on these bindings?
>>
>> In theory there could be out of tree users. Having a dts file using it
>> in tree shouldn't be a requirement to maintain the ABI IMO. However, a
>> lack of dts is one piece of determining whether this is in use or not.
>>
>>> This patch fixes the issues of bindings in a way that would change
>>> the ABI, if only it existed. But it apparently doesn't exist in
>>> mainline. Unless a DT documentation itself constitutes an ABI.
>>>
>>> I'd like to have it clarified at this occasion, and that's why
>>> I kindly ask for DT maintainer's ack or NACK for this modification
>>> of bindings.
>>>
>>> For a reference we have a nice summary of the MFD driver and related
>>> bindings' flaws in [0] and [1].
>>>
>>> [0] https://lkml.org/lkml/2018/9/7/774
>>> [1] https://lkml.org/lkml/2018/9/11/984
>>
>> Given this one seems to have not really been finished, it's probably
>> okay to make changes in this case. Still, it would be good to see
>> patches structured so that it's obvious we're breaking things. But how
>> the patches are structured doesn't matter until there's some agreement
>> on the end result.
> 
> OK, so if I'm getting it right, the correct patch structure in this case
> means that changes removing bindings from MFD and moving them along
> with the modifications to the LED subsystem should be placed in a single
> patch.
> 
> Dan, could you please arrange the next patch set version accordingly?

Yes I can squash the DT bindings patches and call it a "move and modify"

Dan

> 


-- 
------------------
Dan Murphy
