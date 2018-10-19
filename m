From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v3 2/9] dt-bindings: ti-lmu: Remove LM3697
Date: Fri, 19 Oct 2018 06:42:52 -0500
Message-ID: <b3d390c8-46bf-2c94-fad5-ec85b1cca2fe@ti.com>
References: <4fcb91c7-b2b2-798d-8a41-fa1b475086e0@ti.com>
 <8c1559e1-b703-4c98-8bd9-7c9993bd59f5@gmail.com>
 <20181012162619.GA28573@bogus> <20181012180312.GB5565@amd>
 <60cc9238-aba2-aa6a-64a4-2b5e20835549@gmail.com>
 <CAL_Jsq+Yspr_iNP1eYanvtmiuMf-xNEZ0suDH3tQayV=V5r5=g@mail.gmail.com>
 <73647af4-0258-49a9-d9b6-eeef7e7813dc@gmail.com>
 <5c7f03cc-4d45-6010-523d-46721c218731@ti.com> <20181015214512.GA2001@amd>
 <aa401333-9650-c925-2085-6e6d17b576bd@ti.com> <20181018221048.GA6364@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181018221048.GA6364@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Rob Herring <robh@kernel.org>, Lee Jones <lee.jones@linaro.org>, Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On 10/18/2018 05:10 PM, Pavel Machek wrote:
> Hi!
> 
>>>>>> Given this one seems to have not really been finished, it's probably
>>>>>> okay to make changes in this case. Still, it would be good to see
>>>>>> patches structured so that it's obvious we're breaking things. But how
>>>>>> the patches are structured doesn't matter until there's some agreement
>>>>>> on the end result.
>>>>>
>>>>> OK, so if I'm getting it right, the correct patch structure in this case
>>>>> means that changes removing bindings from MFD and moving them along
>>>>> with the modifications to the LED subsystem should be placed in a single
>>>>> patch.
>>>>>
>>>>> Dan, could you please arrange the next patch set version accordingly?
>>>>
>>>> Yes I can squash the DT bindings patches and call it a "move and modify"
>>>
>>> You can do move without problems. But if you plan to modify them,
>>> please try to change as little as possible, make it separate patch and
>>> explain why new version is better than old one.
>>>
>>
>> I have been thinking of how to do this.  Since the 2 devices are part of the current
>> binding there really is not a way to move them.  Since there are still MFD capable
>> devices available.
>>
>> I would still need to remove the current active binding and create a new binding in the LED
>> bindings directory.
>>
>> I would have to remove and create in the same patch.
> 
> Yeah, and this all is a sign that you should just keep the current
> binding, and make your code use it, see?


No I don't actually see this as a sign.  This is just operational issues
nothing to do with actually correcting the incomplete unused bindings.

And actually moving and creating the bindings in the same patch makes
sense as the change is self contained in a single patch and is easier to
track.

> 
> You are free to use Sebastian's updated binding. It has "suggested by:
> Rob" or something like that on it, so it should be fine.
> 
> You can add note to bindings/leds pointing to mfd binding.
> 
> Now... this is what I've suggested before. If you don't agree, you may
> want to contact Tony Lindgren, IIRC he works for TI, too, and might be
> willing to help.

I will ping Tony just to close the loop.  I will be posting v4 today after making the changes.
I was hoping to have some code review prior to posting v4 but have not received any comments so
v4 will just be a patch rearrangement.

Dan

> 
> Thank you,
> 									Pavel
> 


-- 
------------------
Dan Murphy
