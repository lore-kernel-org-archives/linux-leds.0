From: Olliver Schinagl <oliver@schinagl.nl>
Subject: Re: [PATCHv1 0/6] leds: pca9653x: support inverted outputs and
 cleanups
Date: Fri, 22 Apr 2016 09:21:35 +0200
Message-ID: <5719D0FF.7090800@schinagl.nl>
References: <1461051650-18824-1-git-send-email-oliver@schinagl.nl>
 <5715F927.3030102@samsung.com> <5715FCE8.7080106@schinagl.nl>
 <CAPybu_02_5pZ6pMkXwaHtjJAfXiWPniWEHcayRoCMypfgeLD_w@mail.gmail.com>
 <57163252.5090000@schinagl.nl>
 <CAPybu_2uZqR4exnS08taVYyr=ziK+EzuJy+_FxhbtqSiOE_=mw@mail.gmail.com>
 <57172DFA.9030107@schinagl.nl>
 <CAPybu_2fys29MUTBCDPb+tpfCgbr9SL+LXq061Tq20_z7UO-Vg@mail.gmail.com>
 <5717430D.30702@schinagl.nl>
 <CAPybu_3=VdXR_X_00EiYMyhRPLsR40GW1kHS5rzdOkSzrCMVWg@mail.gmail.com>
 <571746A2.8040609@schinagl.nl>
 <CAPybu_2WXdGck_FtW2MQEiPU-oXA6yz8W3jGkUnABfbir82Jdg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from 7of9.schinagl.nl ([88.159.158.68]:35182 "EHLO 7of9.schinagl.nl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751697AbcDVHVx (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Fri, 22 Apr 2016 03:21:53 -0400
In-Reply-To: <CAPybu_2WXdGck_FtW2MQEiPU-oXA6yz8W3jGkUnABfbir82Jdg@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Richard Purdie <rpurdie@rpsys.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Peter Meerwald <pmeerw@pmeerw.net>

Hi Ricardo,

On 20-04-16 11:17, Ricardo Ribalda Delgado wrote:
> Hello again
>
> On Wed, Apr 20, 2016 at 11:06 AM, Olliver Schinagl <oliver@schinagl.nl> wrote:
>
>> The devil is in the details :)
> :)
>>> Saving mode2 sounds like a good compromise then.
>>>
>>> But I still believe that we should limit the lock to ledout. No matter
>>> what we do, we cannot have two leds blinking at different frequencies
>>> on the same chip.
>> So to save a mutex a little bit, we take the risk that nobody else enables
>> the blink or if they do, enable it in the same way?
>> If it saves so much, then I guess its worth the risk I suppose?
> Give me a day to go through the chip doc and see if I can find a good
> compromise, that at least warranties that the leds that are enable
> stay enabled ;)
Right, I also went over the datasheet, and I think we can simplyfy two 
things.

For one, yes, move the mode2 register completly to the probe section. 
Set the DMBLINK led to always 1. It does not get cleared, I was wrong. 
We have to set it to as with 0 we do not get any blinking at all 
(grpfreq gets ignored).

Furthermore, we should change:
  -    gdc = (time_on * 256) / period;
+   gdc = 0x00;

Because the calculation does not make sense. GDC is the global 
brightness/pwm/dimming control. It is used to uniformly change the blink 
rate on all the linked leds.

"General brightness for the 16 outputs is controlled through 256 linear 
steps to FFh"
I don't think that is the intention of the gdc is it? Looking at the 
original gdc code, it thus sets the global BRIGHTNESS based on the 
period/on_time. I don't think that is what we expect when we enable blink.

 From my understanding, the grppwm is super-imposed, thus by setting gdc 
to 0, we do not superimpose anything and the original brightness is 
retained. (If i'm wrong here, we need to set gdc to 0xff.

Because of this, I even recommend removing gdc all together, which saves 
another i2c write.

Or am I wrong here?

Olliver
>
> Regards!
>
>
>
