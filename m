Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B06EC433DB
	for <linux-leds@archiver.kernel.org>; Tue, 23 Feb 2021 20:06:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 646DF64E5C
	for <linux-leds@archiver.kernel.org>; Tue, 23 Feb 2021 20:06:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233158AbhBWUGo (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Tue, 23 Feb 2021 15:06:44 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:38611 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234117AbhBWUFn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 23 Feb 2021 15:05:43 -0500
Received: from [192.168.1.155] ([77.9.11.4]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1M4ahC-1lE5Nt2jYc-001gHD; Tue, 23 Feb 2021 21:02:03 +0100
Subject: Re: [PATCH v2] leds: apu: extend support for PC Engines APU1 with
 newer firmware
To:     =?UTF-8?Q?Zbyn=c4=9bk_Kocur?= <zbynek.kocur@fel.cvut.cz>,
        =?UTF-8?Q?Petr_=c5=a0tetiar?= <ynezz@true.cz>
Cc:     Andreas Eberlein <foodeas@aeberlein.de>,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210216133028.4025-1-foodeas@aeberlein.de>
 <c7eebbb6-df0c-51df-7701-ecb8f6543466@metux.net>
 <20210219143711.GA28202@meh.true.cz>
 <1E2EF21D-A304-46C4-9370-4FEBFD4767D2@fel.cvut.cz>
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
Message-ID: <54ec502e-2607-3096-d69f-d0c13fc1ba24@metux.net>
Date:   Tue, 23 Feb 2021 21:02:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1E2EF21D-A304-46C4-9370-4FEBFD4767D2@fel.cvut.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ahXRts938VIxmZ4V4+bpC3pIA/5kB7OX+6fBkFq9nobtfKM2L3e
 UqqA2YD3jbyQjGDUAdqNpWV+ixPEeim+NvpVIYXK4t75/j+s+06rF57oGgfoUrsYnpaiEsH
 fYW4u/GEUksF4zqFNHbt3Ps2SI5nNRTjsdB5PvcvXoFyiGFQ+/U6B+rQX/z1wJij1RPHAz2
 RYI9L27AyKLBZLIWtRpDg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+OoslpCMGts=:iyO5a4K7dDA92cG3Mcorz5
 5Tcc3e7k7CJ1TEJSYlMBjkN9iZn+CKA2HcBDUMlUCbZtPkwdiAEn5Wqk9sVTdo8a35VmNsbn5
 7iAMHFSeXRmrQNIkk+uFD+kkXGof0KJf4zNxIzc5c2zxx84RqiHp5mQwV1NWiCvncjxbO1l8C
 uFYuXcbcTSLzIFl0+7d8qd/C1ES2PCdkJHotmMdjhWCsOwzvt8ljWGlQjb2tgGq4kuCeatq8B
 b4GedEZpYRxMa7nnbj+oij2avxDFQIqWyw1zxnMjDS3YiPsGjc6w0AQprM2FhRMO9vwxR/mDu
 wRsK1x/axYwSeQD+jFyjPOW6x5YHdtj1vaavRygpV/ie/CkfjbgsITUt17i7k6La5jWZOpByB
 qKLZcgapcaEWBi1B6hlNcRW/ofQrdR0t6QbXhm9K2DMOtZcdfur4+oqhdJA7k
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 19.02.21 21:51, Zbyněk Kocur wrote:

Hi Zbyněk,

> Thanks for adding to the discussion. I tested the proposed modification on APU1 with different versions of bios.
> The LED subsystem now behaves the same as the APU2 and higher. If it needs more tests on various boards
>   from PCengines, I'm available.

Do you also happen to have different apu2/3/4 boards (various hw revs
and bios versions) for testing ? I've still got some open issues, eg.
regarding pcie reset lines, etc.


--mtx

-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
