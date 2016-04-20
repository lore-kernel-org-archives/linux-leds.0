From: Olliver Schinagl <oliver@schinagl.nl>
Subject: Re: [PATCHv1 0/6] leds: pca9653x: support inverted outputs and
 cleanups
Date: Wed, 20 Apr 2016 11:06:42 +0200
Message-ID: <571746A2.8040609@schinagl.nl>
References: <1461051650-18824-1-git-send-email-oliver@schinagl.nl>
 <5715F927.3030102@samsung.com> <5715FCE8.7080106@schinagl.nl>
 <CAPybu_02_5pZ6pMkXwaHtjJAfXiWPniWEHcayRoCMypfgeLD_w@mail.gmail.com>
 <57163252.5090000@schinagl.nl>
 <CAPybu_2uZqR4exnS08taVYyr=ziK+EzuJy+_FxhbtqSiOE_=mw@mail.gmail.com>
 <57172DFA.9030107@schinagl.nl>
 <CAPybu_2fys29MUTBCDPb+tpfCgbr9SL+LXq061Tq20_z7UO-Vg@mail.gmail.com>
 <5717430D.30702@schinagl.nl>
 <CAPybu_3=VdXR_X_00EiYMyhRPLsR40GW1kHS5rzdOkSzrCMVWg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from 7of9.schinagl.nl ([88.159.158.68]:38450 "EHLO 7of9.schinagl.nl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751936AbcDTJGu (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Wed, 20 Apr 2016 05:06:50 -0400
In-Reply-To: <CAPybu_3=VdXR_X_00EiYMyhRPLsR40GW1kHS5rzdOkSzrCMVWg@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Richard Purdie <rpurdie@rpsys.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Peter Meerwald <pmeerw@pmeerw.net>



On 20-04-16 10:56, Ricardo Ribalda Delgado wrote:
> Hi
>
> On Wed, Apr 20, 2016 at 10:51 AM, Olliver Schinagl <oliver@schinagl.nl> wrote:
>
>>> As I said before, the reason for this proposal is that the code NEVER
>>> clears PCA963X_MODE2_DMBLNK, only sets it.
>>> Unfortunately I do not have the HW to test this change.
>> The code never clears it, but the hardware does. So we have to set it
>> everytime we enable blink.
> Ok, that was the part I was missing. I was not aware that the hw was
> clearing it.
The devil is in the details :)
> Saving mode2 sounds like a good compromise then.
>
> But I still believe that we should limit the lock to ledout. No matter
> what we do, we cannot have two leds blinking at different frequencies
> on the same chip.
So to save a mutex a little bit, we take the risk that nobody else 
enables the blink or if they do, enable it in the same way?
If it saves so much, then I guess its worth the risk I suppose?
>
>
> Regards
>
