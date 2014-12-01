From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH/RFC v8 09/14] mfd: max77693: adjust
 max77693_led_platform_data
Date: Mon, 1 Dec 2014 12:53:47 +0000
Message-ID: <20141201125347.GC12068@x1>
References: <1417166286-27685-1-git-send-email-j.anaszewski@samsung.com>
 <1417166286-27685-10-git-send-email-j.anaszewski@samsung.com>
 <20141201113430.GC15845@x1>
 <547C63F4.4060203@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qa0-f45.google.com ([209.85.216.45]:52728 "EHLO
	mail-qa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753358AbaLAMxy (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 1 Dec 2014 07:53:54 -0500
Received: by mail-qa0-f45.google.com with SMTP id x12so7028018qac.4
        for <linux-leds@vger.kernel.org>; Mon, 01 Dec 2014 04:53:54 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <547C63F4.4060203@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kyungmin.park@samsung.com, b.zolnierkie@samsung.com, pavel@ucw.cz, cooloney@gmail.com, rpurdie@rpsys.net, sakari.ailus@iki.fi, s.nawrocki@samsung.com, Andrzej Hajda <a.hajda@samsung.com>, SangYoung Son <hello.son@smasung.com>, Samuel Ortiz <sameo@linux.intel.com>

On Mon, 01 Dec 2014, Jacek Anaszewski wrote:
> On 12/01/2014 12:34 PM, Lee Jones wrote:
> >On Fri, 28 Nov 2014, Jacek Anaszewski wrote:
> >
> >I'm guessing this will effect the other patches in the set?
> >
>=20
> max77692 flash driver depends on it and it has to be
> in synch with the related DT bindings patch.

Very well.  Providing you address the commitlog issues:

Acked-by: Lee Jones <lee.jones@linaro.org>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
