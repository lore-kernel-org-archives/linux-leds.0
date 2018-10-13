From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v3 2/9] dt-bindings: ti-lmu: Remove LM3697
Date: Sat, 13 Oct 2018 20:45:58 +0200
Message-ID: <60cc9238-aba2-aa6a-64a4-2b5e20835549@gmail.com>
References: <20181011165123.32198-1-dmurphy@ti.com>
 <20181011165123.32198-3-dmurphy@ti.com> <20181011182734.GA7973@amd>
 <4fcb91c7-b2b2-798d-8a41-fa1b475086e0@ti.com>
 <8c1559e1-b703-4c98-8bd9-7c9993bd59f5@gmail.com>
 <20181012162619.GA28573@bogus> <20181012180312.GB5565@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181012180312.GB5565@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>
Cc: Dan Murphy <dmurphy@ti.com>, lee.jones@linaro.org, tony@atomide.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 10/12/2018 08:03 PM, Pavel Machek wrote:
> Hi!
> 
>>>>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>>>>
>>>>> NAK.
>>>>
>>>> Thanks for the NAK.
>>>>
>>>> This NAK was NAK'd by other maintainer in the V2 RFC patchset
>>>>
>>>> https://lore.kernel.org/patchwork/patch/993171/
>>>
>>> I confirm. LM3697 is a standalone device and not a cell of any
>>> MFD device.
>>>
>>> Waiting for DT maintainer's ack.
>>
>> You all sort out what you want... I can't follow it all, and I'm not 
>> going to spend the time trying to figure out what is going on here.
> 
> This is what I want:
> 
>> As this is worded, changing the driver is a Linux problem and irrelevant 
>> to the binding. Now if you want to move documentation to a location that 
>> makes more sense, then fine. But structure patches that way and make it 
>> clear that from an binding ABI perspective, nothing is changing.
> 
> ...but apparently I did not have enough authority to get it.
> 
> (I'm ok with move, and it is possible that binding does need some
> fixups besides the move; still it should be done as fixup not as a new
> binding).

There is a fundamental question - should the bindings be considered
an ABI, even though there is no mainline "*.dts" implementation basing
on these bindings?

This patch fixes the issues of bindings in a way that would change
the ABI, if only it existed. But it apparently doesn't exist in
mainline. Unless a DT documentation itself constitutes an ABI.

I'd like to have it clarified at this occasion, and that's why
I kindly ask for DT maintainer's ack or NACK for this modification
of bindings.

For a reference we have a nice summary of the MFD driver and related
bindings' flaws in [0] and [1].

[0] https://lkml.org/lkml/2018/9/7/774
[1] https://lkml.org/lkml/2018/9/11/984

-- 
Best regards,
Jacek Anaszewski
