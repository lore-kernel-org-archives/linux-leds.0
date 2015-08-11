From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH/RFC v5 41/57] leds: syscon: Use brightness_set_nonblocking op
Date: Tue, 11 Aug 2015 14:54:52 +0200
Message-ID: <CACRpkdYRbrh5MUckKQ9mWBVZ5Nxu13e6_HnxUq-HugqKCR8F=w@mail.gmail.com>
References: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
	<1439285890-27329-42-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:34864 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751664AbbHKMyw (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 11 Aug 2015 08:54:52 -0400
Received: by obbop1 with SMTP id op1so147699692obb.2
        for <linux-leds@vger.kernel.org>; Tue, 11 Aug 2015 05:54:52 -0700 (PDT)
In-Reply-To: <1439285890-27329-42-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Stas Sergeev <stsp@users.sourceforge.net>

On Tue, Aug 11, 2015 at 11:37 AM, Jacek Anaszewski
<j.anaszewski@samsung.com> wrote:

> The driver neither sleeps nor uses delays in its brightness_set op.
> Use a new brightness_set_nonblocking op instead of brightness_set for
> setting brightness then.
>
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
