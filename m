From: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv1 0/6] leds: pca9653x: support inverted outputs and cleanups
Date: Wed, 20 Apr 2016 10:56:51 +0200
Message-ID: <CAPybu_3=VdXR_X_00EiYMyhRPLsR40GW1kHS5rzdOkSzrCMVWg@mail.gmail.com>
References: <1461051650-18824-1-git-send-email-oliver@schinagl.nl>
 <5715F927.3030102@samsung.com> <5715FCE8.7080106@schinagl.nl>
 <CAPybu_02_5pZ6pMkXwaHtjJAfXiWPniWEHcayRoCMypfgeLD_w@mail.gmail.com>
 <57163252.5090000@schinagl.nl> <CAPybu_2uZqR4exnS08taVYyr=ziK+EzuJy+_FxhbtqSiOE_=mw@mail.gmail.com>
 <57172DFA.9030107@schinagl.nl> <CAPybu_2fys29MUTBCDPb+tpfCgbr9SL+LXq061Tq20_z7UO-Vg@mail.gmail.com>
 <5717430D.30702@schinagl.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5717430D.30702-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olliver Schinagl <oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>
Cc: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux LED Subsystem <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

Hi

On Wed, Apr 20, 2016 at 10:51 AM, Olliver Schinagl <oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org> wrote:

>> As I said before, the reason for this proposal is that the code NEVER
>> clears PCA963X_MODE2_DMBLNK, only sets it.
>> Unfortunately I do not have the HW to test this change.
>
> The code never clears it, but the hardware does. So we have to set it
> everytime we enable blink.

Ok, that was the part I was missing. I was not aware that the hw was
clearing it.

Saving mode2 sounds like a good compromise then.

But I still believe that we should limit the lock to ledout. No matter
what we do, we cannot have two leds blinking at different frequencies
on the same chip.


Regards

-- 
Ricardo Ribalda
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
