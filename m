From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2] LED/MIPS: Move SEAD3 LED driver to where it belongs.
Date: Fri, 18 Sep 2015 19:49:21 -0700
Message-ID: <55FCCD31.7020505@gmail.com>
References: <20150803150401.GD2843@linux-mips.org>
 <55FA7BA0.4080706@samsung.com> <20150918210549.GD16992@NP-P-BURTON>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:36238 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752752AbbISCtZ (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 18 Sep 2015 22:49:25 -0400
Received: by oibi136 with SMTP id i136so35894608oib.3
        for <linux-leds@vger.kernel.org>; Fri, 18 Sep 2015 19:49:24 -0700 (PDT)
In-Reply-To: <20150918210549.GD16992@NP-P-BURTON>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Paul Burton <paul.burton@imgtec.com>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Markos Chandras <markos.chandras@imgtec.com>, linux-leds@vger.kernel.org, linux-mips@linux-mips.org

Le 09/18/15 14:05, Paul Burton a =C3=A9crit :
> On Thu, Sep 17, 2015 at 10:36:48AM +0200, Jacek Anaszewski wrote:
>> Hi Ralf,
>>
>> This patch got stuck somewhere in my mailbox and just
>> recently showed up to my eyes again, so I applied it to v4.3-rc1, bu=
t when
>> tried to compile-test it, I got following errors:
>>
>> arch/mips/kernel/signal.c: In function 'sc_to_extcontext':
>> arch/mips/kernel/signal.c:143:12: error: 'struct ucontext' has no me=
mber
>> named 'uc_extcontext'
>>   return &uc->uc_extcontext;
>>             ^
>=20
> <snip...>
>=20
>> Compilation succeeds with v4.2-rc8.
>> Is it a known issue?
>=20
> Hi Jacek,
>=20
> The patches adding the MSA extended context added a MIPS-specific
> ucontext.h, where we were previously were using the generic one. Kbui=
ld
> doesn't automatically remove the old generated header that includes t=
he
> generic version, so could you try either cleaning your working tree o=
r
> removing arch/mips/include/generated and trying again?

I stumbled on that problem as well before, do you think there is
anything that could be done to track down the dependency here and
re-generate arch/mips/include/generated/ucontext.h? This build error is
not that easy to correlate with changes in ucontext.h.

Thanks!
--=20
=46lorian
