From: Olliver Schinagl <oliver@schinagl.nl>
Subject: Re: [PATCHv1 0/6] leds: pca9653x: support inverted outputs and
 cleanups
Date: Wed, 20 Apr 2016 10:51:25 +0200
Message-ID: <5717430D.30702@schinagl.nl>
References: <1461051650-18824-1-git-send-email-oliver@schinagl.nl>
 <5715F927.3030102@samsung.com> <5715FCE8.7080106@schinagl.nl>
 <CAPybu_02_5pZ6pMkXwaHtjJAfXiWPniWEHcayRoCMypfgeLD_w@mail.gmail.com>
 <57163252.5090000@schinagl.nl>
 <CAPybu_2uZqR4exnS08taVYyr=ziK+EzuJy+_FxhbtqSiOE_=mw@mail.gmail.com>
 <57172DFA.9030107@schinagl.nl>
 <CAPybu_2fys29MUTBCDPb+tpfCgbr9SL+LXq061Tq20_z7UO-Vg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from 7of9.schinagl.nl ([88.159.158.68]:60934 "EHLO 7of9.schinagl.nl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751324AbcDTIvf (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Wed, 20 Apr 2016 04:51:35 -0400
In-Reply-To: <CAPybu_2fys29MUTBCDPb+tpfCgbr9SL+LXq061Tq20_z7UO-Vg@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Richard Purdie <rpurdie@rpsys.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Peter Meerwald <pmeerw@pmeerw.net>

Hey Ricardo,

On 20-04-16 10:01, Ricardo Ribalda Delgado wrote:
> Hi Ollivier
>
>
> On Wed, Apr 20, 2016 at 9:21 AM, Olliver Schinagl <oliver@schinagl.nl> wrote:
>
> What I am propossing is at probe():
>
> replace:
>
> if (pdata) {
> /* Configure output: open-drain or totem pole (push-pull) */
> if (pdata->outdrv == PCA963X_OPEN_DRAIN)
> i2c_smbus_write_byte_data(client, PCA963X_MODE2, 0x01);
> else
> i2c_smbus_write_byte_data(client, PCA963X_MODE2, 0x05);
> }
>
> with something like (forgive the spacing):
>
>
> u8 mode2 = PCA963X_MODE2_DMBLNK | 0x1;
> if (pdata && pdata->outdrv == PCA963X_OPEN_DRAIN)
>     mode2 |= 0x4;
> i2c_smbus_write_byte_data(pca963x->chip->client, PCA963X_MODE2, mode2);
>
>
> and then remove from pca963x_blink() these lines:
>
> u8 mode2 = i2c_smbus_read_byte_data(pca963x->chip->client,
> PCA963X_MODE2);
>
> if (!(mode2 & PCA963X_MODE2_DMBLNK))
> i2c_smbus_write_byte_data(pca963x->chip->client, PCA963X_MODE2,
> mode2 | PCA963X_MODE2_DMBLNK);
>
> As I said before, the reason for this proposal is that the code NEVER
> clears PCA963X_MODE2_DMBLNK, only sets it.
> Unfortunately I do not have the HW to test this change.
The code never clears it, but the hardware does. So we have to set it 
everytime we enable blink.

So I don't think this can work at all, as you now never enable blink 
(when you enable it from user space, at probe it works fine via the 
default trigger).

What about storing the mode2 register on the chip level, since we never 
change it after probe, and only toggle the blink bit in blink_set() and 
write the stored mode2 register

so i2c_write(pca963x->chip->mode2 | MODE2_DMBLNK)

The only advantage I see here though is that we save a read + (quite 
likley) potentially a write, with an always write. So it saves 1 i2c 
read command.

Olliver
>
>> Now I understand your concern, the i2c operations are slow and time
>> consuming making the mutex very expensive.
>>
>> The thing is, to be able to write the blink bit, we need to read the whole
>> mode2 register, to do a proper read-modify-write. We don't know what's in
>> the mode2 register and we only want to write the bit if it is actually not
>> set to begin with, to save a i2c write operation.
> As I said earlier, nowhere in the code clears that bit. The bit is
> only set. so no reason to read/modify/write. We can set that bit at
> probe time and assume that it will not be changed.
>
>> We start this function already however with with two write calls of
>> sequential registers, the grp and pwm enable registers. There is even a call
>> to automatically update these registers, which I think we'd use
>> i2c_master_send() to set the address via the auto-increment register and
>> enable auto increment of these two registers. Now we reduced the 2 seperate
>> calls into one bigger 'faster' call. So 1 win there. But! it will require us
>> however to change the other calls to disable auto increment via de mode1
>> register. Since this is an extra i2c_write operation, it makes the other i2c
>> writes more expensive, which may happen much more often (enable blink only
>> happens occasionally, changing the brightness may change a lot (fade in fade
>> out).
> Be careful with that. Sometimes this chips are connected to the smbus,
> wich has a limited number of operations/lengths. We should keep the
> i2c_smbus_write_byte_data() call, because that makes the driver
> compatible with more hardware.
>
>> So unless i'm totally misunderstanding something, I don't think we can safe
>> much here at all.
> To be clear: My proposal is that (after being tested), move the set of
> DMBLINK to probe, remove the read/modify/write from blink() and keep
> the locking as it is now, only protecting ledout.
>
> Also you need to fix the patch that breaks bisect, but I believe that
> you are already working on that.
>
> I have reviewed a bit Documentation/device-tree and it seems that
> there is already a binding for active-low. Instead of nxp,active-low
> you should call it just active-low. But I am not a device-tree expert.
>
> Finally, you mention that you are fixing some checkpatch errors, but I
> cannot replicate those in my side :S
>
> ricardo@pilix:~/curro/linux$ scripts/checkpatch.pl -f
> drivers/leds/leds-pca963x.c
> total: 0 errors, 0 warnings, 439 lines checked
>
> drivers/leds/leds-pca963x.c has no obvious style problems and is ready
> for submission.
>
> So maybe the errors you are fixing are introduced by your patches.
> About the other style patches, I do not know what is the policy of the
> Maintainer in that matter, especially when the driver did not break
> originally checkpatch.
>
>
>
> Regards!
>
>
> ---
> Ricardo
