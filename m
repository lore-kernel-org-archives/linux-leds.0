From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 5/6] leds: pca963x: Inform the output that it is inverted
Date: Fri, 22 Apr 2016 08:09:35 -0500
Message-ID: <CAL_JsqJdvfrAy+1pYVYOp+tGhjOO3WkQo24+hfxV0_Ncpj6dSg@mail.gmail.com>
References: <1461051650-18824-1-git-send-email-oliver@schinagl.nl>
 <1461051650-18824-6-git-send-email-oliver@schinagl.nl> <20160421150750.GA3116@rob-hp-laptop>
 <571A1B60.3020804@schinagl.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <571A1B60.3020804@schinagl.nl>
Sender: linux-kernel-owner@vger.kernel.org
To: Olliver Schinagl <oliver@schinagl.nl>
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Fri, Apr 22, 2016 at 7:38 AM, Olliver Schinagl <oliver@schinagl.nl> wrote:
> Hey Rob,
>
> On 21-04-16 17:07, Rob Herring wrote:
>>
>> On Tue, Apr 19, 2016 at 09:40:49AM +0200, Olliver Schinagl wrote:
>>>
>>> When leds are connected in a totem-pole configuration, they can be
>>> connected either in a active-high, or active-low manor. The driver
>>> currently always assumes active-high. This patch adds the
>>> 'nxp,inverted-out' boolean property to tell the driver that the leds
>>> are driven active-low, or rather, that the behavior is inverted to what
>>> is normally expected.
>>
>> How do I know what is normally expected?
>
> fair point, and in fact, you don't. The text is bad here.

The problem is not so much the text here, but the property is also
meaningless without some explanation.

>>
>>
>>> Signed-off-by: Olliver Schinagl <oliver@schinagl.nl>
>>> ---
>>>   Documentation/devicetree/bindings/leds/pca963x.txt |  1 +
>>>   drivers/leds/leds-pca963x.c                        | 20
>>> +++++++++++++-------
>>>   include/linux/platform_data/leds-pca963x.h         |  1 +
>>>   3 files changed, 15 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/leds/pca963x.txt
>>> b/Documentation/devicetree/bindings/leds/pca963x.txt
>>> index dafbe99..7b23725 100644
>>> --- a/Documentation/devicetree/bindings/leds/pca963x.txt
>>> +++ b/Documentation/devicetree/bindings/leds/pca963x.txt
>>> @@ -6,6 +6,7 @@ Required properties:
>>>   Optional properties:
>>>   - nxp,totem-pole : use totem pole (push-pull) instead of open-drain
>>> (pca9632 defaults
>>>     to open-drain, newer chips to totem pole)
>>> +  nxp,inverted-out: the connected leds are active-low, default to
>>> active-high
>>
>> Just state what mode you want: nxp,active-low
>
> But that's not what happens, which is why my text is bad :) It depends on
> how the board is wired and if it is push-pull or open-drain. Though this
> goes beyond my electronics knowledge. So I'll reduce the text to say exactly
> what we mean, inverted output (or not).
>
> Unless you can explain that it would be unrelated and it is actually
> active-high/low. I'll be more than happy to oblige.

I'm not familiar with this chip, but googling for "active low LED
circuit" can give you lots of examples. To put it simply, you are
defining whether the control/switch is on the cathode or anode side of
the LED. Open-drain vs. push-pull is also related to how the circuit
is done, but is probably an independent property. I'd think the only
reason you would use open-drain here is if you wanted to control the
LED from 2 different signals. Whether you wanted the controls to
function as OR or AND logic to turn on would determine what the active
state needs to be.

Rob
