From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCHi v6] leds: ipaq-micro: Implement brightness_set_blocking op
Date: Mon, 30 Nov 2015 09:47:48 +0100
Message-ID: <CACRpkdanfT2-rYTPjkPW1vz_gZCB_ZYx-TAPsR6fC67RE94wcg@mail.gmail.com>
References: <1447951707-21294-1-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:36824 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753315AbbK3Irs (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 30 Nov 2015 03:47:48 -0500
Received: by obdgf3 with SMTP id gf3so122772990obd.3
        for <linux-leds@vger.kernel.org>; Mon, 30 Nov 2015 00:47:48 -0800 (PST)
In-Reply-To: <1447951707-21294-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

On Thu, Nov 19, 2015 at 5:48 PM, Jacek Anaszewski
<j.anaszewski@samsung.com> wrote:

> Since brightness setting can sleep for this driver, implement
> brightness_set_blocking op, instead of brightness_set.
> It makes this driver compatible with LED triggers.
>
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> ---
> Changes from v5:
> - use newly introduced brightness_set_blocking op, which was deemed
>   a better solution that flags proposed at earlier stage
>   of LED core improvent patch sets

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
