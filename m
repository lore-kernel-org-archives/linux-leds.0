From: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv1 0/6] leds: pca9653x: support inverted outputs and cleanups
Date: Tue, 19 Apr 2016 13:18:14 +0200
Message-ID: <CAPybu_02_5pZ6pMkXwaHtjJAfXiWPniWEHcayRoCMypfgeLD_w@mail.gmail.com>
References: <1461051650-18824-1-git-send-email-oliver@schinagl.nl>
 <5715F927.3030102@samsung.com> <5715FCE8.7080106@schinagl.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5715FCE8.7080106-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olliver Schinagl <oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>
Cc: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux LED Subsystem <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

Hi Ollivier

Sorry to not reply to the patches, but I am not subscribed to linux-leds

Regarding:
[PATCH 2/6] leds: pca963x: Lock i2c r/w access

I am not sure why this patch is needed. the only thing that should be
protected is the write to ledout.

It seems that mode2 needs to be set to PCA963X_MODE2_DMBLNK, or at
least, the driver never clears that bit. Couldnt we just set it at
probe time and remove the read/write of it? I do not have the hardware
at the moment, so it should be something that you need to test.

[PATCH 4/6] leds: pca963x: Reduce magic values
Maybe you want to create the inverse macro of PCA963X_LEDOUT_LDR, so
you can do something linke

PCA963X_LEDOUT_LDR_INV(ledout, pca963x->led_num) != PCA963X_LEDOUT_LED_GRP_PWM


[PATCH 3/6] leds: pca963x: Add defines and remove some magic values

I am not big fan of defining things that are not used. and the magic
assigment to n_leds is perfectly fine IMHO

For PCA963X_LEDOUT_LDR.  Do not forget the parenthesis around led_num.
Also replace %4 with &3 to be consisten.t

Regards!

On Tue, Apr 19, 2016 at 11:39 AM, Olliver Schinagl <oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org> wrote:
> On 19-04-16 11:23, Jacek Anaszewski wrote:
>>
>> Hi Olliver,
>>
>> Thanks for the patches.
>> Adding driver authors on cc.
>
> Ah sorry about that, thanks. I guess get_maintainers doesn't do that.
>
> As for the compile bug, I'll fix that with v2, it only applies on the
> intermediate patches, not on the whole set.
>
> Olliver
>
>>
>> On 04/19/2016 09:40 AM, Olliver Schinagl wrote:
>>>
>>> Using the pca963x for a while, I noticed something that may look like
>>> some
>>> i2c accessing issues where sometimes data was incorrectly written to the
>>> bus,
>>> possibly because we where not properly locking the i2c reads. Though I'm
>>> not
>>> familiar enough with the i2c framework to be certain reads need to be
>>> locked
>>> at all. A patch was added to properly lock i2c access more tightly.
>>>
>>> Furthermore there was no method to support inverted outputs. This series
>>> adds a property to the device tree to inform the driver that the output
>>> is inverted (active-high vs active-low).
>>>
>>> Additionally, this patch set does some cleanups to please checkpatch, and
>>> removes a few magic values.
>>>
>>> Olliver Schinagl (6):
>>>    leds: pca963x: Alphabetize headers
>>>    leds: pca963x: Lock i2c r/w access
>>>    leds: pca963x: Add defines and remove some magic values
>>>    leds: pca963x: Reduce magic values
>>>    leds: pca963x: Inform the output that it is inverted
>>>    leds: pca963x: Remove whitespace and checkpatch problems
>>>
>>>   Documentation/devicetree/bindings/leds/pca963x.txt |   1 +
>>>   drivers/leds/leds-pca963x.c                        | 243
>>> ++++++++++++++-------
>>>   include/linux/platform_data/leds-pca963x.h         |   1 +
>>>   3 files changed, 171 insertions(+), 74 deletions(-)
>>>
>>
>>
>



-- 
Ricardo Ribalda
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
