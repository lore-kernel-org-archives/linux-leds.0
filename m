From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: Re: [PATCHv1 0/6] leds: pca9653x: support inverted outputs and cleanups
Date: Wed, 20 Apr 2016 11:17:38 +0200
Message-ID: <CAPybu_2WXdGck_FtW2MQEiPU-oXA6yz8W3jGkUnABfbir82Jdg@mail.gmail.com>
References: <1461051650-18824-1-git-send-email-oliver@schinagl.nl>
 <5715F927.3030102@samsung.com> <5715FCE8.7080106@schinagl.nl>
 <CAPybu_02_5pZ6pMkXwaHtjJAfXiWPniWEHcayRoCMypfgeLD_w@mail.gmail.com>
 <57163252.5090000@schinagl.nl> <CAPybu_2uZqR4exnS08taVYyr=ziK+EzuJy+_FxhbtqSiOE_=mw@mail.gmail.com>
 <57172DFA.9030107@schinagl.nl> <CAPybu_2fys29MUTBCDPb+tpfCgbr9SL+LXq061Tq20_z7UO-Vg@mail.gmail.com>
 <5717430D.30702@schinagl.nl> <CAPybu_3=VdXR_X_00EiYMyhRPLsR40GW1kHS5rzdOkSzrCMVWg@mail.gmail.com>
 <571746A2.8040609@schinagl.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f47.google.com ([74.125.82.47]:35954 "EHLO
	mail-wm0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932079AbcDTJR7 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 20 Apr 2016 05:17:59 -0400
In-Reply-To: <571746A2.8040609@schinagl.nl>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Olliver Schinagl <oliver@schinagl.nl>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Richard Purdie <rpurdie@rpsys.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Peter Meerwald <pmeerw@pmeerw.net>

Hello again

On Wed, Apr 20, 2016 at 11:06 AM, Olliver Schinagl <oliver@schinagl.nl> wrote:

> The devil is in the details :)
:)
>>
>> Saving mode2 sounds like a good compromise then.
>>
>> But I still believe that we should limit the lock to ledout. No matter
>> what we do, we cannot have two leds blinking at different frequencies
>> on the same chip.
>
> So to save a mutex a little bit, we take the risk that nobody else enables
> the blink or if they do, enable it in the same way?
> If it saves so much, then I guess its worth the risk I suppose?

Give me a day to go through the chip doc and see if I can find a good
compromise, that at least warranties that the leds that are enable
stay enabled ;)

Regards!



-- 
Ricardo Ribalda
