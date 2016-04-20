From: Olliver Schinagl <oliver@schinagl.nl>
Subject: Re: [PATCHv1 0/6] leds: pca9653x: support inverted outputs and
 cleanups
Date: Wed, 20 Apr 2016 12:12:49 +0200
Message-ID: <57175621.4070307@schinagl.nl>
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
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAPybu_2WXdGck_FtW2MQEiPU-oXA6yz8W3jGkUnABfbir82Jdg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Richard Purdie <rpurdie@rpsys.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Peter Meerwald <pmeerw@pmeerw.net>
List-Id: linux-leds@vger.kernel.org

Hey,

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
sure thing. I have read the docs quite a few times for using it directly 
via i2c, but yeah I'll wait.
>
> Regards!
>
>
>
