From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH v3 1/3] leds: triggers: Allow to switch the trigger to
 "panic" on a kernel panic
Date: Fri, 6 May 2016 10:05:06 -0300
Message-ID: <CAAEAJfD_U1Z=wXQbK+DNdhZj5KEDkd3sK8mbBLNOvtKbZd1zYg@mail.gmail.com>
References: <1461881020-13964-1-git-send-email-ezequiel@vanguardiasur.com.ar>
	<1461881020-13964-2-git-send-email-ezequiel@vanguardiasur.com.ar>
	<57230B26.9010300@samsung.com>
	<572C5DEE.3070307@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f51.google.com ([74.125.82.51]:34831 "EHLO
	mail-wm0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757920AbcEFNFI convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 6 May 2016 09:05:08 -0400
Received: by mail-wm0-f51.google.com with SMTP id e201so57105437wme.0
        for <linux-leds@vger.kernel.org>; Fri, 06 May 2016 06:05:07 -0700 (PDT)
In-Reply-To: <572C5DEE.3070307@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Richard Purdie <rpurdie@rpsys.net>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>

On 6 May 2016 at 06:03, Jacek Anaszewski <j.anaszewski@samsung.com> wro=
te:
> On 04/29/2016 09:20 AM, Jacek Anaszewski wrote:
>>
>> Hi Ezequiel,
>>
>> Thanks for the update. It's indeed reasonable to have all the
>> switching infrastructure in ledtrig-panic.c.
>>
>> I've noticed two minor issues below.
>
>
> Since the merge window is imminent, I've addressed those issues by
> myself and applied the patch set to the for-next branch
> of linux-leds.git.
>

Thanks a lot for taking care of this, Jacek!
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
