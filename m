From: Toshi Kikuchi <toshik@chromium.org>
Subject: Re: [PATCH v2] leds: lp55xx: avoid dereferencing a stale
 platform_data pointer
Date: Thu, 6 Aug 2015 01:38:55 -0700
Message-ID: <CALMyts6-uW87g6Y_j480QfqF3ujV0mWJtMO-pGS_pkXoisuY_w@mail.gmail.com>
References: <1438679930-26080-1-git-send-email-toshik@chromium.org>
	<55C31892.1030008@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ig0-f178.google.com ([209.85.213.178]:36376 "EHLO
	mail-ig0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754029AbbHFIi6 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 6 Aug 2015 04:38:58 -0400
Received: by igbij6 with SMTP id ij6so6682071igb.1
        for <linux-leds@vger.kernel.org>; Thu, 06 Aug 2015 01:38:57 -0700 (PDT)
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com. [209.85.213.178])
        by smtp.gmail.com with ESMTPSA id d4sm944280igl.1.2015.08.06.01.38.56
        for <linux-leds@vger.kernel.org>
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Aug 2015 01:38:56 -0700 (PDT)
Received: by igbij6 with SMTP id ij6so6681706igb.1
        for <linux-leds@vger.kernel.org>; Thu, 06 Aug 2015 01:38:55 -0700 (PDT)
In-Reply-To: <55C31892.1030008@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: "Kim, Milo" <milo.kim@ti.com>
Cc: linux-leds@vger.kernel.org

Hi Milo,

On Thu, Aug 6, 2015 at 1:19 AM, Kim, Milo <milo.kim@ti.com> wrote:
> Your patch is good but I just found that I should modify lp55xx_of_populate_pdata().
> Allocated platform data should not be pointed to I2C device platform data.

Yes, I like your new patch better. We don't have to modify the i2c
device platform data in the first place.

> May I ask you something? Could you check attached patch if available? I
> can't test it on real target board at this moment. I would appreciate if you
> could test my code.

Sure. I'll test the patch and let you know the result.

Thanks,
Toshi
