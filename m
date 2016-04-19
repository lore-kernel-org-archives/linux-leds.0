From: Olliver Schinagl <oliver@schinagl.nl>
Subject: Re: [PATCHv1 0/6] leds: pca9653x: support inverted outputs and
 cleanups
Date: Tue, 19 Apr 2016 15:27:46 +0200
Message-ID: <57163252.5090000@schinagl.nl>
References: <1461051650-18824-1-git-send-email-oliver@schinagl.nl>
 <5715F927.3030102@samsung.com> <5715FCE8.7080106@schinagl.nl>
 <CAPybu_02_5pZ6pMkXwaHtjJAfXiWPniWEHcayRoCMypfgeLD_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from 7of9.schinagl.nl ([88.159.158.68]:47152 "EHLO 7of9.schinagl.nl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752304AbcDSN1u (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Tue, 19 Apr 2016 09:27:50 -0400
In-Reply-To: <CAPybu_02_5pZ6pMkXwaHtjJAfXiWPniWEHcayRoCMypfgeLD_w@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Richard Purdie <rpurdie@rpsys.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Peter Meerwald <pmeerw@pmeerw.net>

Hey Ricardo,

On 19-04-16 13:18, Ricardo Ribalda Delgado wrote:
> Hi Ollivier
>
> Sorry to not reply to the patches, but I am not subscribed to linux-leds
>
> Regarding:
> [PATCH 2/6] leds: pca963x: Lock i2c r/w access
>
> I am not sure why this patch is needed. the only thing that should be
> protected is the write to ledout.
>
> It seems that mode2 needs to be set to PCA963X_MODE2_DMBLNK, or at
> least, the driver never clears that bit. Couldnt we just set it at
> probe time and remove the read/write of it? I do not have the hardware
> at the moment, so it should be something that you need to test.
Without actually looking at the code right now, but the driver does a 
read/modify/write on the register, and a register is shared among 
several leds. So in that regard, it makes sense and I don't think it's 
very expensive to move the lock, since we have to lock for the write a 
few lines down anyway.
>
> [PATCH 4/6] leds: pca963x: Reduce magic values
> Maybe you want to create the inverse macro of PCA963X_LEDOUT_LDR, so
> you can do something linke
>
> PCA963X_LEDOUT_LDR_INV(ledout, pca963x->led_num) != PCA963X_LEDOUT_LED_GRP_PWM
Good point, I'll add it, I like it.
>
>
> [PATCH 3/6] leds: pca963x: Add defines and remove some magic values
>
> I am not big fan of defining things that are not used. and the magic
> assigment to n_leds is perfectly fine IMHO
Well i needed some of the defines for the invert part and then I figured 
just add everything that the datasheet defines to make everything 
exlusive/easy to use.

But I can remove unused defines if desired.
>
> For PCA963X_LEDOUT_LDR.  Do not forget the parenthesis around led_num.
> Also replace %4 with &3 to be consisten.t
Yeah, i'll check and fix that.
>
> Regards!
>
> On Tue, Apr 19, 2016 at 11:39 AM, Olliver Schinagl <oliver@schinagl.nl> wrote:
>> On 19-04-16 11:23, Jacek Anaszewski wrote:
>>> Hi Olliver,
>>>
>>> Thanks for the patches.
>>> Adding driver authors on cc.
>> Ah sorry about that, thanks. I guess get_maintainers doesn't do that.
>>
>> As for the compile bug, I'll fix that with v2, it only applies on the
>> intermediate patches, not on the whole set.
>>
>> Olliver
>>
>>> On 04/19/2016 09:40 AM, Olliver Schinagl wrote:
>>>> Using the pca963x for a while, I noticed something that may look like
>>>> some
>>>> i2c accessing issues where sometimes data was incorrectly written to the
>>>> bus,
>>>> possibly because we where not properly locking the i2c reads. Though I'm
>>>> not
>>>> familiar enough with the i2c framework to be certain reads need to be
>>>> locked
>>>> at all. A patch was added to properly lock i2c access more tightly.
>>>>
>>>> Furthermore there was no method to support inverted outputs. This series
>>>> adds a property to the device tree to inform the driver that the output
>>>> is inverted (active-high vs active-low).
>>>>
>>>> Additionally, this patch set does some cleanups to please checkpatch, and
>>>> removes a few magic values.
>>>>
>>>> Olliver Schinagl (6):
>>>>     leds: pca963x: Alphabetize headers
>>>>     leds: pca963x: Lock i2c r/w access
>>>>     leds: pca963x: Add defines and remove some magic values
>>>>     leds: pca963x: Reduce magic values
>>>>     leds: pca963x: Inform the output that it is inverted
>>>>     leds: pca963x: Remove whitespace and checkpatch problems
>>>>
>>>>    Documentation/devicetree/bindings/leds/pca963x.txt |   1 +
>>>>    drivers/leds/leds-pca963x.c                        | 243
>>>> ++++++++++++++-------
>>>>    include/linux/platform_data/leds-pca963x.h         |   1 +
>>>>    3 files changed, 171 insertions(+), 74 deletions(-)
>>>>
>>>
>
>
