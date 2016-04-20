From: Olliver Schinagl <oliver@schinagl.nl>
Subject: Re: [PATCHv1 0/6] leds: pca9653x: support inverted outputs and
 cleanups
Date: Wed, 20 Apr 2016 09:21:30 +0200
Message-ID: <57172DFA.9030107@schinagl.nl>
References: <1461051650-18824-1-git-send-email-oliver@schinagl.nl>
 <5715F927.3030102@samsung.com> <5715FCE8.7080106@schinagl.nl>
 <CAPybu_02_5pZ6pMkXwaHtjJAfXiWPniWEHcayRoCMypfgeLD_w@mail.gmail.com>
 <57163252.5090000@schinagl.nl>
 <CAPybu_2uZqR4exnS08taVYyr=ziK+EzuJy+_FxhbtqSiOE_=mw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from 7of9.schinagl.nl ([88.159.158.68]:55224 "EHLO 7of9.schinagl.nl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753591AbcDTHVq (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Wed, 20 Apr 2016 03:21:46 -0400
In-Reply-To: <CAPybu_2uZqR4exnS08taVYyr=ziK+EzuJy+_FxhbtqSiOE_=mw@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Richard Purdie <rpurdie@rpsys.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Peter Meerwald <pmeerw@pmeerw.net>

Hey Ricardo,

On 19-04-16 15:42, Ricardo Ribalda Delgado wrote:
> Hi again
>
> On Tue, Apr 19, 2016 at 3:27 PM, Olliver Schinagl <oliver@schinagl.nl> wrote:
>> Hey Ricardo,
>> Without actually looking at the code right now, but the driver does a
>> read/modify/write on the register, and a register is shared among several
>> leds. So in that regard, it makes sense and I don't think it's very
>> expensive to move the lock, since we have to lock for the write a few lines
>> down anyway.
> Actually, the code is only making sure that PCA963X_MODE2_DMBLNK is
> on. It is never cleared afterwards.
i do not think this can work at all actually.

While trying to move those lines to probe and thinking about the 
consequences, I noticed blink is now never enabled again.
E.g. the probe reads the blink bit at probe, updates its internal 
trigger to timer etc and now during probe, if there is no 
default-trigger, we now have the correct trigger set.

However, when we enable blink via the timer trigger for example, the 
blink_set() gets executed and it writes the blink bit.

mode2 = i2c_smbus_read_byte_data(pca963x->chip->client, PCA963X_MODE2);
  	if (!(mode2 & PCA963X_MODE2_DMBLNK))
  		i2c_smbus_write_byte_data(pca963x->chip->client, PCA963X_MODE2,
  			mode2 | PCA963X_MODE2_DMBLNK);


so after the read, we immediatly do a write.

Now I understand your concern, the i2c operations are slow and time 
consuming making the mutex very expensive.

The thing is, to be able to write the blink bit, we need to read the 
whole mode2 register, to do a proper read-modify-write. We don't know 
what's in the mode2 register and we only want to write the bit if it is 
actually not set to begin with, to save a i2c write operation.

We start this function already however with with two write calls of 
sequential registers, the grp and pwm enable registers. There is even a 
call to automatically update these registers, which I think we'd use 
i2c_master_send() to set the address via the auto-increment register and 
enable auto increment of these two registers. Now we reduced the 2 
seperate calls into one bigger 'faster' call. So 1 win there. But! it 
will require us however to change the other calls to disable auto 
increment via de mode1 register. Since this is an extra i2c_write 
operation, it makes the other i2c writes more expensive, which may 
happen much more often (enable blink only happens occasionally, changing 
the brightness may change a lot (fade in fade out).

So unless i'm totally misunderstanding something, I don't think we can 
safe much here at all.

The only win would be by not reading the mode2 in the mutex, but what if 
we read the register, someone else modifies it, and we write to it again?

olliver

>
> It will be great if you could set that bit on probe and remove those
> two lines and verify that it works on real hardware.
>
>
> The move of the lock can be a bit expensive. i2c writes can take a
> while to be performed, this is why only ledout was protected
> initially.
>
> Best regards
