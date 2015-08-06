From: Toshi Kikuchi <toshik@chromium.org>
Subject: Re: [PATCH v2] leds: lp55xx: avoid dereferencing a stale
 platform_data pointer
Date: Thu, 6 Aug 2015 12:13:14 -0700
Message-ID: <CALMyts6zZs5Mzyw3z8MH0N=1CuhL0iWEdjyUvKmGgYf1ekoSUg@mail.gmail.com>
References: <1438679930-26080-1-git-send-email-toshik@chromium.org>
	<55C31892.1030008@ti.com>
	<CALMyts6-uW87g6Y_j480QfqF3ujV0mWJtMO-pGS_pkXoisuY_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ig0-f173.google.com ([209.85.213.173]:36659 "EHLO
	mail-ig0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753678AbbHFTNR (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 6 Aug 2015 15:13:17 -0400
Received: by igbij6 with SMTP id ij6so17511956igb.1
        for <linux-leds@vger.kernel.org>; Thu, 06 Aug 2015 12:13:17 -0700 (PDT)
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com. [209.85.223.178])
        by smtp.gmail.com with ESMTPSA id b32sm5140188iod.16.2015.08.06.12.13.15
        for <linux-leds@vger.kernel.org>
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Aug 2015 12:13:15 -0700 (PDT)
Received: by iodb91 with SMTP id b91so31046960iod.1
        for <linux-leds@vger.kernel.org>; Thu, 06 Aug 2015 12:13:14 -0700 (PDT)
In-Reply-To: <CALMyts6-uW87g6Y_j480QfqF3ujV0mWJtMO-pGS_pkXoisuY_w@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: "Kim, Milo" <milo.kim@ti.com>
Cc: linux-leds@vger.kernel.org

Hi Milo,

On Thu, Aug 6, 2015 at 1:38 AM, Toshi Kikuchi <toshik@chromium.org> wrote:
>> May I ask you something? Could you check attached patch if available? I
>> can't test it on real target board at this moment. I would appreciate if you
>> could test my code.
>
> Sure. I'll test the patch and let you know the result.

I just tested it and it works fine.

Toshi
